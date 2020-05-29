<?php 

// THIS ENABLES TYPE DECLARATION IN PHP, WHICH AVAILABLE IN LABGUAGES LIKE DART
declare( strict_types = 1 );            

include 'includes/class-autoLoad.inc.php';

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php 

        try {
            // $obj1 = new Person\Person('Pooja' , 20, 1999);
            // $obj1->printHappyBirthday();

        }
        catch (TypeError $e) {
            echo "Error!:  " .$e->getMessage();
        }
       
        try {
           
            $obj2 = new Info\Question(' this is a question', 'answer is this');
            $obj2->showQuestionAnswer();
        }
        catch (TypeError $e) {
            echo "Error!:  " .$e->getMessage();
        }

        
    
    
    ?>
    
</body>
</html>