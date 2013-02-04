<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.tei-c.org/ns/1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all">
    
    <!-- Output should be indented and xml -->
    <xsl:output indent="yes" method="xml"/>

    <!-- Require the MARC id as a parameter marcid=XXXXXX -->
    <xsl:param name="marcid" required="yes"/>

    <!-- Match a root teiCorpus element -->
    <xsl:template match="tei:body">
        <!-- Output for index.xml -->
        <TEI>
            <text>
                <div xmlns="http://www.tei-c.org/ns/1.0">
                    <head>Individual Files</head>
                    <list>
                        <!-- Create a list one item for each TEI element -->
                        <xsl:for-each select="tei:div[@type='page']">
                            <!-- Previously I had this using the @xml:id of each TEI element, but your needs might be different   -->
                            <!-- <xsl:variable name="file"><xsl:value-of select="@xml:id"/></xsl:variable> -->
                            <xsl:variable name="file"><xsl:value-of select="$marcid"/>-<xsl:number format="0000" />.xml</xsl:variable>
                            <!-- Output one item per TEI file -->
                            <item>
                                <ref href="pages/{$file}">
                                    <xsl:value-of select="$file"/>
                                </ref>
                            </item>
                            <!-- Also while we are here output a result-document  -->
                            <xsl:result-document href="../../XML/{$marcid}/pages/{$file}">
                                <TEI xmlns="http://www.tei-c.org/ns/1.0"><xsl:text>&#10;</xsl:text>
                                    <!-- We're include the TEI header that was transformed from the MARC record into a -->
                                    <!-- temporary file at /tmp/tei_header.xml -->
                                    <xsl:copy-of select="document('/tmp/tei_header.xml')"/><xsl:text>&#10;</xsl:text>
                                    <text>    <xsl:text>&#10;</xsl:text>
                                        <body><xsl:text>&#10;</xsl:text>
                                            <xsl:copy>
                                                <xsl:apply-templates select="@*|node()|comment()"/>
                                            </xsl:copy>
                                        </body>
                                    </text>    <xsl:text>&#10;</xsl:text>
                                </TEI>
                            </xsl:result-document>
                        </xsl:for-each>
                    </list>
                </div>
            </text>
        </TEI>
    </xsl:template>
    
    <!-- Default action, if in doubt copy any attributes, nodes or comments -->
    <xsl:template match="@*|node()|comment() " priority="-1">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()|comment()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- If you want to change one of the elements along the way...  -->
    <xsl:template match="tei:fooBar">
        <seg type="fooBar"><!-- Just an example of how to change something else --></seg>
    </xsl:template>
</xsl:stylesheet>

