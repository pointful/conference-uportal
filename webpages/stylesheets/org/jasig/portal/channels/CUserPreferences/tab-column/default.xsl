<?xml version='1.0' encoding='utf-8' ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" indent="no" />

  <xsl:param name="baseActionURL">render.uP</xsl:param>
  <xsl:param name="activeTab">1</xsl:param>
  <xsl:param name="action">no parameter passed</xsl:param>
  <xsl:param name="position">no parameter passed</xsl:param>
  <xsl:param name="elementID">no parameter passed</xsl:param>
  <xsl:param name="errorMessage">no parameter passed</xsl:param>

  <xsl:variable name="activeTabID" select="/layout/folder[not(@type='header' or @type='footer')][position() = $activeTab]/@ID" />
  <!--xsl:variable name="activeID" select="/layout/folder[@type='regular'][position() = $activeTab]/@ID" /-->
  <xsl:variable name="mediaPath">media/org/jasig/portal/channels/CUserPreferences/tab-column</xsl:variable>

  <xsl:template match="layout">

    <html>
      <head>
        <title>Default uP Screen</title>
        <link type="text/css" rel="stylesheet" href="{$mediaPath}\imm.css" />
      </head>

      <body>

      <!-- Uncomment for debug values
      $activeTab: <xsl:value-of select="$activeTab"/><br/>
      $action: <xsl:value-of select="$action"/><br/>
      $position: <xsl:value-of select="$position"/><br/>
      $elementID: <xsl:value-of select="$elementID"/><br/>
      -->

      <xsl:call-template name="optionMenu" />

      <br/>

<!--Begin Layout Table -->

        <table width="100%" border="0" cellspacing="20" cellpadding="0" class="uportal-background-dark">

          <tr align="center" valign="top">

            <td>

<!--Begin Layout Sub-Table -->

              <table summary="add summary" width="100%" border="0" cellspacing="0" cellpadding="0">

                <tr>

                  <td>

                    <xsl:call-template name="tabRow" />

                  </td>

                </tr>



                <tr>

                  <td>

                    <xsl:call-template name="contentRow" />

                  </td>

                </tr>

              </table>



<!--End Layout Sub-Table -->

            </td>

          </tr>

        </table>



<!--End Layout Table -->

      </body>

    </html>

  </xsl:template>



  <xsl:template name="tabRow">

<!--Begin Tab Table -->

    <table summary="add summary" border="0" cellspacing="0" cellpadding="0" width="100%">

      <tr>

        <xsl:for-each select="/layout/folder[not(attribute::type='header' or type='footer')]">

          <xsl:choose>

            <xsl:when test="not($activeTab = position())">

              <td nowrap="nowrap" class="uportal-background-light">

                <a class="uportal-text-small">

                  <xsl:choose>

                    <xsl:when test="$action = 'moveColumn' or $action = 'moveChannel'">
                      <xsl:attribute name="href">
                        <xsl:value-of select="$baseActionURL" />?action=<xsl:value-of select="$action" />&amp;activeTab=<xsl:value-of select="position()" />
                      </xsl:attribute>
                    </xsl:when>

                    <xsl:otherwise>
                      <xsl:attribute name="href">
                        <xsl:value-of select="$baseActionURL" />?action=selectTab&amp;activeTab=<xsl:value-of select="position()" />
                      </xsl:attribute>
                    </xsl:otherwise>

                  </xsl:choose>

                  <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />

                  <xsl:value-of select="@name" />

                  <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />

                </a>

              </td>


              <td class="uportal-background-dark">

                <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

              </td>

            </xsl:when>



            <xsl:otherwise>

              <td nowrap="nowrap">

                <xsl:choose>

                  <xsl:when test="$action='modifyTab'">

                    <xsl:attribute name="class">uportal-background-highlight</xsl:attribute>

                  </xsl:when>



                  <xsl:otherwise>

                    <xsl:attribute name="class">uportal-background-content</xsl:attribute>

                  </xsl:otherwise>

                </xsl:choose>



                <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />



                <a class="uportal-navigation-category-selected">

                  <xsl:choose>

                    <xsl:when test="$action = 'moveColumn' or $action = 'moveChannel'">

                      <xsl:attribute name="href">

                      <xsl:value-of select="$baseActionURL" />



                      ?action=

                      <xsl:value-of select="$action" />



                      &amp;activeTab=

                      <xsl:value-of select="position()" />

                      </xsl:attribute>

                    </xsl:when>



                    <xsl:otherwise>
                      <xsl:attribute name="href">
                        <xsl:value-of select="$baseActionURL" />?action=selectTab&amp;activeTab=<xsl:value-of select="position()" />
                      </xsl:attribute>
                    </xsl:otherwise>

                  </xsl:choose>



                  <span class="uportal-text-small">

                    <xsl:value-of select="@name" />

                  </span>

                </a>



                <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

              </td>



              <td class="uportal-background-dark">

                <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

              </td>

            </xsl:otherwise>

          </xsl:choose>

        </xsl:for-each>



        <xsl:choose>

          <xsl:when test="$action = 'newTab'">

            <td nowrap="nowrap" bgcolor="#CCCCCC" class="uportal-background-highlight">

              <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />



              <img alt="interface image" src="{$mediaPath}\newtab.gif" width="59" height="20" />



              <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

            </td>

          </xsl:when>



          <xsl:otherwise>

            <xsl:if test="not($action='moveColumn' or $action='moveChannel')">

              <td nowrap="nowrap" bgcolor="#CCCCCC">

                <a href="{$baseActionURL}?action=newTab" class="uportal-text-small">

                  <img alt="click to add a new tab" src="{$mediaPath}\newtab.gif" width="59" height="20" border="0" />

                </a>

              </td>

            </xsl:if>

          </xsl:otherwise>

        </xsl:choose>



        <td width="100%">

          <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="20" />

        </td>

      </tr>

    </table>



