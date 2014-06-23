<?php
/* @var $this ImageQueueController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Image Queues',
);

$this->menu=array(
	array('label'=>'Create ImageQueue', 'url'=>array('create')),
	array('label'=>'Manage ImageQueue', 'url'=>array('admin')),
);
?>

<h1>Image Queues</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
