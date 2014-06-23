<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name . ' - Images';
$this->breadcrumbs=array(
	'Images',
);

$models=$dataProvider->getData();
?>

<h1>Images</h1>

<div class="imagesBody">
<div class="imagesContainer">
  <div class="sidebar1">
  <div id="title_sidebar1">
      <h4>Workspace</h4>
    <div class="workspace">
<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_thumbView',
));

 ?>
    </div>

  </div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
    <!-- end .sidebar1 --></div>

  <div class="imagesTabs">
    <div id="TabbedPanels1" class="TabbedPanels">
<?php $this->widget('zii.widgets.jui.CJuiTabs',array(
    'tabs'=>array(
        'Image 1'=>array('content'=>Chtml::image($dataProvider->getData()[0]->img_path, null, array('class'=>'imagesTab'))
        ),
        'Processed'=>'Content for tab 1',
        'Processed'=>array('content'=>'Content for tab 2', 'id'=>'tab2'),
        'Not Processed'=>array('content'=>'Content for tab 3', 'id'=>'tab3'),
    ),
    // additional javascript options for the tabs plugin
    'options'=>array(
        'collapsible'=>true,
    ),
));
?>
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
    <td><div align="left"><?php echo $models[0]->name ?></div></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Longitude:</div></th>
    <td><div align="left"><?php echo $models[0]->longitude ?></div></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Latitude:</div></th>
          <td><div align="left"><?php echo $models[0]->latitude ?></div></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Altitude:</div></th>
          <td><div align="left"><?php echo $models[0]->altitude ?></div></td>
        </tr>
        <tr>
          <th scope="row"><div align="right">Wildlife:</div></th>
          <td align="left">
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
          <td><div align="left">Yes</div></td>
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