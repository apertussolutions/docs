<?xml version='1.0'?>
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">  

	<!-- 
		Imports common fo customizations file and 
		contains only the language-specific differences 
	-->

	<xsl:import href="../../common_fo.xsl"/> 
	<xsl:template name="book.verso.title">
	</xsl:template>
	<!-- Turn on auto-glossary generation -->
	<!--
	<xsl:param name="glossary.collection">glossary.xml</xsl:param>
	-->
<!--
	<xsl:attribute-set name="book.titlepage.recto.style">
		<xsl:attribute name="font-family">Garamond</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">rgb(77,79,83)</xsl:attribute>
	</xsl:attribute-set>
	
	-->
	<!-- Override default font for captions 
	<xsl:attribute-set name="caption.properties">
		<xsl:attribute name="font-family">Garamond</xsl:attribute>
		<xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
-->
	<!-- Override default fonts for general page areas 
	<xsl:attribute-set name="header.content.properties">
		<xsl:attribute name="font-family">Arial</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
	</xsl:attribute-set>
-->

<!--
	<xsl:attribute-set name="footer.content.properties">
		<xsl:attribute name="font-family">Garamond</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
	</xsl:attribute-set>
-->
	<xsl:attribute-set name="root.properties">
		<xsl:attribute name="font-family">Calibri</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
	</xsl:attribute-set>

	<!-- Override default fonts for monospace and verbatim -->
	
	<!--
	<xsl:param name="monospace.font.family" select="'Courier'" />
	<xsl:param name="verbatim.font.family" select="'Courier'" />
-->

<!--
	<xsl:attribute-set name="monospace.verbatim.properties">
		<xsl:attribute name="font-family">Courier</xsl:attribute>
		<xsl:attribute name="font-size">9pt</xsl:attribute>
		<xsl:attribute name="keep-together.within-column">always</xsl:attribute>
	</xsl:attribute-set>
-->
	<!--  Override default and make formal object title font-family Garamond-->
<!--	<xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
		<xsl:attribute name="font-family">Arial</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:value-of select="$body.font.master * 1.1"/>
			<xsl:text>pt</xsl:text>
		</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
	</xsl:attribute-set>
-->
</xsl:stylesheet>