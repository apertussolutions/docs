SUFFIX=.xml

#build target databases for PDF and HTML
echo "[Building olink target databases]"
./make_olink_target_database.sh
#clean up
mkdir -p out/eclipse
touch plugin.xml
rm plugin.xml
touch toc.xml
rm toc.xml
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
	"../../custom_eclipse.xsl" $FILE.xml
	echo "[Target database generation complete]"
done

for d in $FILES
do
	FILE=${d%.*l};
	
	echo "[Building eclipse output for "$FILE"]"
	
	#make HTML output
	xsltproc  -stringparam base.dir out/eclipse/ \
	--stringparam target.database.document \
	"olink_targets_html.db" \
	--stringparam current.docid $FILE \
	"../../custom_eclipse.xsl" $FILE.xml
	echo "[eclipse file generation complete]"

	echo "[making eclipse jar]"
	sed -e "s/toc.xml/"$FILE".xml/g" < plugin.xml > plugin1.xml
	
	sed -e "s/<plugin>/<plugin name=\""$FILE"\" id=\""$FILE"\" version=\"1.0\" provider-name=\"DITA\">/g" < plugin1.xml > plugin2.xml
	
	mv plugin2.xml out/eclipse/$FILE/plugin.xml
	rm plugin1.xml
	rm plugin2.xml
	rm plugin.xml

	sed -e "s#out/eclipse/##g" < toc.xml > toc1.xml
	
	mv toc1.xml out/eclipse/$FILE/$FILE.xml
	
	rm toc.xml
	rm toc1.xml
	cp out/*.css out/eclipse/$FILE/
	cp -r images out/eclipse/$FILE/
	
	cd out/eclipse/$FILE/
	jar cvf $FILE.jar *
	cd ../../../
done
#clean up 
#mv *.html out/html
#cp -r images out/html
#scp -r out/html/* gordonst@boiler.cam.xci-test.com:/home/xc_dist/docs



