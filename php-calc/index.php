<?php
if (isset($_REQUEST["submit"])) {
    $num1 = $_REQUEST["num1"];
    $num2 = $_REQUEST["num2"];
    $operator = $_REQUEST["operator"];
    if ($operator == "+") {
        $result = $num1 + $num2;
    } elseif ($operator == "-") {
        $result = $num1 - $num2;
    } elseif ($operator == "*") {
        $result = $num1 * $num2;
    } elseif ($operator == "/") {
        $result = $num1 / $num2;
    } else {
        $result = "Invalid Operator";
    }
    ?>
<script>
alert("Result is : <?php echo $result; ?>")
</script>
<?php
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Calculator</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>

    <div class="container-fluid pt-3">
        <div class="row">
            <div class="col"></div>
            <div class="col">
                <h4>My Calculator <?php
if (getenv('HOSTED_REGION') !== false) {
    echo "in " . getenv('HOSTED_REGION');
}?></h4>
                <form action="/" method="post">
                    <div class="form-group">
                        <label for="num1">num1:</label>
                        <input type="number" class="form-control" id="num1" placeholder="Enter num1" name="num1">
                    </div>
                    <div class="form-group">
                        <label for="operator">operator:</label>
                        <input class="form-control" id="operator" placeholder="Enter operator" name="operator">
                    </div>
                    <div class="form-group">
                        <label for="num2">num2:</label>
                        <input type="number" class="form-control" id="num2" placeholder="Enter num2" name="num2">
                    </div>
                    <input name="submit" class="btn btn-primary" type="submit" id="submit" value="Calculate">
                </form>
            </div>
            <div class="col"></div>
        </div>
    </div>

    </div>
</body>

</html>