<?php
    $con = pg_connect("host=localhost user=postgres dbname=DMQL_Final_Project password=Meeta@2000") or 
    die("Not able to connect");

    $query = "SELECT * FROM state_details";
    $result = pg_query($query);
    echo "<table border='1' cellspacing = '0'>
    <tr>
        <th>State</th>
        <th>State ID</th>
    </tr>";
    while($row = pg_fetch_row($result))
    {
        echo"<tr>";
        echo"<th>$row[0]</th>";
        echo"<th>$row[1]</th>";
        echo"</tr>";
    }
    echo "</table>";
    pg_close($con);
?>
<a href="home.html">Back To HOME!!!</a>