<!--End Tab Table -->

  </xsl:template>



  <xsl:template name="contentRow">

<!--Begin Content Table -->

    <table border="0" cellspacing="0" cellpadding="0" class="uportal-background-content" width="100%">

      <xsl:call-template name="controlRow" />



      <tr>

        <xsl:choose>

          <xsl:when test="/layout/folder[attribute::ID=$activeTabID]/folder">

            <xsl:for-each select="/layout/folder[attribute::ID=$activeTabID]/descendant::folder">

              <xsl:call-template name="contentColumns" />



              <xsl:if test="position()=last()">

                <xsl:call-template name="closeContentRow" />

              </xsl:if>

            </xsl:for-each>

          </xsl:when>



          <xsl:otherwise>

            <xsl:for-each select="/layout/folder[attribute::ID=$activeTabID]">

              <xsl:call-template name="contentColumns" />



              <xsl:call-template name="closeContentRow" />

            </xsl:for-each>

          </xsl:otherwise>

        </xsl:choose>



        <xsl:call-template name="controlRow" />

      </tr>

    </table>



<!--End Content Table -->

  </xsl:template>



  <xsl:template name="controlRow">

<!--Begin Control Row -->

    <tr>

      <xsl:choose>

        <xsl:when test="/layout/folder[attribute::ID=$activeTabID]/folder">

          <xsl:for-each select="/layout/folder[attribute::ID=$activeTabID]/folder">

            <td width="10">

              <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

            </td>



            <td width="20">

              <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

            </td>



            <td width="10">

              <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="20" />

            </td>



            <td width="">

              <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

            </td>

          </xsl:for-each>



          <td width="10">

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

          </td>



          <td width="20">

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

          </td>



          <td width="10">

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="20" />

          </td>

        </xsl:when>



        <xsl:otherwise>

          <td width="10">

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

          </td>



          <td width="20">

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

          </td>



          <td width="10">

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="20" />

          </td>



          <td width="100%">

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

          </td>



          <td width="10">

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

          </td>



          <td width="20">

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

          </td>



          <td>

            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="20" />

          </td>

        </xsl:otherwise>

      </xsl:choose>

    </tr>



<!--End Control Row -->

  </xsl:template>



  <xsl:template name="optionMenu">

<!--Begin Option Menu-->

    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-background-content">

      <tr class="uportal-background-light">

        <td class="uportal-channel-text">

          <xsl:choose>

            <xsl:when test="$action='selectTab'">

              <xsl:call-template name="optionMenuModifyTab" />

            </xsl:when>



            <xsl:when test="$action='selectColumn'">

              <xsl:call-template name="optionMenuModifyColumn" />

            </xsl:when>



            <xsl:when test="$action='selectChannel'">

              <xsl:call-template name="optionMenuModifyChannel" />

            </xsl:when>



            <xsl:when test="$action='newTab'">

              <xsl:call-template name="optionMenuNewTab" />

            </xsl:when>



            <xsl:when test="$action='newColumn'">

              <xsl:call-template name="optionMenuNewColumn" />

            </xsl:when>



            <xsl:when test="$action='newChannel'">

              <xsl:call-template name="optionMenuDefault" />



<!--Change Value When "newChannel" is Coded-->

            </xsl:when>



            <xsl:when test="$action='moveColumn'">

              <xsl:call-template name="optionMenuMoveColumn" />

            </xsl:when>



            <xsl:when test="$action='moveChannel'">

              <xsl:call-template name="optionMenuMoveChannel" />

            </xsl:when>



            <xsl:when test="$action='error'">

              <xsl:call-template name="optionMenuError" />

            </xsl:when>



            <xsl:otherwise>

              <xsl:call-template name="optionMenuDefault" />

            </xsl:otherwise>

          </xsl:choose>

        </td>

      </tr>

    </table>



<!--End Option Menu-->

  </xsl:template>



  <xsl:template name="contentColumns">

    <xsl:call-template name="controlColumn" />



    <xsl:call-template name="newColumn" />



    <xsl:call-template name="controlColumn" />



<!--Begin Content Column -->

    <td align="center" valign="top">

      <xsl:if test="($action = 'selectColumn' or $action = 'moveColumn') and $elementID=@ID">

        <xsl:attribute name="class">uportal-background-highlight</xsl:attribute>

      </xsl:if>



      <table width="100%" border="0" cellspacing="0" cellpadding="0">

