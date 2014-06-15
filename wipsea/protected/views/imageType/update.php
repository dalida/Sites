<?php
/* @var $this ImageTypeController */
/* @var $model ImageType */

$this->breadcrumbs=array(
	'Image Types'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List ImageType', 'url'=>array('index')),
	array('label'=>'Create ImageType', 'url'=>array('create')),
	array('label'=>'View ImageType', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage ImageType', 'url'=>array('admin')),
);
?>

<h1>Update ImageType <?php echo $model->id; ?></h1>

<?php $this->renderPartial('_form', array('model'=>$model)); ?>