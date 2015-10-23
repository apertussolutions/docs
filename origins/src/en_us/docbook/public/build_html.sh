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

SUFFIX=.xml

#build target databases for PDF and HTML
echo "[Building olink target databases]"
./make_olink_target_database.sh || exit 1

mv out/html/index.html out/html/index.not_html 
rm -f out/html/*.html
mv out/html/index.not_html out/html/index.html


#find all xml files

FILES=`ls -1 *.xml`
for d in $FILES
do
	#strip the '.xml' suffix off
	FILE=${d%.*l};
	echo "[Building olink database for "$FILE"]"
	
	#make olink target database
	xsltproc --stringparam  collect.xref.targets  "only" \
	--stringparam  targets.filename $FILE.db \
	"../../custom_html.xsl" $FILE.xml || exit 1
	echo "[Target database generation complete]"
done

for d in $FILES
do
	FILE=${d%.*l};
	
	echo "[Building HTML output for "$FILE"]"
	
	#make HTML output
	xsltproc  --output $FILE.html \
	--stringparam target.database.document \
	"olink_targets_html.db" \
	--stringparam current.docid $FILE \
	"../../custom_html.xsl" $FILE.xml || exit 1
	echo "[HTML file generation complete]"
	
	DOC_PATH="../XenClient/en_us/docbook/public/";
	HTML_SUFFIX=".html";
	
	echo "[Converting HTML to Citrix web style for "$FILE"]"
	java -cp ../../../../doctools/TemplateHtmlForWeb.jar TemplateHtmlForWeb ${FILE}${HTML_SUFFIX} en_us "1.3" || exit 1

done
#clean up 
mv *.html out/html
cp -r images out/html

exit 0
#scp -r out/html/* gordonst@boiler.cam.xci-test.com:/home/xc_dist/docs



