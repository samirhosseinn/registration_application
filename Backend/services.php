<?php
require_once "./config.php";

/*
definition of returned numbers:

    0 = no error
    1 = user not found
    2 = user already exist
    3 = wronge attribute
    
*/

class UserDatabaseService extends Database
{
    // Create (C in CRUD)
    public function createUser($username, $email, $password)
    {
        $userFromUsername = $this->readUserFromUsername($username);
        $userFromEmail = $this->readUserFromEmail($email);
        if (empty($userFromUsername) && empty($userFromEmail)) {
            $stmt = $this->connect()->prepare("INSERT INTO users (id, username, email, password) VALUES (NULL, ?, ?, ?)");
            $stmt->execute([$username, $email, $password]);
            return 0;
        } else {
            return 2;
        }
    }

    // Read (R in CRUD)
    public function readUserFromUsername($username)
    {
        $stmt = $this->connect()->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->execute([$username]);
        $user = $stmt->fetch();

        if (!empty($user)) {
            return [
                "username" => $user["username"],
                "email" => $user["email"],
                "name" => $user["name"],
            ];
        } else {
            return [];
        }
    }

    public function readUserFromEmail($email)
    {
        $stmt = $this->connect()->prepare("SELECT * FROM users WHERE email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch();

        if (!empty($user)) {
            return [
                "username" => $user["username"],
                "email" => $user["email"],
                "name" => $user["name"],

            ];
        } else {
            return [];
        }
    }

    public function readAllUsers()
    {
        $stmt = $this->connect()->query("SELECt * FROM users");
        return $stmt->fetchAll();
    }

    public function loginUserFromUsername($username, $password)
    {

        $stmt = $this->connect()->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
        $stmt->execute([$username, $password]);
        $user = $stmt->fetch();

        if (!empty($user)) {
            return [
                "username" => $user["username"],
                "email" => $user["email"],
                "name" => $user["name"],

            ];
        } else {
            return [];
        }
    }

    public function loginUserFromEmail($email, $password)
    {

        $stmt = $this->connect()->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
        $stmt->execute([$email, $password]);
        $user = $stmt->fetch();

        if (!empty($user)) {
            return [
                "username" => $user["username"],
                "email" => $user["email"],
                "name" => $user["name"],

            ];
        } else {
            return [];
        }
    }



    //Update (U in CRUD)
    public function updateUser($email, $attr, $value)
    {
        $user = $this->readUserFromEmail($email);
        if (!empty($user)) {
            # because i check attribute(attr) in switch statment i will be sure that script don't face " SQL Injection " 
            $query = "UPDATE users SET $attr = ? WHERE email = ?";
            switch ($attr) {
                case "username":
                    $stmt = $this->connect()->prepare($query);
                    $stmt->execute([$value, $email]);
                    return true;
                    break;
                case "email":
                    $stmt = $this->connect()->prepare($query);
                    $stmt->execute([$value, $email]);
                    return true;
                    break;
                case "password":
                    $stmt = $this->connect()->prepare($query);
                    $stmt->execute([$value, $email]);
                    return true;
                    break;
                case "name":
                    $stmt = $this->connect()->prepare($query);
                    $stmt->execute([$value, $email]);
                    return true;
                    break;
                default:
                    return 3;
            }
        } else {
            return 1;
        }
    }

    //DELETE (D in CRUD)
    public function deleteUser($username)
    {
        $user = $this->readUserFromUsername($username);
        if (!empty($user)) {
            $stmt = $this->connect()->prepare("DELETE FROM users WHERE username = ?");
            $stmt->execute([$username]);
            return 0;
        } else {
            return 1;
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
    }

    public static function sendForgotPassword($email, $otp)
    {
        $from = "amirpythonproject@gmail.com";
        $to = $email;
        $subject = "Forgot Password";
        $message = "for changing your password enter this code in application:\n" . $otp;
        $headers = ["From: $from"];

        mail($to, $subject, $message, implode('\r\n', $headers));
    }
}