<!--Begin [select Column]row -->

        <tr>

          <td>

            <img alt="interface image" src="{$mediaPath}\leftarrow.gif" width="20" height="20" />

          </td>



          <td bgcolor="#CCCCCC" width="100%" align="center">

            <xsl:choose>

              <xsl:when test="($action = 'selectColumn' or $action = 'moveColumn') and $elementID=@ID">

                <img alt="interface image" src="{$mediaPath}\transparent.gif" width="20" height="20" />

              </xsl:when>



              <xsl:otherwise>

                <a href="{$baseActionURL}?action=selectColumn&amp;elementID={@ID}" class="uportal-text-small">

                  <img alt="click to select this column [{@ID}]" src="{$mediaPath}\selectcolumn.gif" width="79" height="20" border="0" />

                </a>

              </xsl:otherwise>

            </xsl:choose>

          </td>



          <td>

            <img alt="interface image" src="{$mediaPath}\rightarrow.gif" width="20" height="20" />

          </td>

        </tr>



<!--End [select Column] row -->

      </table>



      <xsl:choose>

        <xsl:when test="not(descendant::channel)">

          <xsl:call-template name="newChannel" />

        </xsl:when>



        <xsl:otherwise>

          <xsl:for-each select="descendant::channel">

            <xsl:call-template name="newChannel" />



            <xsl:call-template name="selectChannel" />



            <xsl:if test="position()=last()">

              <xsl:call-template name="closeContentColumn" />

            </xsl:if>

          </xsl:for-each>

        </xsl:otherwise>

      </xsl:choose>

    </td>



<!--End Content Column -->

  </xsl:template>



  <xsl:template name="closeContentRow">

<!-- Close Content Row-->

    <td>

      <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

    </td>



    <xsl:choose>

      <xsl:when test="$action = 'newColumn' and $position='after'">

        <td class="uportal-background-highlight" width="20">

          <a href="{$baseActionURL}?action=newColumn&amp;method=appendAfter&amp;elementID={@ID}" class="uportal-text-small">

            <img alt="click to add a new column in this location [after {@ID}]" src="{$mediaPath}\newcolumn.gif" width="20" height="100" border="0" />

          </a>

        </td>

      </xsl:when>



      <xsl:when test="$action = 'moveColumn' and not(@ID=$elementID)">

        <td class="uportal-background-highlight" width="20">

          <a href="{$baseActionURL}?action=moveColumnHere&amp;method=appendAfter&amp;elementID={@ID}" class="uportal-text-small">

            <img alt="click to move the selected column to this location [after {@ID}]" src="{$mediaPath}\movecolumn.gif" border="0" />

          </a>

        </td>

      </xsl:when>



      <xsl:when test="$action = 'moveColumn' and @ID=$elementID">

        <td bgcolor="#CCCCCC" width="20">

          <img alt="interface image" src="{$mediaPath}\transparent.gif" width="20" height="20" />

        </td>

      </xsl:when>



      <xsl:otherwise>

        <td bgcolor="#CCCCCC" width="20">

          <a href="{$baseActionURL}?action=newColumn&amp;method=appendAfter&amp;elementID={@ID}" class="uportal-text-small">

            <img alt="click to add a new column in this location [after {@ID}]" src="{$mediaPath}\newcolumn.gif" width="20" height="100" border="0" />

          </a>

        </td>

      </xsl:otherwise>

    </xsl:choose>



    <td>

      <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

    </td>



<!-- Close Content Row-->

  </xsl:template>



  <xsl:template name="controlColumn">

    <td>

      <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

    </td>

  </xsl:template>



  <xsl:template name="newColumn">

    <xsl:choose>

      <xsl:when test="$action = 'newColumn' and $position='before' and $elementID=@ID">

        <td class="uportal-background-highlight" width="20">

          <a href="{$baseActionURL}?action=newColumn&amp;method=insertBefore&amp;elementID={@ID}" class="uportal-text-small">

            <img alt="click to add a new column in this location [before {@ID}]" src="{$mediaPath}\newcolumn.gif" width="20" height="100" border="0" />

          </a>

        </td>

      </xsl:when>



      <xsl:when test="$action = 'moveColumn' and not(@ID=$elementID or preceding-sibling::folder[1]/@ID=$elementID)">

        <td class="uportal-background-highlight" width="20">

          <a href="{$baseActionURL}?action=moveColumnHere&amp;method=insertBefore&amp;elementID={@ID}" class="uportal-text-small">

            <img alt="click to move the selected column to this location [before {@ID}]" src="{$mediaPath}\movecolumn.gif" border="0" />

          </a>

        </td>

      </xsl:when>



      <xsl:when test="$action = 'moveColumn' and (@ID=$elementID or preceding-sibling::folder[1]/@ID=$elementID)">

        <td bgcolor="#CCCCCC" width="20">

          <img alt="interface image" src="{$mediaPath}\transparent.gif" width="20" height="20" />

        </td>

      </xsl:when>



      <xsl:otherwise>

        <td bgcolor="#CCCCCC" width="20">

          <a href="{$baseActionURL}?action=newColumn&amp;method=insertBefore&amp;elementID={@ID}" class="uportal-text-small">

            <img alt="click to add a new column in this location [before {@ID}]" src="{$mediaPath}\newcolumn.gif" width="20" height="100" border="0" />

          </a>

        </td>

      </xsl:otherwise>

    </xsl:choose>

  </xsl:template>



  <xsl:template name="newChannel">

