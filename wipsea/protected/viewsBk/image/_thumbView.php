<?php
/* @var $this ImageController */
/* @var $data Image */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('name')); ?>:</b>
	<?php echo CHtml::encode($data->name); ?>
	<br />
<?php //echo CHtml::link(
//CHtml::image(
 //  ImageHelper::thumb(40, 40, '/images/upload/1402394672visuel6.jpg', array('method' => 'adaptiveResize')),
 //  ),
 //  , array('view', 'id'=>$data->id));

//echo CHtml::image(Yii::app()->basePath.$data->img_path);
//CVarDumper::dump( YiiBase::getPathOfAlias('webroot'));
//CVarDumper::dump(Yii::app()->basePath.$data->img_path));
// echo CHtml::image(Yii:app()->request->baseUrl.'/images/upload/'.$data->image,"image",array("width"=>200))
 ?></b>
    <br>

</div>