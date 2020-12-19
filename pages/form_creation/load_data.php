<?php 
	extract($_POST);
	if(isset($_POST['readrecord'])) {
		session_start();

		include 'database-connection/view.class.php';
		$model = new View();
		$formdata = $model->fetchFormNameAndDesc($_SESSION['F_id']);

		$data = '<div class=" flex-container">
						<div class="header container-fluid">
						<div class="row titlerow">
						<div class="col-8 md-form">
							<input type="text" class="title" value="'.$formdata[0]['Form_name'].'" placeholder="Form Name" disabled>
						</div>
						</div>
						<div class="row descrow">
						<div class="col-8 md-form">
							<input type="text" class="desc" value="'.$formdata[0]['Form_Desc'].'" placeholder="Form Description" disabled>
						</div>
						</div>
						</div>
						<br>';

		//include 'database-connection/view.class.php';
		$view = new View();
		$rows = $view->fetchRecords();
		if(!empty($rows)){
		$number = 1;
		foreach($rows as $row )

		{
			$data .= '<div class="content " id="'.$row['Q_id'].'">
						<div class="row firstrow">
							<div class="col-8 md-form">
							<input type="text" id="questionarea'.$number.'" class="questionclass form-control" value="'.$row['Question_desc'].'" onChange="updatetheparticularchange(this,1,'.$row['Q_id'].')">
              </div>
              <div class="col-4">
              <div class="d-flex flex-row-reverse bd-highlight">
              <div class="p-2 bd-highlight">
			    		<button class="btn del" 
			    		 onclick="deleteQuestion('.$row['Q_id'].')"><i class="material-icons" data-toggle="tooltip"
  						data-placement="top" title="Delete">delete</i></button>
			    		 </div>
			    		 <div class="p-2 bd-highlight">
			    		<button class="btn copy" 
			    		onclick="duplicate1('.$row['Q_id'].')"><i class="material-icons" data-toggle="tooltip"
  						data-placement="top" title="Copy">content_copy</i></button>
			    		</div>
			    		</div>
			    		</div>
			    		</div>

			    		<div class="row secondrow">
              <div class="col-6 selectbox">
              <label for="type">Type:</label>
			    		<select name="select'.$number.'" onChange="updatetheparticularchange(this,2,'.$row['Q_id'].')" class="selectarea browser-default custom-select">
			    			<option value="'.$row['type'].'" selected hidden>'.$row['type'].'</option>
			    			<option value="text" >text</option>
			    			<option value="radio">radio</option>
								<option value="multiplechoice">multiplechoice</option>
								<option value="linearscale">linear scale</option>
			    			<option value="rating">rating</option>
			    		</select>
			    		</div>
			    		<div class="col-6" class="ratingdisplay" name="ratingdisplay">
				    		<label for="rating">Rating Scale:</label>
				    		<select id="rating" onChange="updatetheparticularchange(this,8,'.$row['Q_id'].')" class="ratingscalearea browser-default custom-select">
				    		<option value="'.$row['rating_scale'].'" selected hidden>'.$row['rating_scale'].'</option>
				    		<option value="2">2</value>
				    		<option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
				    		</select>
				    	</div>
			    		</div>

			    	<div class="row thirdrow">
							<div id="select'.$number.'" class="optionarea" name="optionarea">
							<div name="optionclass1" class="optionclassdiv form-group">
								<input type="text" class="optionclass form-control" value="'.$row['Option1'].'"
								placeholder="Option 1" onChange="updatetheparticularchange(this,3,'.$row['Q_id'].')"><br>
	    				</div>
	    				<div name="optionclass2" class="optionclassdiv form-group">
				    		<input type="text" class="optionclass form-control" value="'.$row['Option2'].'"
				    		placeholder="Option 2" onChange="updatetheparticularchange(this,4,'.$row['Q_id'].')"><br>
				    	</div>
				    	<div name="optionclass3" class="optionclassdiv form-group">	
				    		<input type="text" class="optionclass form-control" value="'.$row['Option3'].'"
				    		placeholder="Option 3" onChange="updatetheparticularchange(this,5,'.$row['Q_id'].')"><br>
				    	</div>
				    	<div name="optionclass4" class="optionclassdiv form-group">	
				    		<input type="text" class="optionclass form-control" value="'.$row['Option4'].'"
				    		placeholder="Option 4" onChange="updatetheparticularchange(this,6,'.$row['Q_id'].')"><br>
				    	</div>
				    	<div name="optionclass5" class="optionclassdiv form-group">	
				    		<input type="text" class="optionclass form-control" value="'.$row['Option5'].'"
				    		placeholder="Option 5" onChange="updatetheparticularchange(this,7,'.$row['Q_id'].')"><br>
				    	</div>	
				    	</div>
				    	
						</div>
					</div><br>';
						$number++;
		}			
	}

			$data .= '<div>
								<button type="button" class="btn btn-success" onclick="openPreviewPage()">Preview</button>
								</div>
								</div>';
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
	if($value == 'linearscale'){
		$update1 = new Control();
		$update1->updateTypeWithScale($value, $id);
	}
	else{
	$update1 = new Control();
	$update1->updateType($value, $id);
}
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
else if($column == 8){
	$update6 = new Control();
	$update6->updateScale($value, $id);
}

}



 ?>

 