<?php
/* @var $this ImageQueueController */
/* @var $model ImageQueue */

$this->breadcrumbs=array(
	'Image Queues'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List ImageQueue', 'url'=>array('index')),
	array('label'=>'Create ImageQueue', 'url'=>array('create')),
	array('label'=>'View ImageQueue', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage ImageQueue', 'url'=>array('admin')),
);
?>

<h1>Update ImageQueue <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>