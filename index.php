<?php 

if (isset($_GET['ip'])){

    $output = system("ping -c 1". $_GET['ip']);
    die($output)
}


?>


<html>
    <form action="ping.php" method="GET">
        IP Pinger : <input type= "text" name = "ip" /> <input type="submit"/>

</form>


</html>
</body>



<!-- $ curl "http://localolost/ping.php?ip=127.0.0.1" --> 


