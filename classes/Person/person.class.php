<?php

namespace Person;


class Person {


    private $name;
    private $age;
    private $birthYear;


    function __construct(string $name, int $age, int $birthYear) {

        $this->name = $name;
        $this->age = $age;
        $this->birthYear = $birthYear;

    }

    function printHappyBirthday() {
        echo "<h2>Congrats " .$this->name . " today is your " . $this->age. "th birthday</h2>";
    }


}