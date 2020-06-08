<?php

class Time {

    function dateAndTime() {
        $time = time();
        $actual_time = date(' d/m/Y H:i:s');

        return $actual_time;
    }

}
 