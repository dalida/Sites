<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name . ' - Images';
$this->breadcrumbs=array(
	'Images',
);
?>

<h1>Images</h1>

<div class="imagesBody">
<div class="imagesContainer">
  <div class="sidebar1">
  <div id="title_sidebar1">
      <h4>Workspace</h4>
<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_thumbView',
)); ?>

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
  <div class="imagesTabs">
    <div id="TabbedPanels1" class="TabbedPanels">
      <ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab" tabindex="0">Processed</li>
        <li class="TabbedPanelsTab" tabindex="0">Not Processed</li>
        <li class="TabbedPanelsTab" tabindex="0">Image 1</li>
</ul>
      <div class="TabbedPanelsContentGroup">
        <div class="TabbedPanelsContent">
        </div>
        <div class="TabbedPanelsContent">
        </div>

        <div class="TabbedPanelsContent">
          <p><img src="images/bandeaux/visuel3.jpg" width="100%" height="330" align="middle" /></p>
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
          <td><div align="center">3.568475</div></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Wildlife:</div></th>
          <td align="center">
            <select class="TabbedPanelsTabGroup">
              <option value="baleine">Baleine</option>
              <option value="dauphin">Dauphin</option>
              <option value="poisson">Poisson</option>
              <option value="requin">Requin</option>
              <option value="tortue">Tortue</option>
            </select>
          </td>
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
</div>
</div>