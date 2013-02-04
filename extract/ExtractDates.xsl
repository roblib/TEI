<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gate="http://www.gate.ac.uk"
    xmlns:tei="http://www.tei-c.org/ns/1.0">

    <xsl:output method="text" version="1.0" encoding="UTF-8"/> 
    
<xsl:template match="tei:Date">
<xsl:value-of select="."/><xsl:text>
</xsl:text>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:template>
    
    <xsl:template match="@gate:gateId"/>
    <xsl:template match="@gate:matches"/>
    <xsl:template match="@rule1"/>
    <xsl:template match="@rule2"/>
    <xsl:template match="@locType"/>
    <xsl:template match="@county"/>

</xsl:stylesheet>
