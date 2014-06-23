<?php

/**
 * This is the model class for table "image".
 *
 * The followings are the available columns in table 'image':
 * @property string $id
 * @property string $name
 * @property string $longitude
 * @property string $latitude
 * @property string $altitude
 * @property string $img_path
 * @property string $img_thumb_path
 * @property integer $type
 * @property integer $processed
 * @property integer $valid
 * @property string $created_by
 * @property string $created
 * @property string $last_update
 */
class Image extends CActiveRecord
{
    public $image;

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'image';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name, img_path, img_thumb_path, type, created_by, created, last_update', 'required'),
			array('processed, valid', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>60),
			array('longitude, latitude, altitude', 'length', 'max'=>50),
			array('img_path, img_thumb_path', 'length', 'max'=>255),
			array('type, created_by', 'length', 'max'=>128),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, name, longitude, latitude, altitude, img_path, img_thumb_path, type, processed, valid, created_by, created, last_update', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'name' => 'Name',
			'longitude' => 'Longitude',
			'latitude' => 'Latitude',
			'altitude' => 'Altitude',
			'img_path' => 'Img Path',
			'img_thumb_path' => 'Img Thumb Path',
			'type' => 'Type',
			'processed' => 'Processed',
			'valid' => 'Valid',
			'created_by' => 'Created By',
			'created' => 'Created',
			'last_update' => 'Last Update',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('longitude',$this->longitude,true);
		$criteria->compare('latitude',$this->latitude,true);
		$criteria->compare('altitude',$this->altitude,true);
		$criteria->compare('img_path',$this->img_path,true);
		$criteria->compare('img_thumb_path',$this->img_thumb_path,true);
		$criteria->compare('type',$this->type);
		$criteria->compare('processed',$this->processed);
		$criteria->compare('valid',$this->valid);
		$criteria->compare('created_by',$this->created_by,true);
		$criteria->compare('created',$this->created,true);
		$criteria->compare('last_update',$this->last_update,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Image the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
