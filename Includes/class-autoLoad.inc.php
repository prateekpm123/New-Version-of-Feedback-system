<?php 

// **
// ** This function gets automatically called when a class is instantiated
// **
spl_autoload_register('myAutoLoader');


// **
// ** This function makes a require_once call, with the correct pathname   
// ** Note !!: This is designed to import the classes only form Classes folder !
// **
// **

function myAutoLoader($classname) {

    $url = $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];

    if( strpos($url, 'includes') !== false) {
        $path = '../classes/';
    }
    else if ( strpos($url, '') !== false)  {

    }
    else {
        $path = 'classes/';
    }

    $extension = '.class.php';
    require_once $path. $classname. $extension;
    
}

// OLD VERSION OF myAutoLoader FUNCTION, JUST FOR REFERENCE
// function myAutoLoader($classname) {

//     $path = "classes/";
//     $extension = ".class.php";
//     $fullpath = $path . $classname. $extension;


//     if(!file_exists($fullpath)){
//         return false;
//     }
//     include_once $fullpath;
// }