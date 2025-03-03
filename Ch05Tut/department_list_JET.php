/*
    name: jack tercheria
    date: 2/26/2025
    description: example 5-21
*/
<html>
    <body>
        <h1>Department Listing</h1>
        <table border="1" wdith="90">
            <tr><td><b>Department ID</b></td>
                <td><b>Department Name</b></td>
<?php
    $hostname="127.0.0.1";
    $username="root";
    $password="";
    $database="dba221db";

    $p1="";
    $p2="";

    $dbh = new mysqli($hostname, $username, $password, $database);

    /* Check connection */

    if (mysqli_connect_errno()) {
        printf("Connection failed: %s\n", mysqli_connect_error());
        exit();
    }

    if ($result_set = $dbh->query("call department_list()")) {
        printf('');
        while($row=$result_set->fetch_object()) {
            printf("<tr><td>%s</td><td>%s</td></tr>\n", 
            $row->DEPARTMENT_ID, $row->DEPARTMENT_NAME);

        }
    }
    else /* query failed */
    {
        printf("<p>Error retrieving stored procedure result set:%d (%s) %s\n</p>", mysqli_errno($dbh),mysqli_sqlstate($dbh),mysqli_error($dbh));
            $dbh->close( ); exit( );
    }
    /* free result set */
    $result_set->close();
    $dbh->close();
    
?>
            </tr>
        </table>
    </body>
</html>