<?xml version='1.0'?>
<xsl:stylesheet  
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0"> 
	<xsl:param name="title.margin.left">0pt</xsl:param>
	<xsl:param name="header.image.filename">images/citrix.png</xsl:param>
	<xsl:param name="body.start.indent">
		<xsl:choose>
			<xsl:when test="$fop.extensions != 0">0pt</xsl:when>
			<xsl:when test="$passivetex.extensions != 0">0pt</xsl:when>
			<xsl:otherwise>0pt</xsl:otherwise>
		</xsl:choose>
	</xsl:param>
	
	<xsl:param name="region.before.extent" select="'50px'" />
	<xsl:param name="body.margin.top" select="'0.5in'" />
	<xsl:param name="double.sided">0</xsl:param>

	<xsl:attribute-set name="book.titlepage.recto.style">
		<xsl:attribute name="font-family">ArialUnicodeMS</xsl:attribute>
		<xsl:attribute name="text-align">left</xsl:attribute>
		<xsl:attribute name="color">rgb(77,79,83)</xsl:attribute>
	</xsl:attribute-set>

	
	<xsl:attribute-set name="component.title.properties">
		<xsl:attribute name="color">rgb(77,79,83)</xsl:attribute>
	</xsl:attribute-set>

	<!--<xsl:template match="chapter/title">
		<xsl:value-of select="."/>
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>-->

	<xsl:template match="processing-instruction('hard-pagebreak')">
   <fo:block break-after='page'/>
 </xsl:template>
 
	
	<xsl:template name="book.verso.title">
	</xsl:template>

	<xsl:template name="book.titlepage.recto">
		<fo:block>
			<fo:table inline-progression-dimension="100%" table-layout="fixed">
				<fo:table-column column-width="50%"/>
				<fo:table-column column-width="50%"/>
				<fo:table-body>
					<fo:table-row >
						<fo:table-cell number-columns-spanned="2">
<fo:block>
<fo:external-graphic content-height="1.06cm">
<xsl:attribute name="src">
      <xsl:call-template name="fo-external-image">
        <xsl:with-param name="filename" select="$header.image.filename"/>
      </xsl:call-template>
    </xsl:attribute>
</fo:external-graphic>
</fo:block>
						<fo:block text-align="left" font-weight="bold" font-size="18pt" color="rgb(77,79,83)" font-family="ArialUnicodeMS" padding-top="20pt">
								<xsl:choose>
									<xsl:when test="bookinfo/title">
										<xsl:apply-templates mode="book.titlepage.recto.mode" select="bookinfo/title">

										</xsl:apply-templates>
									</xsl:when>
									<xsl:when test="title">
										<xsl:apply-templates 
                         mode="book.titlepage.recto.mode" 
                         select="title"/>
									</xsl:when>
								</xsl:choose>
							</fo:block>
							
							<fo:block text-align="left" font-size="14pt"  color="rgb(77,79,83)" padding-top="30pt"  font-family="ArialUnicodeMS">
								<xsl:choose>
									<xsl:when test="bookinfo/releaseinfo">
										<xsl:apply-templates 
                         mode="book.titlepage.recto.mode" 
                         select="bookinfo/releaseinfo"/>
									</xsl:when>
								</xsl:choose>

							</fo:block>
							<fo:block margin-left="-80px">
							<fo:external-graphic src="images/xenclient_book.png" padding-top="30pt"></fo:external-graphic>
							</fo:block>
							<fo:block text-align="left"  padding-top="30pt"  font-family="ArialUnicodeMS" font-size="10pt" >
								<xsl:choose>
									<xsl:when test="bookinfo/pubdate"><xsl:apply-templates select="bookinfo/pubdate" mode="book.titlepage.recto.mode" />    
									</xsl:when>
								</xsl:choose>

							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:apply-templates 
                     mode="book.titlepage.recto.mode" 
                     select="bookinfo/corpauthor"/>
							</fo:block>
						</fo:table-cell>
						
					</fo:table-row>  
					<fo:table-row>
					<fo:table-cell>
							<fo:block text-align="left">
								<xsl:apply-templates 
                     mode="book.titlepage.recto.mode" 
                     select="bookinfo/edition"/>
							</fo:block>
						</fo:table-cell> 
					</fo:table-row>
				</fo:table-body> 
			</fo:table>
		</fo:block>
	</xsl:template>

	<xsl:template name="book.titlepage.verso">
		<fo:block>
			<fo:table inline-progression-dimension="100%" table-layout="fixed">
				<fo:table-column column-width="50%"/>
				<fo:table-column column-width="50%"/>
				<fo:table-body>
					<fo:table-row >
						<fo:table-cell number-columns-spanned="2">
							<fo:block text-align="left" font-family="ArialUnicodeMS">
								<xsl:choose>
									<xsl:when test="bookinfo/title">
										<xsl:apply-templates mode="book.titlepage.verso.mode" select="bookinfo/title">

										</xsl:apply-templates>
									</xsl:when>
									<xsl:when test="title">
										<xsl:apply-templates 
                         mode="book.titlepage.verso.mode" 
                         select="title"/>
									</xsl:when>
								</xsl:choose>
							</fo:block>
							<fo:block font-family="ArialUnicodeMS">
								<xsl:if test="bookinfo/legalnotice">
									<xsl:apply-templates  mode="book.titlepage.verso.mode" select="bookinfo/legalnotice"></xsl:apply-templates>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:apply-templates 
                     mode="book.titlepage.verso.mode" 
                     select="bookinfo/corpauthor"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block text-align="left">
								
							</fo:block>
						</fo:table-cell> 
					</fo:table-row >  
				</fo:table-body> 
			</fo:table>
		</fo:block>
	</xsl:template>
