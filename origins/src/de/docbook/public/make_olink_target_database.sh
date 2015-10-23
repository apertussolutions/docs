FILES=`ls -1 *.xml`
touch olink_targets.db
rm olink_targets.db
touch olink_targets_html.db
rm olink_targets_html.db

echo \<\?xml version=\"1.0\" encoding=\"utf-8\"\?\> \
> olink_targets.db
echo \<!DOCTYPE targetset SYSTEM \"..\/..\/..\/..\/doctools\/docbook-xsl\/common\/targetdatabase.dtd\" \[ >> olink_targets.db
	for d in $FILES
	do
		#strip the '.xml' suffix off
		FILE=${d%.*l};	
		echo \<\!ENTITY $FILE SYSTEM \"$FILE.db\"\> >> olink_targets.db
	done
echo \]\> >> olink_targets.db

echo \<targetset\> >> olink_targets.db
echo 	\<targetsetinfo\> >> olink_targets.db
echo 	"Description of this target database document," >> olink_targets.db
echo 	"which is for the examples in olink doc." >> olink_targets.db
echo 	\<\/targetsetinfo\> >> olink_targets.db
echo 	\<\!\-\- Site map for generating relative paths between documents \-\-\> >> olink_targets.db
for d in $FILES
do
	#strip the '.xml' suffix off
	FILE=${d%.*l};
	echo 	\<sitemap\> >> olink_targets.db
	echo 		\<dir name=\".\"\> >> olink_targets.db
	echo 			\<document targetdoc=\"$FILE\" >> olink_targets.db
	echo 					baseuri=\"$FILE.pdf\"\>  >> olink_targets.db
	echo 				\&$FILE\; >> olink_targets.db
	echo 			\<\/document\> >> olink_targets.db
	echo 		\<\/dir\> >> olink_targets.db
	echo	 \<\/sitemap\> >> olink_targets.db
done
echo \<\/targetset\> >> olink_targets.db

#Make HTML target database
echo \<\?xml version=\"1.0\" encoding=\"utf-8\"\?\> \
> olink_targets_html.db
echo \<!DOCTYPE targetset SYSTEM \"..\/..\/..\/..\/doctools\/docbook-xsl\/common\/targetdatabase.dtd\" \[ >> olink_targets_html.db
	for d in $FILES
	do
		#strip the '.xml' suffix off
		FILE=${d%.*l};	
		echo \<\!ENTITY $FILE SYSTEM \"$FILE.db\"\> >> olink_targets_html.db
	done
echo \]\> >> olink_targets_html.db

echo \<targetset\> >> olink_targets_html.db
echo 	\<targetsetinfo\> >> olink_targets_html.db
echo 	"Description of this target database document," >> olink_targets_html.db
echo 	"which is for the examples in olink doc." >> olink_targets_html.db
echo 	\<\/targetsetinfo\> >> olink_targets_html.db
echo 	\<\!\-\- Site map for generating relative paths between documents \-\-\> >> olink_targets_html.db
for d in $FILES
do
	#strip the '.xml' suffix off
	FILE=${d%.*l};
	echo 	\<sitemap\> >> olink_targets_html.db
	echo 		\<dir name=\".\"\> >> olink_targets_html.db
	echo 			\<document targetdoc=\"$FILE\" >> olink_targets_html.db
	echo 					baseuri=\"\"\>  >> olink_targets_html.db
	echo 				\&$FILE\; >> olink_targets_html.db
	echo 			\<\/document\> >> olink_targets_html.db
	echo 		\<\/dir\> >> olink_targets_html.db
	echo	 \<\/sitemap\> >> olink_targets_html.db
done
echo \<\/targetset\> >> olink_targets_html.db
