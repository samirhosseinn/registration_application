<?php
require_once "./services.php";


$Udb = new UserDatabaseService();

$user = "root";
$pass = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && $_POST["user"] == $user && $_POST["pass"] == $pass) {
    switch ($_POST["mode"]) {
        case "login":
            $result =  json_encode($Udb->login($_POST["usernameOrEmail"], $_POST["password"]));
            echo $result;
            break;
        case "register":
            $result = $Udb->register(username: $_POST["username"], password: $_POST["password"], email: $_POST["email"]);
            echo $result;
            break;
        case "sendOtp":
            $result = Email::sendOTP(email: $_POST["email"], otp: $_POST["otp"]);
            echo $result;
            break;
        case "sendForgotPassword":
            $result = Email::sendForgotPassword(email: $_POST["email"], otp: $_POST["otp"]);
            echo $result;
            break;
        case "checkUserExist":
            $result = $Udb->readUser(usernameOrEmail: $_POST["usernameOrEmail"]);
            echo $result;
            break;
        case "changePassword":
            $result = $Udb->updateUser(email: $_POST["email"], attr: "password", value: $_POST["password"]);
            echo $result;
            break;
        case "addName":
            $result = $Udb->updateUser(email: $_POST["email"], attr: "name", value: $_POST["name"]);
            echo $result;
            break;
        case "addProfileImage":
            $result = $Udb->updateUser(email: $_POST["email"], attr: "image_url", value: $_POST["image_url"]);
            echo $result;
            break;
    }
}
