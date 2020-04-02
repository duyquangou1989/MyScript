<?php

class Database{
   
    private $dbh;
    private $error;
	private $stmt;
	
    public function __construct($host,$user,$pass,$dbname){
        $dsn = 'mysql:host=' . $host . ';dbname=' . $dbname.';charset=utf8';
        $options = array(
            PDO::ATTR_PERSISTENT    => true,
            PDO::ATTR_ERRMODE       => PDO::ERRMODE_EXCEPTION
        );
        
        try{
            $this->dbh = new PDO($dsn, $user, $pass, $options);
        }catch(PDOException $e){
            $this->error = $e->getMessage();
			$PATH='../logs/'.date('ymd').'_db.log';
            $arrLog["Output"]["mess"]=$e->getMessage();
            writelog($PATH,$arrLog);
        }
    }
	public function query($query){
		$this->stmt = $this->dbh->prepare($query);
	}
	
	public function bind($param, $value, $type = null){
		if (is_null($type)) {
			switch (true) {
				case is_int($value):
					$type = PDO::PARAM_INT;
					break;
				case is_bool($value):
					$type = PDO::PARAM_BOOL;
					break;
				case is_null($value):
					$type = PDO::PARAM_NULL;
					break;
				default:
					$type = PDO::PARAM_STR;
			}
		}
		$this->stmt->bindValue($param, $value, $type);
	}
	public function execute(){
		return $this->stmt->execute();
	}
	public function single(){
		$this->execute();
		return $this->stmt->fetch(PDO::FETCH_ASSOC);
	}
	public function rowCount(){
		return $this->stmt->rowCount();
	}
	public function resultset(){
		$this->execute();
		return $this->stmt->fetchAll(PDO::FETCH_ASSOC);
	}
}
?>