<!--Begin [new channel] Table -->

    <table width="100%" border="0" cellspacing="10" cellpadding="0">

      <tr align="center">

        <xsl:choose>

          <xsl:when test="$action = 'newChannel' and $position='before' and $elementID=@ID">

            <td class="uportal-background-highlight">

              <a href="{$baseActionURL}?action=newChannel&amp;method=insertBefore&amp;elementID={@ID}" class="uportal-text-small">

                <img alt="click to add a new channel in this location [before {@ID}]" src="{$mediaPath}\newchannel.gif" border="0" />

              </a>

            </td>

          </xsl:when>



          <xsl:when test="$action = 'moveChannel' and not(@ID=$elementID or preceding-sibling::channel[1]/@ID=$elementID)">

            <td class="uportal-background-highlight">

              <a href="{$baseActionURL}?action=moveChannelHere&amp;method=insertBefore&amp;elementID={@ID}" class="uportal-text-small">

                <img alt="click to move the selected channel to this location [before {@ID}]" src="{$mediaPath}\movechannel.gif" border="0" />

              </a>

            </td>

          </xsl:when>



          <xsl:when test="$action = 'moveChannel' and (@ID=$elementID or preceding-sibling::channel[1]/@ID=$elementID)">

            <td>

              <img alt="interface image" src="{$mediaPath}\transparent.gif" width="20" height="20" />

            </td>

          </xsl:when>



          <xsl:otherwise>

            <td>

              <a href="{$baseActionURL}?action=newChannel&amp;method=insertBefore&amp;elementID={@ID}" class="uportal-text-small">

                <img alt="click to add a new channel in this location [before {@ID}]" src="{$mediaPath}\newchannel.gif" border="0" />

              </a>

            </td>

          </xsl:otherwise>

        </xsl:choose>

      </tr>

    </table>



<!--End [new channel] Table -->

  </xsl:template>



  <xsl:template name="selectChannel">

<!--Begin [select channel] Table -->

    <table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr align="center">

        <td class="uportal-text-small">

          <a href="{$baseActionURL}?action=selectChannel&amp;elementID={@ID}" class="uportal-text-small">

            <xsl:value-of select="@name" />

          </a>

        </td>

      </tr>



      <tr align="center">

        <xsl:if test="$elementID = @ID">

          <xsl:attribute name="class">uportal-background-highlight</xsl:attribute>

        </xsl:if>



        <td>

          <a href="{$baseActionURL}?action=selectChannel&amp;elementID={@ID}" class="uportal-text-small">

            <img alt="click to select this channel [{@ID}]" src="{$mediaPath}\selectchannel.gif" width="120" height="90" border="0" />

          </a>

        </td>

      </tr>

    </table>



<!--Begin [select channel] Table -->

  </xsl:template>



  <xsl:template name="closeContentColumn">

<!--Begin [new channel] Table -->

    <table width="100%" border="0" cellspacing="10" cellpadding="0">

      <tr align="center">

        <xsl:choose>

          <xsl:when test="$action = 'newChannel' and $position='after'">

            <td class="uportal-background-highlight">

              <a href="{$baseActionURL}?action=newChannel&amp;method=appendAfter&amp;elementID={@ID}" class="uportal-text-small">

                <img alt="click to add a new channel in this location [after {@ID}]" src="{$mediaPath}\newchannel.gif" border="0" />

              </a>

            </td>

          </xsl:when>



          <xsl:when test="$action = 'moveChannel' and not(@ID=$elementID)">

            <td class="uportal-background-highlight">

              <a href="{$baseActionURL}?action=moveChannelHere&amp;method=appendAfter&amp;elementID={@ID}" class="uportal-text-small">

                <img alt="click to move the selected channel to this location [after {@ID}]" src="{$mediaPath}\movechannel.gif" border="0" />

              </a>

            </td>

          </xsl:when>



          <xsl:when test="$action = 'moveChannel' and @ID=$elementID">

            <td>

              <img alt="interface image" src="{$mediaPath}\transparent.gif" width="20" height="20" />

            </td>

          </xsl:when>



          <xsl:otherwise>

            <td>

              <a href="{$baseActionURL}?action=newChannel&amp;method=appendAfter&amp;elementID={@ID}" class="uportal-text-small">

                <img alt="click to add a new channel in this location [after {@ID}]" src="{$mediaPath}\newchannel.gif" border="0" />

              </a>

            </td>

          </xsl:otherwise>

        </xsl:choose>

      </tr>

    </table>



<!--End [new channel] Table -->

  </xsl:template>



  <xsl:template name="optionMenuDefault">Navigate to a tab, or select an element on the current tab by clicking one of the grey buttons below. For example, click one of the 

  <img alt="interface image" src="{$mediaPath}\newchannel.gif" width="79" height="20" />



  buttons to add a new channel in that location.</xsl:template>



  <xsl:template name="optionMenuModifyTab">

