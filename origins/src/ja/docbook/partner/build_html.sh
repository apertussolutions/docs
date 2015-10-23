SUFFIX=.xml

#build target databases for PDF and HTML
echo "[Building olink target databases]"
./make_olink_target_database.sh
#clean up 
rm -f *.html

#copy fonts to xml source directory
cp -r ../../../../fonts . 

#copy the company logo over
cp ../../../../citrix_logo.png ./images

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
	"../../../../custom_html.xsl" $FILE.xml
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
	"../../../../custom_html.xsl" $FILE.xml
	echo "[HTML file generation complete]"
	

done
#clean up 
mv *.html out/html
cp -r images out/html/images

rm -r fonts