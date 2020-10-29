<?php 
extract($_POST);
if(isset($_POST['readrecord'])){

	session_start();
$data = '<div class="container-fluid flex-container">
			<div class="header container-fluid">				
						<div class="col-8 md-form title">'.$_SESSION['Form_name'].'
						</div>				
						<div class="col-8 md-form desc">'.$_SESSION['Form_desc'].'
						</div>				
			</div>
			<br>'; 
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
						<input type="radio" value="'.$row['Option1'].'" class="option1" name="option">
						<label for="option1">'.$row['Option1'].'</label>
						</div>
						<div class="option2class">
						<input type="radio" value="'.$row['Option2'].'" class="option2" name="option">
						<label for="option2">'.$row['Option2'].'</label>
						</div>
						<div class="option3class">
						<input type="radio" value="'.$row['Option3'].'" class="option3" name="option">
						<label for="option3">'.$row['Option3'].'</label>
						</div>
						<div class="option4class">
						<input type="radio" value="'.$row['Option4'].'" class="option4" name="option">
						<label for="option4">'.$row['Option4'].'</label>
						</div>
						<div class="option5class">
						<input type="radio" value="'.$row['Option5'].'" class="option5" name="option">
						<label for="option5">'.$row['Option5'].'</label>
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
				<input type="text" class="form-control" placeholder="Enter your Answer"><br>
			</div>
			</div><br>';
			$number++;
		}
			else if($row['type'] == 'linearscale'){
				$data .='<div class="content container-fluid">
				<div class="question"><label>'.$number.'.</label>
				'.$row['Question_desc'].'</div>
					<div class="option row">
						<div class="option1class col-12 col-sm-4 col-md-3 col-lg">
						<input type="radio" value="'.$row['Option1'].'" class="option1" name="option">
						<label for="option1">'.$row['Option1'].'</label><br> 
						</div>
						<div class="option2class col-12 col-sm-4 col-md-3 col-lg">
						<input type="radio" value="'.$row['Option2'].'" class="option2" name="option">
						<label for="option2">'.$row['Option2'].'</label><br>
						</div>
						<div class="option3class col-12 col-sm-4 col-md-3 col-lg">
						<input type="radio" value="'.$row['Option3'].'" class="option3" name="option">
						<label for="option3">'.$row['Option3'].'</label><br>
						</div>
						<div class="option4class col-12 col-sm-4 col-md-3 col-lg">
						<input type="radio" value="'.$row['Option4'].'" class="option4" name="option">
						<label for="option4">'.$row['Option4'].'</label><br>
						</div>
						<div class="option5class col-12 col-sm-4 col-md-3 col-lg">
						<input type="radio" value="'.$row['Option5'].'" class="option5" name="option">
						<label for="option5">'.$row['Option5'].'</label><br>
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
								    <input type="radio" id="star5'.$row['Q_id'].'" name="rate'.$row['Q_id'].'" value="5" />
								    <label for="star5'.$row['Q_id'].'" title="5">5 stars</label>
								    <input type="radio" id="star4'.$row['Q_id'].'" name="rate'.$row['Q_id'].'" value="4" />
								    <label for="star4'.$row['Q_id'].'" title="text">4 stars</label>
								    <input type="radio" id="star3'.$row['Q_id'].'" name="rate'.$row['Q_id'].'" value="3" />
								    <label for="star3'.$row['Q_id'].'" title="text">3 stars</label>
								    <input type="radio" id="star2'.$row['Q_id'].'" name="rate'.$row['Q_id'].'" value="2" />
								    <label for="star2'.$row['Q_id'].'" title="text">2 stars</label>
								    <input type="radio" id="star1'.$row['Q_id'].'" name="rate'.$row['Q_id'].'" value="1" />
								    <label for="star1'.$row['Q_id'].'" title="text">1 star</label>
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
						<input type="checkbox" value="'.$row['Option1'].'" class="option1" name="option">
						<label for="option1">'.$row['Option1'].'</label><br> 
						</div>
						<div class="option2class">
						<input type="checkbox" value="'.$row['Option2'].'" class="option2" name="option">
						<label for="option2">'.$row['Option2'].'</label><br>
						</div>
						<div class="option3class">
						<input type="checkbox" value="'.$row['Option3'].'" class="option3" name="option">
						<label for="option3">'.$row['Option3'].'</label><br>
						</div>
						<div class="option4class">
						<input type="checkbox" value="'.$row['Option4'].'" class="option4" name="option">
						<label for="option4">'.$row['Option4'].'</label><br>
						</div>
						<div class="option5class">
						<input type="checkbox" value="'.$row['Option5'].'" class="option5" name="option">
						<label for="option5">'.$row['Option5'].'</label><br>
						</div>
					</div>
					</div><br>';
			$number++;
			}
		}
		
	}
	$data .= '<div>
				<button type="button" class="btn btn-primary" id="print" onclick="printPage()">Print</button>
			  </div>
			</div>';
	echo $data;
}
?>