<!-- Begin Mod Tab Options -->

    <xsl:variable name="tabName" select="/layout/folder[@ID=$activeTabID]/@name" />



    <p>

      <span class="uportal-channel-subtitle-reversed">Options for modifying this tab:</span>

    </p>



    <table width="100%" border="0" cellspacing="0" cellpadding="2" class="uportal-channel-text">

      <tr>

        <td valign="top">

          <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

        </td>



        <td width="100%">

          <a href="{$baseActionURL}?action=setActiveTab&amp;tab={$activeTab}">Make this the default "Active Tab" (the tab that is selected when you log into the portal)</a>

        </td>

      </tr>



      <xsl:if test="not(/layout/folder[@ID=$activeTabID]/@immutable = 'true')">

        <tr>

          <td valign="top">

            <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

          </td>



          <td>

            <form name="formRenameTab" method="post" action="{$baseActionURL}">

              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="uportal-channel-text">

                <tr>

                  <td nowrap="nowrap">

                    <a href="#">Rename the tab:

                    <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />

                    </a>

                  </td>



                  <td width="100%">

                    <input type="text" name="tabName" value="{$tabName}" class="uportal-input-text" size="30" />



                    <img alt="interface image" src="{$mediaPath}\transparent.gif" width="16" height="16" />



                    <input type="submit" name="RenameTab" value="Rename" class="uportal-button" />



                    <input type="hidden" name="action" value="renameTab" />



                    <input type="hidden" name="elementID" value="{$activeTabID}" />

                  </td>

                </tr>

              </table>

            </form>

          </td>

        </tr>

      </xsl:if>



      <tr>

        <td valign="top">

          <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

        </td>



        <td>

          <a href="#">Move this tab to a diffferent position: (select below then click Move button)</a>

        </td>

      </tr>



      <tr>

        <td valign="top">

          <img alt="interface image" src="{$mediaPath}\transparent.gif" width="1" height="1" />

        </td>



        <td>

          <form name="formMoveTab" method="post" action="{$baseActionURL}">

            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="uportal-channel-text">

              <tr>

                <xsl:for-each select="/layout/folder[not(@type='header' or @type='footer')]">

                  <xsl:choose>

                    <xsl:when test="@ID=$activeTabID">

                      <td class="uportal-background-light">

                        <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

                      </td>



                      <td nowrap="nowrap" class="uportal-background-content">

                        <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />



                        <span class="uportal-text-small">

                          <xsl:value-of select="@name" />

                        </span>



                        <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

                      </td>



                      <td class="uportal-background-light">

                        <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

                      </td>

                    </xsl:when>



                    <xsl:when test="preceding-sibling::*[1]/@ID=$activeTabID">

                      <xsl:choose>

                        <xsl:when test="position() = last()">

                          <td nowrap="nowrap" class="uportal-background-med">

                            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />



                            <span class="uportal-text-small">

                              <xsl:value-of select="@name" />

                            </span>



                            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

                          </td>



                          <td nowrap="nowrap" class="uportal-background-light">

                            <input type="radio" name="method_ID" value="appendAfter_{@ID}" />

                          </td>

                        </xsl:when>



                        <xsl:otherwise>

                          <td nowrap="nowrap" class="uportal-background-med">

                            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />



                            <span class="uportal-text-small">

                              <xsl:value-of select="@name" />

                            </span>



                            <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

                          </td>

                        </xsl:otherwise>

                      </xsl:choose>

                    </xsl:when>



                    <xsl:when test="position()=last()">

                      <td nowrap="nowrap" class="uportal-background-light">

                        <input type="radio" name="method_ID" value="insertBefore_{@ID}" />

                      </td>



                      <td nowrap="nowrap" class="uportal-background-med">

                        <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />



                        <span class="uportal-text-small">

                          <xsl:value-of select="@name" />

                        </span>



                        <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

                      </td>



                      <td nowrap="nowrap" class="uportal-background-light">

                        <input type="radio" name="method_ID" value="appendAfter_{@ID}" />

                      </td>

                    </xsl:when>



                    <xsl:otherwise>

                      <td nowrap="nowrap" class="uportal-background-light">

                        <input type="radio" name="method_ID" value="insertBefore_{@ID}" />

                      </td>



                      <td nowrap="nowrap" class="uportal-background-med">

                        <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />



                        <span class="uportal-text-small">

                          <xsl:value-of select="@name" />

                        </span>



                        <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

                      </td>

                    </xsl:otherwise>

                  </xsl:choose>

                </xsl:for-each>



                <td width="100%">

                  <img alt="interface image" src="{$mediaPath}\transparent.gif" width="16" height="16" />



                  <input type="submit" name="MoveTab" value="Move" class="uportal-button" />



                  <input type="hidden" name="action" value="moveTab" />



                  <input type="hidden" name="elementID" value="{$activeTabID}" />

                </td>

              </tr>

            </table>

          </form>

        </td>

      </tr>



      <xsl:if test="not(/layout/folder[@ID=$activeTabID]/@unremovable = 'true')">

        <tr>

          <td valign="top">

            <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

          </td>



          <td>

            <a href="{$baseActionURL}?action=deleteTab&amp;elementID={$activeTabID}">Delete this tab</a>

          </td>

        </tr>

      </xsl:if>



      <tr>

        <td colspan="2">

          <hr/>

        </td>

      </tr>



      <tr>

        <td valign="top">

          <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

        </td>



        <td>

          <a href="{$baseActionURL}?action=cancel">Cancel and return</a>

        </td>

      </tr>

    </table>



<!-- End Mod Tab Options -->

  </xsl:template>



  <xsl:template name="optionMenuModifyColumn">

