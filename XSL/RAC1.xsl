<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:media="http://search.yahoo.com/mrss/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:content="http://purl.org/rss/1.0/modules/content/" version="1.0">

  <xsl:template match="/">
  
  <html>

    <head>
      <meta charset="UTF-8"/>
      <link rel="stylesheet" href="../CSS/styles.css"/>
    </head>

    <body>
      <header>
          <ul>
              <li><a href="../XML/home.xml">Portada</a></li>
              <li><a href="../XML/el_mon.xml">El món a RAC1</a></li>
              <li><a href="../XML/info_rac1.xml">InfoRAC1</a></li>
              <li><a href="../XML/univers_rac1.xml">Univers RAC1</a></li>
              <li><a href="../XML/versio.xml">Versió RAC1</a></li>
          </ul>
      </header>


      <div class="titulo">
        <div class="vanguardia">
          <div id="logoRAC1">
            <img src="../img/logo.png" alt="logo de RAC1"></img>
          </div>
          <div class="logoXML">
            <img src="{//image/url}" alt="{//image/description}"><xsl:value-of select="//image"/></img>
          </div>
        </div>

        <div>
          <h1><xsl:value-of select="//title"/></h1>
        </div>
      </div>

      <div class="flexbody">
        <div class="cajasLaterales" id="todasLasNoticias">
          <h3>Todos los enlaces a las noticias de esta sección:</h3>
          <ul>
            <xsl:for-each select="//item">
              <li>
                <p><a href="{link}" target="_blank"><xsl:apply-templates select="link"/><xsl:value-of select="title"/></a></p>
              </li>
            </xsl:for-each>
          </ul>
        </div>

        <div>
          <xsl:apply-templates select="//item"/>
        </div>

        <div class="cajasLaterales" id="noticiasOrdenadas">
          <h3>Enlaces a todas las noticias de esta sección ordenadas por categorías:</h3>
          <xsl:for-each select="//item">
            <xsl:sort select="category" order="ascending"/>
            <div class="noticiasOrdenadas">
              <p><xsl:value-of select="category"/></p>
              <p><a href="{link}" target="_blank"><xsl:apply-templates select="link"/><xsl:value-of select="title"/></a></p>
            </div>
          </xsl:for-each> 
        </div>
      </div>



      <footer>
        <ul class="footer">
          <li><img src="../img/logo.png" alt="logo de RAC1"></img></li>
          <li><a href="{//link}" target="_blank"><xsl:apply-templates select="//link"/>Ir a página oficial</a></li>
        </ul>
      </footer>
    </body>

  </html>
  </xsl:template>
  




  <xsl:template match="item">
    <xsl:choose>
        <xsl:when test="category='El món a RAC1'">
          <div class="articulo el_mon">
            <h3 class="tituloArticulo"><xsl:value-of select="title"/></h3>
            <p class="textoArticulo"><xsl:value-of select="pubDate"/></p>
            <p class="textoArticulo categEl_mon"><xsl:value-of select="category"/></p>
            <p class="textoArticulo"><xsl:value-of select="description"/></p>
            <p><a href="{link}" target="_blank"><xsl:apply-templates select="link"/>Accede aquí a la noticia</a></p>
            <div class="imgArticulo">
              <img src="{enclosure/@url}" alt="imagen relacionada con la noticia">
              <xsl:value-of select="enclosure"/>
              </img>
            </div>
          </div>
        </xsl:when>
        <xsl:when test="category='Info RAC1'">
          <div class="articulo info_rac1">
            <h3 class="tituloArticulo"><xsl:value-of select="title"/></h3>
            <p class="textoArticulo"><xsl:value-of select="pubDate"/></p>
            <p class="textoArticulo categInfo_rac1"><xsl:value-of select="category"/></p>
            <p class="textoArticulo"><xsl:value-of select="description"/></p>
            <p><a href="{link}" target="_blank"><xsl:apply-templates select="link"/>Accede aquí a la noticia</a></p>
            <div class="imgArticulo">
              <img src="{enclosure/@url}" alt="imagen relacionada con la noticia">
              <xsl:value-of select="enclosure"/>
              </img>
            </div>
          </div>
        </xsl:when>
        <xsl:when test="category='Univers RAC1'">
          <div class="articulo univers_rac1">
            <h3 class="tituloArticulo"><xsl:value-of select="title"/></h3>
            <p class="textoArticulo"><xsl:value-of select="pubDate"/></p>
            <p class="textoArticulo categUnivers_rac1"><xsl:value-of select="category"/></p>
            <p class="textoArticulo"><xsl:value-of select="description"/></p>
            <p><a href="{link}" target="_blank"><xsl:apply-templates select="link"/>Accede aquí a la noticia</a></p>
            <div class="imgArticulo">
              <img src="{enclosure/@url}" alt="imagen relacionada con la noticia">
              <xsl:value-of select="enclosure"/>
              </img>
            </div>
          </div>
        </xsl:when>
        <xsl:when test="category='Versió RAC1'">
          <div class="articulo versio">
            <h3 class="tituloArticulo"><xsl:value-of select="title"/></h3>
            <p class="textoArticulo"><xsl:value-of select="pubDate"/></p>
            <p class="textoArticulo categVersio"><xsl:value-of select="category"/></p>
            <p class="textoArticulo"><xsl:value-of select="description"/></p>
            <p><a href="{link}" target="_blank"><xsl:apply-templates select="link"/>Accede aquí a la noticia</a></p>
            <div class="imgArticulo">
              <img src="{enclosure/@url}" alt="imagen relacionada con la noticia">
              <xsl:value-of select="enclosure"/>
              </img>
            </div>
          </div>
        </xsl:when>
        <xsl:otherwise>
        <div class="articulo">
            <h3 class="tituloArticulo"><xsl:value-of select="title"/></h3>
            <p class="textoArticulo"><xsl:value-of select="pubDate"/></p>
            <p class="textoArticulo"><xsl:value-of select="category"/></p>
            <p class="textoArticulo"><xsl:value-of select="description"/></p>
            <p><a href="{link}" target="_blank"><xsl:apply-templates select="link"/>Accede aquí a la noticia</a></p>

            <div>
              <img src="{enclosure/@url}" alt="imagen relacionada con la noticia">
              <xsl:value-of select="enclosure"/>
              </img>
            </div>

          </div>
        </xsl:otherwise>
      </xsl:choose>
  </xsl:template>
  
  <xsl:template match="link">
    <xsl:value-of select="link"/>
  </xsl:template>

</xsl:stylesheet>