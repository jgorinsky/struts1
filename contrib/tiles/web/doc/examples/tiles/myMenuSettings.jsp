<%@ taglib uri="/WEB-INF/tiles.tld" prefix="tiles" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<%--
      Render a page allowing user to customize its menu.
	  @param choiceItems Available menu entries proposed as choice
	  @param userItems Actual user menu entries
--%>

<script language="javaScript1.2">
function selectAll( )
{
for( j=0; j<selectAll.arguments.length; j++ )
  {
  col1 = selectAll.arguments[j];
  for(i=0; i<col1.options.length; i++ )
    {
	col1.options[ i ].selected = true;
	}
  } // end loop
  return true;
}

function move( col1, col2)
{
  toMove = col1.options[ col1.selectedIndex ];
  opt = new Option( toMove.text, toMove.value, false, false );
  col1.options[col1.selectedIndex ] = null;
  col2.options[col2.length] = opt;
  return true;
}

function remove( col1)
{
  col1.options[ col1.selectedIndex ] = null;
  return true;
}

function up( col1 )
{
  index = col1.selectedIndex;
  if( index <= 0 )
    return true;
	
  toMove = col1.options[ index ];
  opt = new Option( toMove.text, toMove.value, false, false );
  col1.options[index] = col1.options[index-1];
  col1.options[index-1] = opt;
  return true;
}

function down( col1 )
{
  index = col1.selectedIndex;
  if( index+1 >=  col1.options.length )
    return true;
	
  toMove = col1.options[ index ];
  opt = new Option( toMove.text, toMove.value, false, false );
  col1.options[index] = col1.options[index+1];
  col1.options[index+1] = opt;
  return true;
}

</script>


<tiles:importAttribute name="choiceItems" />
<tiles:importAttribute name="userItems" />

<html:form action="/examples/myMenuSettings.do"  >


  
  
	  <ul>
	    <li>Choose an item from "Items Choice" colomn, and add it to "my Items" using the '>' button.</li>
		<li>You can also rearange your Menu by using appropriate buttons : '^', 'V' and 'delete'</li>
		<li>Validate your menu by clicking on 'validate' button. Load any page and check your menu !</li>
	  </ul>
  <table align="center">
  <tr>
    <td align="right">
	  Items Choice
	  <br>
	  <html:select property="selectedChoices" multiple="true" >
	    <html:options collection="choiceItems" property="link" labelProperty="value"/>
	  </html:select>
	</td>
	<td>
	  <html:button property=">" value=">" onclick="move(selectedChoices,selected);return true;"/>
	</td>
    <td align="left">
	  My Items
	  <br>
	  <html:select property="selected" multiple="true" size="10">
	    <html:options collection="userItems" property="link" labelProperty="value"/>
	  </html:select>
	  <br>
      <div align="center">	  
	  <html:button property="right" value="^"   onclick="up(selected);return true;"/>
	  <html:button property="right" value="del"   onclick="remove(selected);return true;"/>
	  <html:button property="right" value="v"   onclick="down(selected);return true;"/>
	  <br>
      <html:submit property="validate" value="validate" onclick="selectAll(selected);return true;"/></div>
	</td>
  </tr>
  </table>
  
  

  
</html:form>
