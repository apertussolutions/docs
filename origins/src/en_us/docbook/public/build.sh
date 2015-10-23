#!/bin/bash
#
# Copyright (c) 2014 Citrix Systems, Inc.
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

export JAVA_OPTS=-Djava.awt.headless=true

SUFFIX=.xml

mkdir -p out
mkdir -p out/html
mkdir -p out/html/images
mkdir -p out/pdf
mkdir -p out/fo_debug
mkdir -p out/flat_xml_debug


#build target databases for PDF and HTML
echo "[Building olink target databases]"
./make_olink_target_database.sh || exit 1

#copy fonts to xml source directory
cp -r ../../../../fonts . 

#find all xml files

FILES=`ls -1 *.xml`
for d in $FILES
do
	#strip the '.xml' suffix off
	FILE=${d%.*l};
	echo "[Building olink database for "$FILE"]"
	
	#make olink target database
	xsltproc --xinclude --stringparam  collect.xref.targets  "only" \
	--stringparam  targets.filename $FILE.db \
	"../../custom_fo.xsl" $FILE.xml || exit 1
	
#	if [$? -eq 6];
#	then
#		echo "[Failed to parse "$FILE"]"
#		exit 1	
#	fi
	echo "[Target database generation complete]"
	
	echo "[Building flat xml for debug]"
	xsltproc --xinclude --output ${FILE}_flat.xml ../../../../doctools/copy.xsl $FILE.xml || exit 1
	
done

	mv *_flat.xml out/flat_xml_debug

for d in $FILES
do
	FILE=${d%.*l};
	
	echo "[Building FO output for "$FILE"]"
	
	#make fo output
	xsltproc --xinclude --output $FILE.fo \
	--stringparam target.database.document \
	"olink_targets.db" \
	--stringparam current.docid $FILE \
	"../../custom_fo.xsl" $FILE.xml || exit 1 
	echo "[FO file generation complete]"
	
	
	#Hack to get the  
	
	#echo ${FILE:0:2}____
	
	if [ ${FILE:0:2} = "XT" ];
	then
		sed -i -e "s/___PRODUCT_BRAND___/XenClient XT/g" ${FILE}.fo 
	fi
	
	if [ ${FILE:0:2} = "Xe" ];
	then
		sed -i -e "s/___PRODUCT_BRAND___/XenClient/g" ${FILE}.fo 
	fi

	if [ ${FILE:0:2} = "Sy" ];
	then
		sed -i -e "s/___PRODUCT_BRAND___/XenClient/g" ${FILE}.fo 
	fi
	
	cp $FILE.fo out/fo_debug	
	
	#make the PDFs   
	../../../../doctools/fop-1.0/fop -c \
	"../../../../fo_user_config.xml" $FILE.fo $FILE.pdf || exit 1
	echo "[PDF file generation complete]"
done
#clean up 
rm *.fo
rm -r fonts
mv *.pdf out/pdf
cp *.xml out/pdf
exit 0
#scp -r out/pdf/* gordonst@boiler.cam.xci-test.com:/home/xc_dist/docs
