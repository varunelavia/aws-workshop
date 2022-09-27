<?php
$num1 = isset($_GET["num1"]) ? $_GET["num1"] : 250;
$num2 = isset($_GET["num2"]) ? $_GET["num2"] : 250;
$num3 = isset($_GET["num3"]) ? $_GET["num3"] : 250;
$count = 0;
for($i=0;$i<$num1;$i++) {
    for($j=0;$j<$num2;$j++) {
        for($k=0;$k<$num2;$k++) {
            rand()*rand()*rand();
            $count = $count + 1;
        }
    }
}
print($count)
?>