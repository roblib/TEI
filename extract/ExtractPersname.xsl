<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gate="http://www.gate.ac.uk"
    xmlns:tei="http://www.tei-c.org/ns/1.0">

    <xsl:output method="xml" version="1.0" encoding="UTF-8"/> 
    
<xsl:template match="tei:persName">
<xsl:copy-of select="node()"/><xsl:text>
</xsl:text>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:template>

</xsl:stylesheet>
