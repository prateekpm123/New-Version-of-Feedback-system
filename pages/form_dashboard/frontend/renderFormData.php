<?php

require "../backend/getFormDetails.php";


session_start();
renderData($_SESSION['admin_username']);


function renderData($username) {
    $formInfoObj = new FormInfo();
    $formData = $formInfoObj->giveFormDataToRender($username);
    
    $data = '<table class="table table-borderless table-hover table-striped">
                    <thead class="thead-dark">
                        <tr align="center">
                            <th>No.</th>
                            <th>Form Name</th>
                            <th>Versions</th>
                            <th>Delete</th>
                        </tr>
                    </thead>';

    if(!empty($formData)){
		$number = 1;
		foreach($formData as $row ){
            $Form_name = $row['Form_name'];
			$data .= '<tr>
				<td align="center" style="width: 10%"><b>'.$number.'</b></td>
				<td align="center" style="width: 60%" contenteditable="true" onBlur="updateFormName(this,1,'.$row['F_id'].')">'.$Form_name.'</td>
				<td align="center" style="width: 15%">
					<button onclick="getFormVersions('.$row['F_id'].')" class="btn btn-sm btn-info">View</button>
                </td>
                <td align="center" style="width: 15%">
                    <button class="btn btn-sm btn-danger" onclick="deleteForms('.$row['F_id'].')" >Delete</button>        
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

