<?php
/* @var $this ImageQueueController */
/* @var $model ImageQueue */

$this->breadcrumbs=array(
	'Image Queues'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List ImageQueue', 'url'=>array('index')),
	array('label'=>'Create ImageQueue', 'url'=>array('create')),
	array('label'=>'Update ImageQueue', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete ImageQueue', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ImageQueue', 'url'=>array('admin')),
);
?>

<h1>View ImageQueue #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'image_id',
		'status',
	),
)); ?>
