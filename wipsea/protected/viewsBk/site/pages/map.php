<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name . ' - Wildlife';
$this->breadcrumbs=array(
	'Map',
);
?>

<div class="container">
  <div class="sidebar1">
  <div id="head_map">
      <h4>Map</h4>
    </div>
    <p>View wildlife according on map by:</p>
    <form id="form1" name="form1" method="post" action="">
  <p>
        <label>
          <input type="radio" name="RadioGroup1" value="opción" id="RadioGroup1_0" />
          Wildlife</label>
        <select class="TabbedPanelsTabGroup">
              <option value="Select Wildlife">Select Wildlife</option>
        </select>
        <br />
        <label>
          <input type="radio" name="RadioGroup1" value="opción" id="RadioGroup1_1" />
          Image</label>
        <br />
        <label>
          <input type="radio" name="RadioGroup1" value="opción" id="RadioGroup1_2" />
          Date</label>
        <br />
      </p>
  </form>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  <!-- end .sidebar1 --></div>
<!-- end .container --><img src="images/map.png" width="672" height="484" /></div>
</body>
</html>