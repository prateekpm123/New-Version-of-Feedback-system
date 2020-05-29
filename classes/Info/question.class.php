<?php

namespace Info;

class Question {

    private $question;
    private $answer;

    function __construct(string $question, string $answer) {
        $this->question = $question;
        $this->answer = $answer;
    }

    function showQuestionAnswer() {
        echo "<h4>Questions is: ". $this->question." <br> Answer is: ". $this->answer ."</h4>";
    }
}