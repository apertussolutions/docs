SUFFIX=.xml

#build target databases for PDF and HTML
echo "[Building olink target databases]"
./make_olink_target_database.sh
#clean up

#find all xml files

FILES=`ls -1 *.xml`
#for d in $FILES
#do
	#strip the '.xml' suffix off
#	FILE=${d%.*l};
#	echo "[Building olink database for "$FILE"]"
	
	#make olink target database
#	xsltproc --stringparam  collect.xref.targets  "only" \
#	--stringparam  targets.filename $FILE.db \
#	"../../custom_doc.xsl" $FILE.xml
#	echo "[Target database generation complete]"
#done

for d in $FILES
do
	FILE=${d%.*l};
	
	echo "[Building doc output for "$FILE"]"
	
	#make doc output
	xsltproc --output $FILE.doc \
	--stringparam wordml.template "../../../doctools/docbook-xsl/roundtrip/template.xml" \
	"../../custom_doc.xsl" $FILE.xml
	echo "[Doc file generation complete]"
	
	DOC_PATH="../XenClient/en_us/docbook/public/";
	HTML_SUFFIX=".html";

done
#clean up 
mv *.doc out/doc
scp -r out/doc/* gordonst@boiler.cam.xci-test.com:/home/xc_dist/docs



