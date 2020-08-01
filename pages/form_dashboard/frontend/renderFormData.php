<?php

require "../backend/getFormDetails.php";


session_start();
renderData($_SESSION['admin_username']);


function renderData($username) {
    $formInfoObj = new FormInfo();
    $formData = $formInfoObj->giveFormDataToRender($username);
    
    $data = '<table class="table table-bordered table-striped">
                    <tr>
                        <th>No.</th>
                        <th>Form Name</th>
                        <th>Check Versions</th>
                        <th>Other Option</th>
                    </tr>';

    if(!empty($formData)){
		$number = 1;
		foreach($formData as $row ){
            $Form_name = $row['Form_name'];
			$data .= '<tr>
				<td>'.$number.'</td>
				<td contenteditable="true" onBlur="updateFormName(this,1,'.$row['F_id'].')">'.$Form_name.'</td>
				<td>
					<button onclick="getFormVersions('.$row['F_id'].');publishForm('.$row['F_id'].');" class="btn btn-info">View</button>
                </td>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Options
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <button class="dropdown-item" onclick="deleteForms('.$row['F_id'].')" >Delete</button>
                            <button class="dropdown-item" >Something else here</button>
                        </div>
                    </div>
                </td>
                
				</tr>';
				$number++;
		}
    }
    else {
        echo "<h2>OOPS! You have no Forms to work with wanna create one ?</h2>";
    }
    $data .= '</table>';
    echo $data;

}

