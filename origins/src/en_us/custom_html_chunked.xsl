<?xml version='1.0'?>
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
	 xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:import href="../../common_html_chunked.xsl"/>
	<xsl:attribute-set name="list.item.spacing">
		<xsl:attribute name="space-before.optimum">2px</xsl:attribute>
		<xsl:attribute name="space-before.minimum">1px</xsl:attribute>
		<xsl:attribute name="space-before.maximum">2.5px</xsl:attribute>
		<xsl:attribute name="space-after.optimum">2px</xsl:attribute>
		<xsl:attribute name="space-after.minimum">1px</xsl:attribute>
		<xsl:attribute name="space-after.maximum">2.5px</xsl:attribute>
	</xsl:attribute-set>
</xsl:stylesheet>