<!-- Article-->
	<xsl:template name="article.titlepage.recto">
							<fo:block text-align="left" font-weight="bold" font-size="18pt" color="rgb(77,79,83)" font-family="ArialUnicodeMS" padding-top="20pt">
								<xsl:choose>
									<xsl:when test="articleinfo/title">
										<xsl:apply-templates mode="article.titlepage.recto.mode" select="articleinfo/title">

										</xsl:apply-templates>
									</xsl:when>
									<xsl:when test="title">
										<xsl:apply-templates 
                         mode="article.titlepage.recto.mode" 
                         select="title"/>
									</xsl:when>
								</xsl:choose>
							</fo:block>
							<fo:block>
							<fo:external-graphic src="images/xenclient_article.png" padding-top="30pt"></fo:external-graphic>
							</fo:block>
							<fo:block text-align="left" font-family="ArialUnicodeMS" padding-top="20pt" padding-bottom="20pt">
								<xsl:choose>
									<xsl:when test="articleinfo/abstract">
										<xsl:apply-templates mode="article.titlepage.recto.mode" select="articleinfo/abstract">

										</xsl:apply-templates>
									</xsl:when>
									<xsl:when test="abstract">
										<xsl:apply-templates 
                         mode="article.titlepage.recto.mode" 
                         select="abstract"/>
									</xsl:when>
								</xsl:choose>
							</fo:block>
							<fo:block font-family="ArialUnicodeMS">
								<xsl:if test="bookinfo/legalnotice">
									<xsl:apply-templates  mode="book.titlepage.verso.mode" select="bookinfo/legalnotice"></xsl:apply-templates>
								</xsl:if>
							</fo:block>
							<fo:block font-family="ArialUnicodeMS">
								<xsl:if test="legalnotice">
									<xsl:apply-templates  mode="book.titlepage.verso.mode" select="legalnotice"></xsl:apply-templates>
								</xsl:if>
							</fo:block>

	</xsl:template>

	<xsl:template name="article.titlepage.verso">
	<!--	<fo:block>
			<fo:table inline-progression-dimension="100%" table-layout="fixed">
				<fo:table-column column-width="50%"/>
				<fo:table-column column-width="50%"/>
				<fo:table-body>
					<fo:table-row >
						<fo:table-cell number-columns-spanned="2">
							<fo:block text-align="left" font-family="ArialUnicodeMS">

								<xsl:choose>
									<xsl:when test="articleinfo/title">
										<xsl:apply-templates mode="article.titlepage.verso.mode" select="articleinfo/title">

										</xsl:apply-templates>
									</xsl:when>
									<xsl:when test="title">
										<xsl:apply-templates 
                         mode="article.titlepage.verso.mode" 
                         select="title"/>
									</xsl:when>
								</xsl:choose>
							</fo:block>
							<fo:block font-family="ArialUnicodeMS">
								<xsl:if test="articleinfo/legalnotice">
									<xsl:apply-templates  mode="article.titlepage.verso.mode" select="articleinfo/legalnotice"></xsl:apply-templates>
								</xsl:if>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:apply-templates 
                     mode="article.titlepage.verso.mode" 
                     select="articleinfo/corpauthor"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								
							</fo:block>
						</fo:table-cell> 
					</fo:table-row >  
				</fo:table-body> 
			</fo:table>
		</fo:block> -->
	</xsl:template>

</xsl:stylesheet>
