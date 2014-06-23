<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin título</title>
<link href="../../../../css/tutoriel.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div class="container">
  <div class="sidebar1">
  <div id="title_sidebar1">
      <h4>Workspace</h4>
    </div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <!-- end .sidebar1 --></div>
  <div class="content">
    <div id="TabbedPanels1" class="TabbedPanels">
      <ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab" tabindex="0">Processed</li>
        <li class="TabbedPanelsTab" tabindex="0">Not Processed</li>
        <li class="TabbedPanelsTab" tabindex="0">Image 1</li>
</ul>
      <div class="TabbedPanelsContentGroup">
        <div class="TabbedPanelsContent">
          <p>&nbsp;</p>
          <p>Contenido 1</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
        </div>
        <div class="TabbedPanelsContent">
          <p>&nbsp;</p>
          <p>Contenido 2</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
        </div>
        <div class="TabbedPanelsContent">
          <p><img src="images/bandeaux/visuel3.jpg" width="585" height="330" align="middle" /></p>
          <form id="form1" name="form1" method="post" action="">
            <input name="image_tik" type="checkbox" class="TabbedPanelsTabHover" id="image_tik" checked="checked" />
            <label for="image_tik"></label>
          </form>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
        </div>
      </div>
    </div>
  </div>
  <div class="sidebar2">
    <div id="title_image">
      <h4>Image 1    </h4>
    </div>
    <div id="image_caract">
      <table width="88%" align="center">
        <tr>
          <th scope="row"><div align="right">Image:</div></th>
          <td><div align="center">Image 1</div></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Longitude:</div></th>
          <td><div align="center">48.35954</div></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Latitude:</div></th>
          <td><div align="center">-4.570347</div></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Altitude:</div></th>
          <td><div align="center">
            <p>3.568475          </p>
          </div></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Wildlife:</div></th>
          <td><p align="center">
            <select class="TabbedPanelsTabGroup">
              <option value="baleine">Baleine</option>
              <option value="dauphin">Dauphin</option>
              <option value="poisson">Poisson</option>
              <option value="requin">Requin</option>
              <option value="tortue">Tortue</option>
            </select>
          </p></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Processed:</div></th>
          <td><div align="center">Yes</div></td>
        </tr>
      </table>
       <p>&nbsp;</p>
      <ul class="nav">
      <li><a href="#">Modify</a></li>
      <li><a href="#">Process</a></li>
    </ul>

     
    </div>
    <div id="image_fin">
      <div id="sidebar2_down">
        <p>&nbsp;</p>
        <ul class="nav">
          <li><a href="#">Select All Images</a></li>
          <li><a href="#">Process All Selected</a>    </li>
        </ul>
      <p>&nbsp;</p>
      </div>
    </div>

    <!-- end .sidebar2 --></div>
  <p>&nbsp;</p>
  <!-- end .container --></div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1", {defaultTab:1});
</script>
</body>
</html>