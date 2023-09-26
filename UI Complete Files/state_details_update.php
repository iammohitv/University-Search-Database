<head>
    <link rel="stylesheet" href="index.css">
</head>
<?php
    $con = pg_connect("host=localhost user=postgres dbname=DMQL_Final_Project password=Meeta@2000") or 
    die("Not able to connect");
    $state =  $_REQUEST['state'];
    $state_id = $_REQUEST['state_id'];

    $query = "UPDATE state_details set stateid = '$state_id' where state = '$state';";
    pg_query($query) or die("Error while update");
    echo"state updated properly<br/>";
    pg_close($con);
?>

<a href = "state_details.php">Show State</a><br/>
<a href = "home.html">Back to HOME!!!</a>