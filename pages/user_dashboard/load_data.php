<?php 
extract($_POST);
if(isset($_POST['readrecord'])){

	session_start();
	$form_id = $_SESSION['F_id'];
$data = '<div class="container-fluid flex-container">
			<div class="header container-fluid">				
						<div class="col-8 md-form title">'.$_SESSION['Form_name'].'
						</div>				
						<div class="col-8 md-form desc">'.$_SESSION['Form_desc'].'
						</div>				
			</div>
			<br>
			<form>'; 
include '../form_creation/database-connection/view.class.php';
$view = new View();
$rows = $view->fetchRecords();
if(!empty($rows)){
	$number = 1;
		foreach($rows as $row )
		{
			if($row['type'] == 'radio'){
			$data .='<div class="content container-fluid">
					<div class="question">
					<label>'.$number.'.</label>
					'.$row['Question_desc'].'</div>
					<div class="option">
						<div class="option1class">
						<input type="radio" value="'.$row['Option1'].'" id="option1'.$row['Q_id'].'" class="option1" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option1'.$row['Q_id'].'">'.$row['Option1'].'</label>
						</div>
						<div class="option2class">
						<input type="radio" value="'.$row['Option2'].'" id="option2'.$row['Q_id'].'" class="option2" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option2'.$row['Q_id'].'">'.$row['Option2'].'</label>
						</div>
						<div class="option3class">
						<input type="radio" value="'.$row['Option3'].'" id="option3'.$row['Q_id'].'" class="option3" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option3'.$row['Q_id'].'">'.$row['Option3'].'</label>
						</div>
						<div class="option4class">
						<input type="radio" value="'.$row['Option4'].'" id="option4'.$row['Q_id'].'" class="option4" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option4'.$row['Q_id'].'">'.$row['Option4'].'</label>
						</div>
						<div class="option5class">
						<input type="radio" value="'.$row['Option5'].'" id="option5'.$row['Q_id'].'" class="option5" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option5'.$row['Q_id'].'">'.$row['Option5'].'</label>
						</div>
					</div>
					</div><br>';
			$number++;
		}
			else if($row['type'] == 'text'){
			$data .='<div class="textcontent container-fluid" style="background-color: white;
																	border-radius: 15px;
								box-shadow: 0 0 2px rgba(0,0,0,.12), 0 2px 4px rgba(0,0,0,.24);">
			<div class="question"><label>'.$number.'.</label>
			'.$row['Question_desc'].'</div>
			<div class="optionfield form-group">
				<input type="text" class="form-control" placeholder="Enter your Answer" id="text'.$row['Q_id'].'"
				onChange="submitFormText('.$row['Q_id'].')"><br>
			</div>
			</div><br>';
			$number++;
		}
			else if($row['type'] == 'linearscale'){
				$data .='<div class="content container-fluid">
				<div class="question"><label>'.$number.'.</label>
				'.$row['Question_desc'].'</div>
					<div class="option row">
						<div class="option1class col-12 col-sm-4 col-md-3 col-lg-2">
						<input type="radio" value="'.$row['Option1'].'" id="option1'.$row['Q_id'].'" class="option1" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option1'.$row['Q_id'].'">'.$row['Option1'].'</label><br> 
						</div>
						<div class="option2class col-12 col-sm-4 col-md-3 col-lg-2">
						<input type="radio" value="'.$row['Option2'].'" id="option2'.$row['Q_id'].'" class="option2" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option2'.$row['Q_id'].'">'.$row['Option2'].'</label><br>
						</div>
						<div class="option3class col-12 col-sm-4 col-md-3 col-lg-2">
						<input type="radio" value="'.$row['Option3'].'" id="option3'.$row['Q_id'].'" class="option3" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option3'.$row['Q_id'].'">'.$row['Option3'].'</label><br>
						</div>
						<div class="option4class col-12 col-sm-4 col-md-3 col-lg-2">
						<input type="radio" value="'.$row['Option4'].'" id="option4'.$row['Q_id'].'" class="option4" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option4'.$row['Q_id'].'">'.$row['Option4'].'</label><br>
						</div>
						<div class="option5class col-12 col-sm-4 col-md-3 col-lg-2">
						<input type="radio" value="'.$row['Option5'].'" id="option5'.$row['Q_id'].'" class="option5" name="option['.$row['Q_id'].']" onChange="submitForm('.$row['Q_id'].')">
						<label for="option5'.$row['Q_id'].'">'.$row['Option5'].'</label><br>
						</div>
					</div>
					</div><br>';
			$number++;
			}
			else if($row['type'] == 'rating'){
				$data .='<div class="ratecontent container-fluid" style="background-color: white;
					border-radius: 15px;box-shadow: 0 0 2px rgba(0,0,0,.12), 0 2px 4px rgba(0,0,0,.24);">
								<div class="question"><label>'.$number.'.</label>
								'.$row['Question_desc'].'</div>
								<div class="optionrate row">
								 <div class="rate">
								    <input type="radio" id="option5'.$row['Q_id'].'" name="option['.$row['Q_id'].']" value="5" onChange="submitForm('.$row['Q_id'].')" />
								    <label for="option5'.$row['Q_id'].'" title="5">5 stars</label>
								    <input type="radio" id="option4'.$row['Q_id'].'" name="option['.$row['Q_id'].']" value="4" onChange="submitForm('.$row['Q_id'].')" />
								    <label for="option4'.$row['Q_id'].'" title="text">4 stars</label>
								    <input type="radio" id="option3'.$row['Q_id'].'" name="option['.$row['Q_id'].']" value="3" onChange="submitForm('.$row['Q_id'].')" />
								    <label for="option3'.$row['Q_id'].'" title="text">3 stars</label>
								    <input type="radio" id="option2'.$row['Q_id'].'" name="option['.$row['Q_id'].']" value="2" onChange="submitForm('.$row['Q_id'].')" />
								    <label for="option2'.$row['Q_id'].'" title="text">2 stars</label>
								    <input type="radio" id="option1'.$row['Q_id'].'" name="option['.$row['Q_id'].']" value="1" onChange="submitForm('.$row['Q_id'].')" />
								    <label for="option1'.$row['Q_id'].'" title="text">1 star</label>
								  </div>
								</div>
								</div><br>';
								$number++;
			}
			else if($row['type'] == 'multiplechoice'){
				$data .='<div class="content container-fluid">
				<div  class="question"><label>'.$number.'.</label>
				'.$row['Question_desc'].'</div>
					<div class="option">
						<div class="option1class">
						<input type="checkbox" value="'.$row['Option1'].'" id="option1'.$row['Q_id'].'" class="option1" name="option['.$row['Q_id'].']" onChange="submitFormMul('.$row['Q_id'].')">
						<label for="option1'.$row['Q_id'].'">'.$row['Option1'].'</label><br> 
						</div>
						<div class="option2class">
						<input type="checkbox" value="'.$row['Option2'].'" id="option2'.$row['Q_id'].'" class="option2" name="option['.$row['Q_id'].']" onChange="submitFormMul('.$row['Q_id'].')">
						<label for="option2'.$row['Q_id'].'">'.$row['Option2'].'</label><br>
						</div>
						<div class="option3class">
						<input type="checkbox" value="'.$row['Option3'].'" id="option3'.$row['Q_id'].'" class="option3" name="option['.$row['Q_id'].']" onChange="submitFormMul('.$row['Q_id'].')">
						<label for="option3'.$row['Q_id'].'">'.$row['Option3'].'</label><br>
						</div>
						<div class="option4class">
						<input type="checkbox" value="'.$row['Option4'].'" id="option4'.$row['Q_id'].'" class="option4" name="option['.$row['Q_id'].']" onChange="submitFormMul('.$row['Q_id'].')">
						<label for="option4'.$row['Q_id'].'">'.$row['Option4'].'</label><br>
						</div>
						<div class="option5class">
						<input type="checkbox" value="'.$row['Option5'].'" id="option5'.$row['Q_id'].'" class="option5" name="option['.$row['Q_id'].']" onChange="submitFormMul('.$row['Q_id'].')">
						<label for="option5'.$row['Q_id'].'">'.$row['Option5'].'</label><br>
						</div>
					</div>
					</div><br>';
			$number++;
			}
		}
		
	}
	$data .= '<div>
				<button type="button" class="btn btn-primary" onClick="redirect('.$form_id.')">Submit</button>
				</div>
				</form>
			</div>';
	echo $data;
}
?>