<?php
require_once "./services.php";


$Udb = new UserDatabaseService();

$user = "root";
$pass = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && $_POST["user"] == $user && $_POST["pass"] == $pass) {
    switch ($_POST["mode"]) {
        case "login":
            $resultFromUsername =  json_encode($Udb->loginUserFromUsername($_POST["usernameOrEmail"], $_POST["password"]));
            $resultFromEmail = json_encode($Udb->loginUserFromEmail($_POST["usernameOrEmail"], $_POST["password"]));
            if (empty(json_decode($resultFromUsername))) {
                echo $resultFromEmail;
            } else {
                echo $resultFromUsername;
            }
            break;
        case "register":
            $result = $Udb->createUser(username: $_POST["username"], password: $_POST["password"], email: $_POST["email"]);
            echo $result;
            break;
        case "update":

            break;
    }
}
