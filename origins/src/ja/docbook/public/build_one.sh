SUFFIX=.xml

mkdir -p out
mkdir -p out/html
mkdir -p out/html/images
mkdir -p out/pdf
mkdir -p out/fo_debug
mkdir -p out/flat_xml_debug

#build target databases for PDF and HTML
echo "[Building olink target databases]"
./make_olink_target_database.sh

#copy fonts to xml source directory
cp -r ../../../../fonts . 

#copy the company logo over
cp ../../../../citrix_logo.png ./images

#find all xml files

FILES=$1

for d in $FILES
do
	#strip the '.xml' suffix off
	FILE=${d%.*l};
	echo "[Building olink database for "$FILE"]"
	
	#make olink target database
	xsltproc --xinclude --stringparam  collect.xref.targets  "only" \
	--stringparam  targets.filename $FILE.db \
	"../../custom_fo.xsl" $FILE.xml
	echo "[Target database generation complete]"
	
	echo "[Building flat xml for debug]"
	xsltproc --xinclude --output $FILE.xml.flat.xml ../../../../doctools/copy.xsl $FILE.xml
	
done

	mv *.xml.flat.xml out/flat_xml_debug
	
for d in $FILES
do
	FILE=${d%.*l};
	
	echo "[Building FO output for "$FILE"]"
	
	#make fo output
	xsltproc --xinclude --output $FILE.fo \
	--stringparam target.database.document \
	"olink_targets.db" \
	--stringparam current.docid $FILE \
	"../../custom_fo.xsl" $FILE.xml
	echo "[FO file generation complete]"

	cp $FILE.fo out/fo_debug	
	

	
	#make the PDFs
	../../../../doctools/fop-1.0/fop -c \
	"../../../../fo_user_config.xml" $FILE.fo $FILE.pdf
	echo "[PDF file generation complete]"
done
#clean up 
rm *.fo
rm -r fonts
mv *.pdf out/pdf