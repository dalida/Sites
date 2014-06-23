<?php
/* @var $this ImageQueueController */
/* @var $model ImageQueue */

$this->breadcrumbs=array(
	'Image Queues'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List ImageQueue', 'url'=>array('index')),
	array('label'=>'Manage ImageQueue', 'url'=>array('admin')),
);
?>

<h1>Create ImageQueue</h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>