#!/bin/bash -ex
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
