<?php

class ImageController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';
//    const IMAGE_PATH = '/../images/upload/';

    const IMAGE_PATH = '/images/upload/';
    const IMAGE_TYPE = 'BACKGROUND';
//    const IMAGE_THUMB_PATH = '/../images/upload/thumbs/';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
                'actions'=>array('index','view','list'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new Image;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Image']))
		{
			$model->attributes=$_POST['Image'];
            date_default_timezone_set('America/New_York');
            $datetime = date('Y-m-d-H-i-s');
            $model->created = $datetime;
            $model->last_update = $datetime;
            $model->created_by = Yii::app()->user->id;

            // upload
            $uploadedFile = CUploadedFile::getInstance($model,'image');
            //CVarDumper::dump($_POST);
            //CVarDumper::dump($model->attributes);
            if($uploadedFile !== null)
            {
                //CVarDumper::dump($_FILES);
                $fileName = $datetime."-".$uploadedFile->getName();
                $model->name=$fileName;
                $model->image=$fileName;
                $model->type=self::IMAGE_TYPE;
                $model->img_path = 'images/upload/'.$fileName;
//                $model->img_path = Yii::app()->basePath.self::IMAGE_PATH.$fileName;
//                $model->img_thumb_path = self::IMAGE_THUMB_PATH;
            }

			if($model->save())
            {
                //$uploadedFile->saveAs(Yii::app()->basePath.self::IMAGE_PATH.$fileName);
                $uploadedFile->saveAs(Yii::app()->baseUrl.self::IMAGE_PATH.$fileName);
                $this->redirect(array('view','id'=>$model->id));
            }
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Image']))
		{
			$model->attributes=$_POST['Image'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
//        echo ImageHelper::thumb(40, 40, '/images/upload/1402394672visuel6.jpg', array('method' => 'adaptiveResize'));
//  exit;
		$dataProvider=new CActiveDataProvider('Image');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * List images
	 */
	public function actionList()
	{
		$dataProvider=new CActiveDataProvider('Image');
		$this->render('list',array(
			'dataProvider'=>$dataProvider,
		));
	}


	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Image('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Image']))
			$model->attributes=$_GET['Image'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Image the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Image::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Image $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='image-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
