<?php
/* @var $this ImageTypeController */
/* @var $model ImageType */

$this->breadcrumbs=array(
	'Image Types'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List ImageType', 'url'=>array('index')),
	array('label'=>'Create ImageType', 'url'=>array('create')),
	array('label'=>'Update ImageType', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete ImageType', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage ImageType', 'url'=>array('admin')),
);
?>

<h1>View ImageType #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'type',
	),
)); ?>
