<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns='http://www.tei-c.org/ns/1.0' xmlns:marc="http://www.loc.gov/MARC21/slim"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"     xmlns:tei ="http://www.tei-c.org/ns/1.0">
    <xsl:import href="http://www.loc.gov/standards/marcxml/xslt/MARC21slimUtils.xsl"/>
    <xsl:output method="xml" encoding="UTF-8" media-type="text/xml"/>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="marc:record">
        
        <xsl:variable name="leader" select="marc:leader"/>
        <xsl:variable name="leader6" select="substring($leader,7,1)"/>
        <xsl:variable name="leader7" select="substring($leader,8,1)"/>
        <xsl:variable name="controlField008" select="marc:controlfield[@tag=008]"/>
        <xsl:element name='teiHeader'>
            <xsl:attribute name='type'>AACR2</xsl:attribute>  
            <xsl:text>&#10;</xsl:text>
            <xsl:element name='fileDesc'> 
                <xsl:text>&#10;</xsl:text>
                <xsl:comment>First part of fileDesc is about electronic version of text</xsl:comment>
                <xsl:text>&#10;</xsl:text>
                <xsl:element name='titleStmt'> 
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name='title'>
                        <xsl:attribute name='type'>main</xsl:attribute>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:for-each select="marc:datafield[@tag=245]">
                            <xsl:call-template name="subfieldSelect">
                                <xsl:with-param name="codes">a</xsl:with-param>
                            </xsl:call-template>
                            <xsl:call-template name="chopPunctuation"/>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:for-each>
                    </xsl:element>  
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name='author'>                        
                        <xsl:for-each select="marc:datafield[@tag=100]|marc:datafield[@tag=110]|marc:datafield[@tag=111]">
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </xsl:element>  
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name="respStmt">
                        <xsl:text>&#10;</xsl:text>
                        <xsl:element name="orgName">Robertson Library, University of Prince Edward Island</xsl:element>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:element name="resp">OCR scanning</xsl:element>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:element name="resp">TEI encoding</xsl:element>
                        <xsl:text>&#10;</xsl:text>
                    </xsl:element>
                    <xsl:text>&#10;</xsl:text>
                </xsl:element> 
                <xsl:text>&#10;</xsl:text>
                <xsl:element name="extent"><xsl:comment>place number of digital images, size of TEI encoded file, etc. here.</xsl:comment></xsl:element>
                <xsl:text>&#10;</xsl:text>
                <xsl:element name='publicationStmt'>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:comment>Following is publication info about electronic file</xsl:comment>
                    
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name='publisher'>IslandLives, Robertson Library, University of PEI</xsl:element>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name='date'>2009</xsl:element>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name='idno'>                        
                        <xsl:for-each select="marc:datafield[@tag=901]/marc:subfield[@code='c']">
                            <xsl:value-of select="."/>
                        </xsl:for-each>
                    </xsl:element>  
                    <xsl:element name='availability'>
                        <xsl:element name='p'>
                            Use of this resource is governed by the Canadian
                            Copyright Act. Unless otherwise noted you must contact the rights holder(s) for permission
                            to publish or reproduce this resource.
                        </xsl:element>
                    </xsl:element>
                    <xsl:text>&#10;</xsl:text>
                </xsl:element>  
                <xsl:text>&#10;</xsl:text>
                <xsl:text>&#10;</xsl:text>
                
                <xsl:element name='sourceDesc'>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:comment>sourceDesc element describes original, print source of this electronic file.</xsl:comment>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name='biblFull'> 
                        <xsl:text>&#10;</xsl:text>
                        <xsl:element name='titleStmt'>
                            <xsl:text>&#10;</xsl:text>
                            <xsl:element name='title'>
                                <xsl:attribute name='type'>main</xsl:attribute>
                                <xsl:text>&#10;</xsl:text>
                                <xsl:for-each select="marc:datafield[@tag=245]">
                                    <xsl:call-template name="subfieldSelect">
                                        <xsl:with-param name="codes">ab</xsl:with-param>
                                    </xsl:call-template>
                                    <xsl:call-template name="chopPunctuation"/>
                                    <xsl:text>&#10;</xsl:text>
                                </xsl:for-each>
                            </xsl:element>  
                             <xsl:text>&#10;</xsl:text>
                            <xsl:element name='author'>
                                <xsl:for-each select="marc:datafield[@tag=100]|marc:datafield[@tag=110]|marc:datafield[@tag=111]">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                            </xsl:element>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:element>
                        <xsl:text>&#10;</xsl:text>                    
                        <xsl:element name='editionStmt'>
                            
                            <xsl:text>&#10;</xsl:text>
                            <xsl:element name='p'>
                                <xsl:for-each select="marc:datafield[@tag=250]/marc:subfield[@code='a']">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                            </xsl:element>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:element>
                        <xsl:text>&#10;</xsl:text>
                        
                        <xsl:element name='extent'>
                            <xsl:text>&#10;</xsl:text>
                            <xsl:for-each select="marc:datafield[@tag=300]">
                                <xsl:call-template name="subfieldSelect">
                                    <xsl:with-param name="codes">abc</xsl:with-param>
                                </xsl:call-template>
                                <xsl:call-template name="chopPunctuation"/>
                            </xsl:for-each>
                            
                        </xsl:element>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:element name='publicationStmt'>                        
                            <xsl:text>&#10;</xsl:text>
                            <xsl:element name='publisher'>
                                <xsl:for-each select="marc:datafield[@tag=260]/marc:subfield[@code='b']">
                                    <xsl:value-of select="."/>
                                </xsl:for-each>
                            </xsl:element>
                            
                            <xsl:text>&#10;</xsl:text>
                            
                            <xsl:element name='pubPlace'>
                                <xsl:for-each select="marc:datafield[@tag=260]/marc:subfield[@code='a']">
                                    <xsl:value-of select="."/>
                                </xsl:for-each> 
                            </xsl:element>
                            <xsl:text>&#10;</xsl:text>
                            
                            <xsl:element name='date'>
                                <xsl:for-each select="marc:datafield[@tag=260]/marc:subfield[@code='c']">
                                    
                                    <xsl:value-of select="."/>
                                </xsl:for-each> 
                            </xsl:element>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:element>
                        <xsl:text>&#10;</xsl:text>
                        
                        <xsl:if test="marc:datafield[@tag=440]|marc:datafield[@tag=490]|marc:datafield[@tag=830]">
                            <xsl:element name='seriesStmt'>
                                <xsl:text>&#10;</xsl:text>                        
                                <xsl:for-each select="marc:datafield[@tag=440]">
                                    
                                    <xsl:element name='p'><xsl:value-of select="normalize-space()"/></xsl:element><xsl:text>&#10;</xsl:text>
                                </xsl:for-each>
                                
                                <xsl:for-each select="marc:datafield[@tag=490]">
                                    <xsl:element name='p'><xsl:value-of select="normalize-space()"/></xsl:element><xsl:text>&#10;</xsl:text>
                                </xsl:for-each>
                                
                                <xsl:for-each select="marc:datafield[@tag=830]">
                                    <xsl:element name='p'><xsl:value-of select="normalize-space()"/></xsl:element><xsl:text>&#10;</xsl:text>
                                </xsl:for-each>
                                
                            </xsl:element>
                            
                            <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        
                        <xsl:if test="marc:datafield[@tag=310]|marc:datafield[@tag=500]|marc:datafield[@tag=504]|marc:datafield[@tag=546]">
                            
                            <xsl:element name='notesStmt'>
                                <xsl:text>&#10;</xsl:text>
                                <xsl:element name='note'>
                                    <xsl:for-each select="marc:datafield[@tag=310]">
                                        <xsl:value-of select="."/>
                                    </xsl:for-each>                                    
                                </xsl:element>
                                <xsl:text>&#10;</xsl:text>
                                <xsl:for-each select="marc:datafield[@tag=500]">
                                    <xsl:element name='note'><xsl:value-of select="normalize-space()"/></xsl:element>
                                </xsl:for-each>
                                <xsl:text>&#10;</xsl:text>
                                <xsl:element name='note'>
                                    <xsl:for-each select="marc:datafield[@tag=504]">
                                        <xsl:value-of select="."/>
                                        
                                    </xsl:for-each>
                                </xsl:element>
                                <xsl:text>&#10;</xsl:text>
                                <xsl:element name='note'>
                                    <xsl:for-each select="marc:datafield[@tag=546]">
                                        <xsl:value-of select="."/>
                                    </xsl:for-each>
                                </xsl:element>
                                <xsl:text>&#10;</xsl:text>
                                
                            </xsl:element>
                            <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                        
                    </xsl:element>
                    <xsl:text>&#10;</xsl:text>
                </xsl:element>
                <xsl:text>&#10;</xsl:text>
            </xsl:element>
            <xsl:text>&#10;</xsl:text>
            
            <xsl:element name='encodingDesc'>
                <xsl:text>&#10;</xsl:text>
                <xsl:element name='projectDesc'>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name='p'>
                        This text was created as part of the IslandLives Project. Project description and
                        participants are available at the project website at
                        http://www.islandlives.ca.
                        <xsl:text>&#10;</xsl:text>
                    </xsl:element>
                    <xsl:text>&#10;</xsl:text>
                </xsl:element>
                <xsl:text>&#10;</xsl:text>
                    <xsl:element name='editorialDecl'>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name='p'>
                        This electronic text file was created by the Robertson Library, University of Prince 
                        Edward Island.
                        Typographical distinct text has not been identified.
                        Dates, personal, place and organizational names have been encoded.
                        <xsl:text>&#10;</xsl:text>
                    </xsl:element>
                        <xsl:text>&#10;</xsl:text>
                        </xsl:element>
                    <xsl:element name='classDecl'>
                            <xsl:text>&#10;</xsl:text>
                        <xsl:element name='taxonomy'>
                            <xsl:text>&#10;</xsl:text>
                            <xsl:element name="bibl">Library of Congress Subject Headings</xsl:element>
                                <xsl:text>&#10;</xsl:text>
                     </xsl:element>                        
                    <xsl:text>&#10;</xsl:text>
                   </xsl:element>
                <xsl:text>&#10;</xsl:text>
                </xsl:element>
                <xsl:element name='profileDesc'>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:element name='textClass'>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:if test="marc:datafield[@tag=600]|marc:datafield[@tag=610]|marc:datafield[@tag=630]|marc:datafield[@tag=650]|marc:datafield[@tag=651]">                        
                               <xsl:element name='keywords'><xsl:attribute name="scheme">LCSH</xsl:attribute>
                                   <xsl:text>&#10;</xsl:text>
                                      <xsl:if test="marc:datafield[@tag=600]">
                                        <xsl:element name='term'>
                                            <xsl:for-each select="marc:datafield[@tag=600]">
                                                <xsl:value-of select="."/>
                                            </xsl:for-each>                                    
                                        </xsl:element>
                                        <xsl:text>&#10;</xsl:text>
                                      </xsl:if>
                                      <xsl:if test="marc:datafield[@tag=610]">
                                        <xsl:for-each select="marc:datafield[@tag=610]">
                                            <xsl:element name='term'><xsl:value-of select="."/></xsl:element>
                                        </xsl:for-each>
                                        <xsl:text>&#10;</xsl:text>
                                      </xsl:if>
                                      <xsl:if test="marc:datafield[@tag=611]">                                      
                                          <xsl:element name='term'>
                                            <xsl:for-each select="marc:datafield[@tag=611]">
                                                <xsl:value-of select="."/>
                                            </xsl:for-each>
                                        </xsl:element>
                                        <xsl:text>&#10;</xsl:text>
                                      </xsl:if>
                                      <xsl:if test="marc:datafield[@tag=630]">
                                        <xsl:element name='term'>
                                            <xsl:for-each select="marc:datafield[@tag=630]">
                                                <xsl:value-of select="."/>
                                            </xsl:for-each>
                                        </xsl:element>
                                        <xsl:text>&#10;</xsl:text>
                                      </xsl:if>
                                      <xsl:if test="marc:datafield[@tag=650]">
                                        <xsl:element name='term'>
                                            <xsl:for-each select="marc:datafield[@tag=650]">
                                                <xsl:value-of select="."/>
                                            </xsl:for-each>
                                        </xsl:element>
                                          <xsl:text>&#10;</xsl:text>                                          
                                      </xsl:if>
                                      <xsl:if test="marc:datafield[@tag=651]">
                                        <xsl:element name='term'>
                                            <xsl:for-each select="marc:datafield[@tag=651]">
                                                <xsl:value-of select="."/>
                                            </xsl:for-each>
                                        </xsl:element>
                                          <xsl:text>&#10;</xsl:text>
                                      </xsl:if>
                               </xsl:element>
                            <xsl:text>&#10;</xsl:text>
                            </xsl:if>
                                    <xsl:text>&#10;</xsl:text>
                         </xsl:element>
                                <xsl:text>&#10;</xsl:text>
                        </xsl:element>
                        <xsl:text>&#10;</xsl:text>
<xsl:element name="revisionDesc">
    <xsl:text>&#10;</xsl:text>
    <xsl:element name="change">
        <xsl:text>&#10;</xsl:text>

            <xsl:comment>changes to document can go here</xsl:comment>

        <xsl:text>&#10;</xsl:text>
    </xsl:element>
    <xsl:text>&#10;</xsl:text>
</xsl:element>
            <xsl:text>&#10;</xsl:text>
</xsl:element>
    </xsl:template>
</xsl:stylesheet>
