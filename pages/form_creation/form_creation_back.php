<?php 
	$con = mysqli_connect('localhost','root','','form_creation');
	extract($_POST);

	if(isset($_POST['readrecord'])) {

		$data = '<div class="container">';

		$displayquery = " SELECT * FROM `create_form` ";
		$result = mysqli_query($con,$displayquery);

		if(mysqli_num_rows($result) > 0){
		$number = 1;
		while ($row = mysqli_fetch_array($result)){

			$data .= '<div class="row">
						<div class="content container-fluid">
						<label>'.$number.'</label>
						<textarea style="height:100px;width:500px">'.$row['question'].'</textarea>
						<div>
							<label>Option 1:</label>
	    					<textarea style="width:300px">'.$row['option1'].'</textarea><br>
				    		<label>Option 2:</label>
				    		<textarea style="width:300px">'.$row['option2'].'</textarea><br>
				    		<label>Option 3:</label>
				    		<textarea style="width:300px">'.$row['option3'].'</textarea><br>
				    		<label>Option 4:</label>
				    		<textarea style="width:300px">'.$row['option4'].'</textarea><br>
				    		<label>Option 5:</label>
				    		<textarea style="width:300px">'.$row['option5'].'</textarea><br>
						</div>
						</div>
						</div>';
						$number++;
		}			
	}

			$data .= '</div>';
			echo $data;

}

if(isset($_POST['question']) && isset($_POST['option1']) && isset($_POST['option2']) && isset($_POST['option3']) && isset($_POST['option4']) && isset($_POST['option5']))
{
	$query = " INSERT INTO `create_form` (`question`, `option1`, `option2`, `option3`, `option4`, `option5`) 
				VALUES ( '$question', '$option1', '$option2', '$option3', '$option4', '$option5' )";
	mysqli_query($con,$query);
}

 ?>