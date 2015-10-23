#!/bin/bash -ex

mkdir -p pdf
rm -rf pdf/*

rm -rf tmp
cp -r src tmp

for lang in en_us; do
    mkdir pdf/${lang}
    docbook="tmp/${lang}/docbook"
    sed -i 's/___PRODUCT_BRAND___/XenClient XT/g' ${docbook}/shared/*.ent
    cd ${docbook}/public
    ./make_olink_target_database.sh
    cd -
    for doc in public/XTArchitectureGuide public/XTEngineAdministratorGuide public/XTEngineDeveloperGuide public/XTOfflineModeLicensing public/XTReleaseNotes public/XTSecurityAdvisoryFixes public/XTSynchronizerAdministratorGuide; do
	file="${docbook}/${doc}.xml"
	sed -i 's/___PRODUCT_BRAND___/XenClient XT/g' "$file"
#	docbook2pdf -o pdf "$file"
#	docbook2pdf -p /usr/bin/jade -o pdf "$file"
	a2x --xsl-file="tmp/${lang}/custom_fo.xsl" "$file"
	mv "${docbook}/${doc}.pdf" pdf/${lang}
    done
done

rm -rf tmp
