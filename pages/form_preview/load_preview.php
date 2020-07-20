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
						<div class="option1">
						<input type="radio" value="'.$row['Option1'].'" name="option1">
						<label for="option1">'.$row['Option1'].'</label>
						</div>
						<div class="option2">
						<input type="radio" value="'.$row['Option2'].'" name="option2">
						<label for="option2">'.$row['Option2'].'</label>
						</div>
						<div class="option3">
						<input type="radio" value="'.$row['Option3'].'" name="option3">
						<label for="option3">'.$row['Option3'].'</label>
						</div>
						<div class="option4">
						<input type="radio" value="'.$row['Option4'].'" name="option4">
						<label for="option4">'.$row['Option4'].'</label>
						</div>
						<div class="option5">
						<input type="radio" value="'.$row['Option5'].'" name="option5">
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
					<div class="option">
						<div class="option1">
						<input type="radio" value="'.$row['Option1'].'" name="option1">
						<label for="option1">'.$row['Option1'].'</label><br> 
						</div>
						<div class="option2">
						<input type="radio" value="'.$row['Option2'].'" name="option2">
						<label for="option2">'.$row['Option2'].'</label><br>
						</div>
						<div class="option3">
						<input type="radio" value="'.$row['Option3'].'" name="option3">
						<label for="option3">'.$row['Option3'].'</label><br>
						</div>
						<div class="option4">
						<input type="radio" value="'.$row['Option4'].'" name="option4">
						<label for="option4">'.$row['Option4'].'</label><br>
						</div>
						<div class="option5">
						<input type="radio" value="'.$row['Option5'].'" name="option5">
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
								    <input type="radio" name="rate" value="5" />
								    <label for="star5" title="5">5 stars</label>
								    <input type="radio" name="rate" value="4" />
								    <label for="star4" title="text">4 stars</label>
								    <input type="radio" name="rate" value="3" />
								    <label for="star3" title="text">3 stars</label>
								    <input type="radio" name="rate" value="2" />
								    <label for="star2" title="text">2 stars</label>
								    <input type="radio" name="rate" value="1" />
								    <label for="star1" title="text">1 star</label>
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
						<div class="option1">
						<input type="checkbox" value="'.$row['Option1'].'" name="option1">
						<label for="option1">'.$row['Option1'].'</label><br> 
						</div>
						<div class="option2">
						<input type="checkbox" value="'.$row['Option2'].'" name="option2">
						<label for="option2">'.$row['Option2'].'</label><br>
						</div>
						<div class="option3">
						<input type="checkbox" value="'.$row['Option3'].'" name="option3">
						<label for="option3">'.$row['Option3'].'</label><br>
						</div>
						<div class="option4">
						<input type="checkbox" value="'.$row['Option4'].'" name="option4">
						<label for="option4">'.$row['Option4'].'</label><br>
						</div>
						<div class="option5">
						<input type="checkbox" value="'.$row['Option5'].'" name="option5">
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