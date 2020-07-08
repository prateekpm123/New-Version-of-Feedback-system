<?php 
	extract($_POST);

	if(isset($_POST['readrecord'])) {

		$data = '<div class="row">';

		include 'database-connection/view.class.php';
		$view = new View();
		$rows = $view->fetchRecords();
		if(!empty($rows)){
		$number = 1;
		foreach($rows as $row )

		{

			$data .= '<div class="content container-fluid">
						<label>'.$number.'.</label>
						<input type="text" id="questionarea'.$number.'" value="'.$row['Question_desc'].'"
						style="width: 50%;padding: 12px 20px;margin: 8px 0;box-sizing: border-box;
                 				 border: 3px solid #ccc; -webkit-transition: 0.5s; transition: 0.5s;
                  					outline: none;" onChange="updatetheparticularchange(this,1,'.$row['Q_id'].')">
                  		<label for="type">Type:</label>
			    		<select name="select'.$number.'" onChange="updatetheparticularchange(this,2,'.$row['Q_id'].')" class="selectarea">
			    			<option value="'.$row['type'].'">'.$row['type'].'</option>
			    			<option value="text" >text</option>
			    			<option value="radio">radio</option>
			    			<option value="multiplechoice">multiplechoice</option>
			    		</select>
			    		<button class="btn material-icons"
			    		style="padding-left:10px;padding-bottom:10px;" onclick="deleteQuestion('.$row['Q_id'].')">delete</button>		  
							<div id="select'.$number.'" class="optionarea" name="optionarea" style="padding-left: 30px;">
							<label>1.</label>
	    					<input type="text" style="width:300px;height:30px" value="'.$row['Option1'].'" onChange="updatetheparticularchange(this,3,'.$row['Q_id'].')"><br>
				    		<label>2.</label>
				    		<input type="text" style="width:300px;height:30px" value="'.$row['Option2'].'" onChange="updatetheparticularchange(this,4,'.$row['Q_id'].')"><br>
				    		<label>3.</label>
				    		<input type="text" style="width:300px;height:30px" value="'.$row['Option3'].'" onChange="updatetheparticularchange(this,5,'.$row['Q_id'].')"><br>
				    		<label>4.</label>
				    		<input type="text" style="width:300px;height:30px" value="'.$row['Option4'].'" onChange="updatetheparticularchange(this,6,'.$row['Q_id'].')"><br>
				    		<label>5.</label>
				    		<input type="text" style="width:300px;height:30px" value="'.$row['Option5'].'" onChange="updatetheparticularchange(this,7,'.$row['Q_id'].')"><br>
						    </div>
						</div>';
						$number++;
		}			
	}

			$data .= '</div>';
			echo $data;

}

if(isset($_POST['id']) && isset($_POST['value']) && isset($_POST['column'])) {
	$id = $_POST['id'];
	$value = $_POST['value'];
	$column = $_POST['column'];

	include 'database-connection/control.class.php';	
	if($column == 1){	
		$update = new Control();
		$update->updateQuestion($value, $id);
	}
	else if($column == 2){
		$update1 = new Control();
		$update1->updateType($value, $id);
	}
	else if($column == 3){
		$update2 = new Control();
		$update2->updateOption1($value, $id);
	}
	else if($column == 4){
		$update3 = new Control();
		$update3->updateOption2($value, $id);
	}
	else if($column == 5){
		$update4 = new Control();
		$update4->updateOption3($value, $id);
	}
	else if($column == 6){
		$update5 = new Control();
		$update5->updateOption4($value, $id);
	}
	else if($column == 7){
		$update6 = new Control();
		$update6->updateOption5($value, $id);
	}

}



 ?>

 