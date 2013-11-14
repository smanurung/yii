<?php

/**
 * This is the model class for table "user".
 *
 * The followings are the available columns in table 'user':
 * @property integer $ID
 * @property string $email
 * @property string $password
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property string $address
 * @property string $phone
 * @property string $gender
 * @property string $city
 * @property string $province
 * @property string $postcode
 * @property integer $total_miles
 * @property integer $current_miles
 *
 * The followings are the available model relations:
 * @property Ticket[] $tickets
 */
class User extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return User the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('email, password, first_name, address, phone, gender, city, province, postcode, total_miles, current_miles', 'required'),
			array('total_miles, current_miles', 'numerical', 'integerOnly'=>true),
			array('email, password, city, province', 'length', 'max'=>100),
			array('first_name, middle_name, last_name', 'length', 'max'=>50),
			array('address', 'length', 'max'=>200),
			array('phone', 'length', 'max'=>20),
			array('gender', 'length', 'max'=>6),
			array('postcode', 'length', 'max'=>10),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('ID, email, password, first_name, middle_name, last_name, address, phone, gender, city, province, postcode, total_miles, current_miles', 'safe', 'on'=>'search'),
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
			'tickets' => array(self::HAS_MANY, 'Ticket', 'ID_user'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'ID' => 'ID',
			'email' => 'Email',
			'password' => 'Password',
			'first_name' => 'First Name',
			'middle_name' => 'Middle Name',
			'last_name' => 'Last Name',
			'address' => 'Address',
			'phone' => 'Phone',
			'gender' => 'Gender',
			'city' => 'City',
			'province' => 'Province',
			'postcode' => 'Postcode',
			'total_miles' => 'Total Miles',
			'current_miles' => 'Current Miles',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('ID',$this->ID);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('first_name',$this->first_name,true);
		$criteria->compare('middle_name',$this->middle_name,true);
		$criteria->compare('last_name',$this->last_name,true);
		$criteria->compare('address',$this->address,true);
		$criteria->compare('phone',$this->phone,true);
		$criteria->compare('gender',$this->gender,true);
		$criteria->compare('city',$this->city,true);
		$criteria->compare('province',$this->province,true);
		$criteria->compare('postcode',$this->postcode,true);
		$criteria->compare('total_miles',$this->total_miles);
		$criteria->compare('current_miles',$this->current_miles);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}