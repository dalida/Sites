<?php
/* @var $this ImageController */
/* @var $data Image */
?>

<div class="procview">

    <?php echo CHtml::link(
        CHtml::image(
            ImageHelper::thumb(40, 40, $data->img_path, array('method'=>'adaptiveResize'))
        ), 
        array('view', 'id'=>$data->id)
    );
    ?>
	<br />
	<?php echo CHtml::encode($data->name); ?>

</div>