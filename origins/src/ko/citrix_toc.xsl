<?xml version='1.0'?>
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">  

	<xsl:param name="generate.toc">
		appendix nop
		article toc,title
		book toc,title
		chapter nop
		part nop
		preface nop
		qandadiv nop
		qandaset nop
		reference toc,title
		section nop
		set toc
	</xsl:param>
	
	<xsl:param name="toc.section.depth" select="4"/> 
	<xsl:param name="appendix.autolabel" select="0"/> 
	<xsl:attribute-set name="toc.line.properties">
		
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="font-weight">
			<xsl:choose>

				<xsl:when test="self::chapter">normal</xsl:when>
				<xsl:when test="self::appendix">normal</xsl:when>
				<xsl:when test="self::index">normal</xsl:when>
				<xsl:otherwise>normal</xsl:otherwise>
			</xsl:choose>

			
		</xsl:attribute>
		<xsl:attribute name="font-size">
			<xsl:choose>

				<xsl:when test="self::chapter">14pt</xsl:when>
				<xsl:when test="self::appendix">14pt</xsl:when>
				<xsl:when test="self::index">14pt</xsl:when>
				<xsl:otherwise>11pt</xsl:otherwise>
			</xsl:choose>

		</xsl:attribute>
		<xsl:attribute name="space-before">
			<xsl:choose>

				<xsl:when test="self::chapter">14pt</xsl:when>
				<xsl:when test="self::appendix">14pt</xsl:when>
				<xsl:when test="self::index">14pt</xsl:when>
				<xsl:otherwise>9pt</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>

<xsl:template name="table.of.contents.titlepage" priority="1">
  <fo:block font-family="ArialUnicodeMS"
			font-size="14pt"
            space-after="13pt"
			space-before="1cm"
			font-weight="bold">
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="'TableofContents'"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>

	</xsl:stylesheet>
