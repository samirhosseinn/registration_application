<?php
require_once "./config.php";

/*
definition of returned numbers:

    200 = no error
    404 = user not found
    409 = user already exist
    304 = wronge attribute
    
*/

class UserDatabaseService extends Database
{
    // Register
    public function register($username, $email, $password)
    {
        $userFromUsername = $this->readUser($username);
        $userFromEmail = $this->readUser($email);
        if ($userFromUsername == 404 && $userFromEmail == 404) {
            $stmt = $this->connect()->prepare("INSERT INTO users (id, username, email, password) VALUES (NULL, ?, ?, ?)");
            $stmt->execute([$username, $email, $password]);
            return 200;
        } else {
            return 409;
        }
    }

    // read user
    public function readUser($usernameOrEmail)
    {
        $stmt = $this->connect()->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->execute([$usernameOrEmail]);
        $user = $stmt->fetch();

        if (!empty($user)) {
            return [
                "username" => $user["username"],
                "email" => $user["email"],
                "name" => $user["name"],
                "image_url" => $user["image_url"],
            ];
        } else {
            $stmt = $this->connect()->prepare("SELECT * FROM users WHERE email = ?");
            $stmt->execute([$usernameOrEmail]);
            $user = $stmt->fetch();

            if (!empty($user)) {
                return [
                    "username" => $user["username"],
                    "email" => $user["email"],
                    "name" => $user["name"],
                    "image_url" => $user["image_url"],
                ];
            } else {
                return 404;
            }
        }
    }

    // login
    public function login($usernameOrEmail, $password)
    {

        $stmt = $this->connect()->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
        $stmt->execute([$usernameOrEmail, $password]);
        $user = $stmt->fetch();

        if (!empty($user)) {
            return [
                "username" => $user["username"],
                "email" => $user["email"],
                "name" => $user["name"],
                "image_url" => $user["image_url"],
            ];
        } else {
            $stmt = $this->connect()->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
            $stmt->execute([$usernameOrEmail, $password]);
            $user = $stmt->fetch();

            if (!empty($user)) {
                return [
                    "username" => $user["username"],
                    "email" => $user["email"],
                    "name" => $user["name"],
                    "image_url" => $user["image_url"],
                ];
            } else {
                return 404;
            }
        }
    }

    //Update (U in CRUD)
    public function updateUser($email, $attr, $value)
    {
        $user = $this->readUser($email);
        if (!empty($user)) {
            # because i check attribute(attr) in switch statment i will be sure that script don't face " SQL Injection " 
            $query = "UPDATE users SET $attr = ? WHERE email = ?";
            switch ($attr) {
                case "username":
                    $stmt = $this->connect()->prepare($query);
                    $stmt->execute([$value, $email]);
                    return 200;
                    break;
                case "email":
                    $stmt = $this->connect()->prepare($query);
                    $stmt->execute([$value, $email]);
                    return 200;
                    break;
                case "password":
                    $stmt = $this->connect()->prepare($query);
                    $stmt->execute([$value, $email]);
                    return 200;
                    break;
                case "name":
                    $stmt = $this->connect()->prepare($query);
                    $stmt->execute([$value, $email]);
                    return 200;
                    break;
                case "image_url":
                    $stmt = $this->connect()->prepare($query);
                    $stmt->execute([$value, $email]);
                    return 200;
                    break;
                default:
                    return 304;
            }
        } else {
            return 404;
        }
    }
}


class Email
{
    public static function sendOTP($email, $otp)
    {
        $from = "amirpythonproject@gmail.com";
        $to = $email;
        $subject = "OTP code";
        $message = "Welcome to application\nhere is your otp code:\n" . $otp;
        $headers = ["From: $from"];

        mail($to, $subject, $message, implode('\r\n', $headers));
        return 200;
    }

    public static function sendForgotPassword($email, $otp)
    {
        $from = "amirpythonproject@gmail.com";
        $to = $email;
        $subject = "Forgot Password";
        $message = "for changing your password enter this code in application:\n" . $otp;
        $headers = ["From: $from"];

        mail($to, $subject, $message, implode('\r\n', $headers));
        return 200;
    }
}