<!-- Begin Mod Column Options -->

    <form name="formColumnWidth" method="post" action="{$baseActionURL}">

      <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-channel-text">

        <tr class="uportal-background-light">

          <td class="uportal-channel-text">

            <p>

              <span class="uportal-channel-subtitle-reversed">Options for modifying this column:</span>

            </p>



            <table width="100%" border="0" cellspacing="0" cellpadding="0">

              <tr>

                <td class="uportal-channel-text">

                  <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

                </td>



                <td width="100%" class="uportal-channel-text">

                  <a href="#">Change the width of the columns (column widths should total 100%):</a>

                </td>

              </tr>



              <tr>

                <td class="uportal-channel-text">

                  <img alt="interface image" src="{$mediaPath}\transparent.gif" width="16" height="16" />

                </td>



                <td class="uportal-channel-text">

                  <table width="100%" border="0" cellspacing="0" cellpadding="2">

                    <tr valign="top">

                      <td nowrap="nowrap" align="center">

                        <img alt="interface image" src="{$mediaPath}\transparent.gif" width="16" height="16" />

                      </td>



                      <input type="hidden" name="action" value="coulmnWidth" />



                      <xsl:for-each select="/layout/folder[@ID = $activeTabID]/descendant::folder">

                        <td nowrap="nowrap" align="center" class="uportal-text-small">

                          <input type="text" name="columnWidth_{@ID}" value="{@width}" size="5" maxlength="" class="uportal-input-text" />



                          <br/>



                          <xsl:choose>

                            <xsl:when test="$elementID=@ID">

                              <strong>Column</strong>

                            </xsl:when>



                            <xsl:otherwise>Column</xsl:otherwise>

                          </xsl:choose>

                        </td>



                        <td nowrap="nowrap">

                          <img alt="interface image" src="{$mediaPath}\transparent.gif" width="16" height="16" />

                        </td>

                      </xsl:for-each>



                      <td width="100%" align="left" nowrap="nowrap">

                        <input type="submit" name="submitModifyColumn" value="Submit" class="uportal-button" />

                      </td>

                    </tr>

                  </table>

                </td>

              </tr>



<!-- If ancestor is immutable - the column cannot be moved-->

              <xsl:if test="not(/layout/descendant::folder[@ID=$elementID]/ancestor::*[@immutable='true'])">

                <tr>

                  <td class="uportal-channel-text">

                    <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

                  </td>



                  <td class="uportal-channel-text">

                    <a href="{$baseActionURL}?action=moveColumn&amp;elementID={$elementID}">Move this column to a different location</a>

                  </td>

                </tr>

              </xsl:if>



<!-- If ancestor or self is unremovable - the column cannot be deleted-->

              <xsl:if test="not(/layout/descendant::folder[@ID=$elementID]/ancestor-or-self::*[@unremovable='true'])">

                <tr>

                  <td class="uportal-channel-text">

                    <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

                  </td>



                  <td class="uportal-channel-text">

                    <a href="{$baseActionURL}?action=deleteColumn&amp;elementID={$elementID}">Delete this column</a>

                  </td>

                </tr>

              </xsl:if>



              <tr>

                <td colspan="2" class="uportal-channel-text">

                  <hr/>

                </td>

              </tr>



              <tr>

                <td class="uportal-channel-text">

                  <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

                </td>



                <td class="uportal-channel-text">

                  <a href="{$baseActionURL}?action=cancel">Cancel and return</a>

                </td>

              </tr>

            </table>

          </td>

        </tr>

      </table>

    </form>



<!-- End Mod Column Options -->

  </xsl:template>



  <xsl:template name="optionMenuModifyChannel">

    <xsl:variable name="channelName" select="/layout/folder/descendant::*[@ID = $elementID]/@name" />



    <form name="formModifyChannel" method="post" action="{$baseActionURL}">

      <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-background-content">

        <tr class="uportal-background-light">

          <td class="uportal-channel-text">

            <p>

              <span class="uportal-channel-subtitle-reversed">Options for modifying this channel:</span>

            </p>



            <table width="100%" border="0" cellspacing="0" cellpadding="0">

              <xsl:if test="not(/layout/descendant::channel[@ID=$elementID]/@immutable = 'true')">

                <tr>

                  <td class="uportal-channel-text">

                    <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

                  </td>



                  <td width="100%" class="uportal-channel-text">

                    <a href="#">Rename this channel:</a>



                    <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />



                    <input type="hidden" name="action" value="renameChannel" />



                    <input type="hidden" name="elementID" value="{$elementID}" />



                    <input type="text" name="channelName" class="uportal-input-text" value="{$channelName}" size="30" />



                    <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />



                    <input type="submit" name="RenameTab" value="Rename" class="uportal-button" />

                  </td>

                </tr>

              </xsl:if>



<!-- If ancestor is immutable - the channel cannot be moved-->

              <xsl:if test="not(/layout/descendant::*[@ID=$elementID]/ancestor::folder[@immutable='true'])">

                <tr>

                  <td class="uportal-channel-text">

                    <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

                  </td>



                  <td width="100%" class="uportal-channel-text">

                    <a href="{$baseActionURL}?action=moveChannel&amp;elementID={$elementID}">Move this channel to a different location</a>

                  </td>

                </tr>

              </xsl:if>



