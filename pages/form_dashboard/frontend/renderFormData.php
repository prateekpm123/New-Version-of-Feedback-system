<?php

require "../backend/getFormDetails.php";

renderData();

function renderData() {
    $formInfoObj = new FormInfo();
    $formData = $formInfoObj->giveFormDataToRender();

    $data = '<table class="table table-bordered table-striped">
                    <tr>
                        <th>No.</th>
                        <th>Form Name</th>
                        <th>Check Versions</th>
                    </tr>';

    if(!empty($formData)){
		$number = 1;
		foreach($formData as $row ){
            $Form_name = $row['Form_name'];
			$data .= '<tr>
				<td>'.$number.'</td>
				<td contenteditable="true">'.$Form_name.'</td>
				<td>
					<button onclick="getFormVersions('.$row['F_id'].')" class="btn btn-info">View</button>
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

