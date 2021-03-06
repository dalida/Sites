<?php
/* @var $this ImageController */
/* @var $model Image */

$this->breadcrumbs=array(
	'Images'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List Image', 'url'=>array('list')),
	array('label'=>'Create Image', 'url'=>array('create')),
	array('label'=>'Update Image', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete Image', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage Image', 'url'=>array('admin')),
//    array('label'=>'image', 'type'=>'raw', 'value'=>CHtml::image(Yii:app()->baseUrl.'/images/'.$model->image),),
);
?>

<h1>View Image #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'name',
		'longitude',
		'latitude',
		'altitude',
	    array(
            'label'=>'Image',
            'type'=>'raw',
            'value'=>
                CHtml::image(
                    ImageHelper::thumb(40, 40, 'images/upload/1402394672visuel6.jpg', array('method'=>'adaptiveResize'))
                ), 
                array('id'=>$model->id),
        ),
     	'img_path',
		'type',
		'processed',
		'valid',
		'created_by',
		'created',
		'last_update',
	),
)); ?>