<!-- If ancestor or self is unremovable - the channel cannot be deleted-->

              <xsl:if test="not(/layout/descendant::*[@ID=$elementID]/ancestor-or-self::*[@unremovable='true'])">

                <tr>

                  <td class="uportal-channel-text">

                    <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

                  </td>



                  <td width="100%" class="uportal-channel-text">

                    <a href="{$baseActionURL}?action=deleteChannel&amp;elementID={$elementID}">Delete this channel</a>

                  </td>

                </tr>

              </xsl:if>



              <tr>

                <td colspan="2" class="uportal-channel-text">

                  <hr/>

                </td>

              </tr>



              <tr>

                <td class="uportal-channel-text">

                  <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

                </td>



                <td width="100%" class="uportal-channel-text">

                  <a href="{$baseActionURL}?action=cancel">Cancel and return</a>

                </td>

              </tr>

            </table>

          </td>

        </tr>

      </table>

    </form>

  </xsl:template>



  <xsl:template name="optionMenuNewTab">

    <form name="formNewTab" method="post" action="{$baseActionURL}">

      <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-background-content">

        <tr class="uportal-background-light">

          <td class="uportal-channel-text">

            <p>

              <span class="uportal-channel-subtitle-reversed">Steps for adding this new tab:</span>

            </p>



            <table width="100%" border="0" cellspacing="0" cellpadding="2">

              <tr>

                <td class="uportal-channel-text" align="right">

                  <strong>1.</strong>

                </td>



                <td class="uportal-channel-text">Name the tab: 

                <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />



                <input type="text" name="tabName" class="uportal-input-text" size="30" />

                </td>

              </tr>



              <tr>

                <td class="uportal-channel-text" align="right">

                  <strong>

                  <img alt="interface image" src="{$mediaPath}\transparent.gif" width="1" height="16" />



                  2.</strong>

                </td>



                <td class="uportal-channel-text">Select a position for the tab:</td>

              </tr>



              <tr>

                <td class="uportal-channel-text" align="right">

                  <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

                </td>



                <td class="uportal-channel-text">

                  <table width="100%" border="0" cellspacing="0" cellpadding="0">

                    <tr>

                      <xsl:for-each select="/layout/folder[not(attribute::type='header' or type='footer')]">

                        <td nowrap="nowrap" class="uportal-background-light">

                          <input type="radio" name="method_ID" value="insertBefore_{@ID}" />

                        </td>



                        <td nowrap="nowrap" class="uportal-background-med">

                          <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" border="0" />



                          <span class="uportal-text-small">

                            <xsl:value-of select="@name" />

                          </span>



                          <img alt="Interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />

                        </td>

                      </xsl:for-each>



                      <td width="100%">

                        <input type="radio" name="method_ID" value="appendAfter_{@ID}" />

                      </td>

                    </tr>

                  </table>

                </td>

              </tr>



              <tr>

                <td class="uportal-channel-text" align="right">

                  <strong>3.</strong>

                </td>



                <td class="uportal-channel-text">Submit the choices: 

                <input type="hidden" name="action" value="addTab" />



                <input type="submit" name="Submit" value="Submit" class="uportal-button" />

                </td>

              </tr>



              <tr>

                <td colspan="2" class="uportal-channel-text">

                  <hr/>

                </td>

              </tr>



              <tr>

                <td class="uportal-channel-text">

                  <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" />

                </td>



                <td width="100%" class="uportal-channel-text">

                  <a href="{$baseActionURL}?action=cancel">Cancel and return</a>

                </td>

              </tr>

            </table>

          </td>

        </tr>

      </table>

    </form>

  </xsl:template>



  <xsl:template name="optionMenuNewColumn">

    <form name="formNewColumn" method="post" action="">

      <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-background-content">

        <tr class="uportal-background-light">

          <td class="uportal-channel-text">

            <p>

              <span class="uportal-channel-subtitle-reversed">Steps for adding this new column:</span>

            </p>



            <table width="100%" border="0" cellspacing="0" cellpadding="2">

              <tr>

                <td class="uportal-channel-text">

                  <strong>1.</strong>

                </td>



                <td class="uportal-channel-text">Set the width of the columns (column widths should total 100%):</td>

              </tr>



              <tr>

                <td class="uportal-channel-text">

                  <img alt="interface image" src="{$mediaPath}\transparent.gif" width="1" height="1" />

                </td>



                <td class="uportal-channel-text">

                  <table width="100%" border="0" cellspacing="0" cellpadding="2">

                    <tr valign="top">

                      <td nowrap="nowrap" align="center">

                        <img alt="interface image" src="{$mediaPath}\transparent.gif" width="16" height="16" />

                      </td>



                      <input type="hidden" name="action" value="coulmnWidth" />



                      <xsl:for-each select="/layout/folder[@ID = $activeTabID]/descendant::folder">

                        <xsl:if test="$position='before' and $elementID=@ID">

                          <td nowrap="nowrap" align="center" class="uportal-text-small">

                            <input type="text" name="columnWidth_{@ID}" value="" size="5" maxlength="" class="uportal-input-text" />



                            <br/>



                            <strong>New Column</strong>

                          </td>



                          <td nowrap="nowrap">

                            <img alt="interface image" src="{$mediaPath}\transparent.gif" width="16" height="16" />

                          </td>

                        </xsl:if>



                        <td nowrap="nowrap" align="center" class="uportal-text-small">

                        <input type="text" name="columnWidth_{@ID}" value="{@width}" size="5" maxlength="" class="uportal-input-text" />



                        <br/>



                        Column</td>



                        <td nowrap="nowrap">

                          <img alt="interface image" src="{$mediaPath}\transparent.gif" width="16" height="16" />

                        </td>



                        <xsl:if test="$position='after' and $elementID=@ID">

                          <td nowrap="nowrap" align="center" class="uportal-text-small">

                            <input type="text" name="columnWidth_{@ID}" value="" size="5" maxlength="" class="uportal-input-text" />



                            <br/>



                            <strong>New Column</strong>

                          </td>



                          <td nowrap="nowrap">

                            <img alt="interface image" src="{$mediaPath}\transparent.gif" width="16" height="16" />

                          </td>

                        </xsl:if>

                      </xsl:for-each>



                      <td width="100%" align="left" nowrap="nowrap">

                        <img alt="interface image" src="{$mediaPath}\transparent.gif" width="1" height="1" />

                      </td>

                    </tr>



                    <tr valign="top" class="uportal-text-small">

                    </tr>

                  </table>

                </td>

              </tr>



              <tr>

                <td class="uportal-channel-text">

                  <strong>2.</strong>

                </td>



                <td class="uportal-channel-text">Submit the choices: 

                <img alt="interface image" src="{$mediaPath}\transparent.gif" width="10" height="10" />



                <input type="submit" name="submitNewColumn" value="Submit" class="uportal-button" />

                </td>

              </tr>



              <tr>

                <td class="uportal-channel-text" colspan="2">

                  <hr/>

                </td>

              </tr>



              <tr>

                <td class="uportal-channel-text">

                  <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" />

                </td>



                <td class="uportal-channel-text" width="100%">

                  <a href="{$baseActionURL}?action=cancel">Cancel and return</a>

                </td>

              </tr>

            </table>

          </td>

        </tr>

      </table>

    </form>

  </xsl:template>



  <xsl:template name="optionMenuNewChannel">

    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-background-content">

      <tr class="uportal-background-light">

        <td class="uportal-channel-text">

          <p>

            <span class="uportal-channel-subtitle-reversed">Options for moving this channel:</span>

          </p>



          <table width="100%" border="0" cellspacing="0" cellpadding="0">

            <tr>

              <td class="uportal-channel-text">

                <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

              </td>



              <td class="uportal-channel-text">

                <a href="#">Select one of the highlighted locations below, or select a different tab on which to place this channel</a>

              </td>

            </tr>



            <tr>

              <td class="uportal-channel-text" colspan="2">

                <hr/>

              </td>

            </tr>



            <tr>

              <td class="uportal-channel-text">

                <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

              </td>



              <td class="uportal-channel-text" width="100%">

                <a href="{$baseActionURL}?action=cancel">Cancel and return</a>

              </td>

            </tr>

          </table>

        </td>

      </tr>

    </table>

  </xsl:template>



  <xsl:template name="optionMenuMoveColumn">

    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-background-content">

      <tr class="uportal-background-light">

        <td class="uportal-channel-text">

          <p>

            <span class="uportal-channel-subtitle-reversed">Options for moving this column:</span>

          </p>



          <table width="100%" border="0" cellspacing="0" cellpadding="0">

            <tr>

              <td class="uportal-channel-text">

                <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

              </td>



              <td class="uportal-channel-text">

                <a href="#">Select one of the highlighted locations below, or select a different tab on which to place this column</a>

              </td>

            </tr>



            <tr>

              <td class="uportal-channel-text" colspan="2">

                <hr/>

              </td>

            </tr>



            <tr>

              <td class="uportal-channel-text">

                <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

              </td>



              <td class="uportal-channel-text" width="100%">

                <a href="{$baseActionURL}?action=cancel">Cancel and return</a>

              </td>

            </tr>

          </table>

        </td>

      </tr>

    </table>

  </xsl:template>



  <xsl:template name="optionMenuMoveChannel">

    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-background-content">

      <tr class="uportal-background-light">

        <td class="uportal-channel-text">

          <p>

            <span class="uportal-channel-subtitle-reversed">Options for moving this channel:</span>

          </p>



          <table width="100%" border="0" cellspacing="0" cellpadding="0">

            <tr>

              <td class="uportal-channel-text">

                <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

              </td>



              <td class="uportal-channel-text">

                <a href="#">Select one of the highlighted locations below, or select a different tab on which to place this channel</a>

              </td>

            </tr>



            <tr>

              <td class="uportal-channel-text" colspan="2">

                <hr/>

              </td>

            </tr>



            <tr>

              <td class="uportal-channel-text">

                <img alt="interface image" src="{$mediaPath}\bullet.gif" width="16" height="16" border="0" />

              </td>



              <td class="uportal-channel-text" width="100%">

                <a href="{$baseActionURL}?action=cancel">Cancel and return</a>

              </td>

            </tr>

          </table>

        </td>

      </tr>

    </table>

  </xsl:template>



  <xsl:template name="optionMenuError">

    <table width="100%" border="0" cellspacing="0" cellpadding="10" class="uportal-background-content">

      <tr class="uportal-background-light">

        <td class="uportal-channel-text">

          <p>

            <span class="uportal-channel-subtitle-reversed">The following error was reported:</span>

          </p>



          <xsl:value-of select="$errorMessage" />

        </td>

      </tr>

    </table>

  </xsl:template>

</xsl:stylesheet>

