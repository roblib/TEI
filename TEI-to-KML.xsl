<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:gate="http://www.gate.ac.uk"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:kml="http://www.opengis.net/kml/2.2">
    <xsl:output method="xml" version="1.0" encoding="UTF-8"/> 
        
    <!-- Define a key that references the CGNDB XML placename document -->
    <xsl:key name="latlon-lookup" match="PlaceName" use="cgndb_key"/>
    
    <xsl:variable name="latlon-top" select="document('../annotating/locations/places.xml')/SearchResults"/>

    <xsl:template match="/">
    <kml xmlns="http://www.opengis.net/kml/2.2">
        <Document>
            <name>Island Lives Place Map</name>
        <xsl:apply-templates select="@*|node()"/>
        </Document>
    </kml> 
        </xsl:template>
    
    <xsl:template match="tei:placeName">
        <Placemark>
            <name><xsl:value-of select="."/></name>
            <description><p><xsl:value-of select="../." /></p></description>
            <Point>
                <coordinates><xsl:apply-templates select="$latlon-top">
            <xsl:with-param name="curr-location" select="@key"/>
        </xsl:apply-templates>,0</coordinates>
            </Point>
        </Placemark><xsl:text>
        </xsl:text>
    </xsl:template>

    <xsl:template match="SearchResults">
        <xsl:param name="curr-location"/>
        <xsl:value-of select="key('latlon-lookup', $curr-location)/londec"/>,<xsl:value-of select="key('latlon-lookup', $curr-location)/latdec"/>
    </xsl:template>
   
    <xsl:template match="@*|node()">
        <xsl:apply-templates select="@*|node()"/>
    </xsl:template>
    
</xsl:stylesheet>
