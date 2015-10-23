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
	<!-- override some imports -->
	
	
	<xsl:import href="citrix_toc.xsl"/> 
	<xsl:import href="citrix_page_design.xsl"/> 
	<!-- Override default font for titles -->
	<xsl:param name="title.font.family" select="'ArialUnicodeMS'" />

	<!-- Override default font for admonition titles... background-color changed to white 3/19/08 -->
	<xsl:attribute-set name="admonition.title.properties">
 		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="font-size">11pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
		<xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
		<xsl:attribute name="background-color">#FFFFFF</xsl:attribute>
	</xsl:attribute-set>

	<!-- Override default font for captions -->
	<xsl:attribute-set name="caption.properties">
  		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
    	<xsl:attribute name="font-size">10pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>

	<!-- Override default fonts for general page areas -->
	<xsl:attribute-set name="header.content.properties">
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="footer.content.properties">
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="root.properties">
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="hyphenate">false</xsl:attribute>
	</xsl:attribute-set>

	<!-- Override default fonts for monospace and verbatim -->
	<xsl:param name="monospace.font.family" select="'ArialUnicodeMS'" />
	<xsl:param name="verbatim.font.family" select="'ArialUnicodeMS'" />

	<xsl:attribute-set name="monospace.verbatim.properties">
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="font-size">9pt</xsl:attribute>
		<xsl:attribute name="keep-together.within-column">always</xsl:attribute>
	</xsl:attribute-set>

	<!--  Override default and make formal object title font-family Arial-->
	<xsl:attribute-set name="formal.title.properties" use-attribute-sets="normal.para.spacing">
  		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
  		<xsl:attribute name="font-size">
    		<xsl:value-of select="$body.font.master * 1.1"/>
    	<xsl:text>pt</xsl:text>
		</xsl:attribute>
	</xsl:attribute-set>

	<!--  Override default and make footnote font-family Arial-->
	<xsl:attribute-set name="footnote.properties">
  		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
	</xsl:attribute-set>
		<xsl:attribute-set name="table.footnote.properties">
  		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
	</xsl:attribute-set>

		<xsl:attribute-set name="component.title.properties">
		<xsl:attribute name="font-size">18pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<!-- <xsl:attribute name="color">rgb(79,129,189)</xsl:attribute> -->
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="space-before.minimum">2em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">3.0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">4.0em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.15em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.25em</xsl:attribute>

	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level1.properties">
		<xsl:attribute name="font-size">14pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<!-- <xsl:attribute name="color">rgb(79,129,189)</xsl:attribute> -->
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.5em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">1.5em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.15em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.25em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level2.properties">
		<xsl:attribute name="font-size">12</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<!-- <xsl:attribute name="color">rgb(79,129,189)</xsl:attribute> -->
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.5em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">2.0em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.15em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.25em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level3.properties">
		<xsl:attribute name="font-size">11.5</xsl:attribute>
		<!-- <xsl:attribute name="color">rgb(79,129,189)</xsl:attribute> -->
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.5em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">2.0em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.15em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.25em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level4.properties">
		<xsl:attribute name="font-size">11</xsl:attribute>
		<!-- <xsl:attribute name="color">rgb(79,129,189)</xsl:attribute> -->
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.5em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">2.0em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.15em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.25em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="section.title.level5.properties">
		<xsl:attribute name="font-size">10.5pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<!-- <xsl:attribute name="color">rgb(79,129,189)</xsl:attribute> -->
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.5em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">2.0em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.15em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.25em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="admonition.title.properties">
		<xsl:attribute name="font-size">11pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<!-- <xsl:attribute name="color">rgb(79,129,189)</xsl:attribute> -->
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="space-before.minimum">0.5em</xsl:attribute>
		<xsl:attribute name="space-before.optimum">1.0em</xsl:attribute>
		<xsl:attribute name="space-before.maximum">2.0em</xsl:attribute>
		<xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
		<xsl:attribute name="space-after.optimum">0.15em</xsl:attribute>
		<xsl:attribute name="space-after.maximum">0.25em</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="formal.title.properties">
		<xsl:attribute name="font-size">11pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<!-- <xsl:attribute name="color">rgb(79,129,189)</xsl:attribute> -->
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
	</xsl:attribute-set>
	
	<xsl:attribute-set name="formal.label.properties">
		<xsl:attribute name="font-size">11pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
		<!-- <xsl:attribute name="color">rgb(79,129,189)</xsl:attribute> -->
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
	</xsl:attribute-set>

	<!-- <xsl:template match="formalpara/title">
		<fo:block color="rgb(77,79,83)" font-weight="bold"
			space-before.minimum="1.2em"
            space-before.optimum="1.5em"
            space-before.maximum="1.8em">
			<xsl:apply-templates/>
		</fo:block> 
	</xsl:template> -->
	
	<!--	<xsl:template match="procedure/title">
		<fo:block font-size="11pt" font-weight="bold" color="rgb(79,129,189)" font-family="Calibri">
			<xsl:value-of select="."/>
		</fo:block>
	</xsl:template> 
-->
	<!-- Bridgehead customizations -->
	<xsl:template match="bridgehead">
		<fo:block font-size="11pt" start-indent="0pt" space-before.minimum="1.0em" space-before.optimum="1.5em" space-before.maximum="2.0em" font-family="ArialUnicodeMS" font-weight="bold" keep-with-next.within-column="always" text-align="left" >
			<xsl:apply-templates />
		</fo:block>
	</xsl:template>
	
	
	
</xsl:stylesheet>