<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output method="html"></xsl:output>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    
                </title>
            </head>
            <body>
                <h1>Inhaltsverzeichnis</h1>
                <div>
                    <ul>
                        <xsl:apply-templates select="tournament/tournamentday/group" mode="toc"></xsl:apply-templates>
                    </ul>
                </div>
                <h2>
                    <xsl:apply-templates select="tournament/tournamentday"></xsl:apply-templates>
                </h2>
            </body>
        </html>
        
    </xsl:template>
    
    <xsl:template match="tournamentday">
        <xsl:value-of select="position()"/>
        <xsl:apply-templates select="group" mode="detail"/>
        
        
        
    </xsl:template>
    
    
    
    <xsl:template match="group" mode="toc">
      <a href="{generate-id()}">
            <li>
            <xsl:value-of select="tournament/tournamentday/group"/>
            Group
                <xsl:value-of select="position()"/>
             - 
            <xsl:value-of select="../@date"/>
            </li> 
        </a>
    </xsl:template>
    
    <xsl:template match="group" mode="detail">
        Group 
            <xsl:value-of select="position()"/>
        -- competitor:
        <xsl:for-each select="competitor">
            <xsl:value-of select="@person_id"/>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>