<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP Form</title>
</head>
<body>
    <?php 
        $name = $email = $gender = $comment = $website = "";
        $nameErr = $emailErr = $genderErr = $commentErr = $websiteErr = "";
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if (empty($_POST["name"])) {
                $nameErr = "Name is required";
            } else {
                $name = test_input($_POST["name"]);
                //validate name
                if (!preg_match("/^[a-zA-Z-' ]*$/",$name)) {
                    $nameErr = "Only letters and white space allowed.";
                }
            }
            if (empty($_POST["email"])) {
                $emailErr = "Email is required";
            } else {
                $email = test_input($_POST["email"]);
                //validate email format
                if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    $emailErr = "Invalid email format";
                }
            }
            if (empty($_POST["website"])) {
                $website = "";
            } else {
                $website = test_input($_POST["website"]);
                //validate url
                if (preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$website)) {
                    $websiteErr = "Invalid URL";
                }  
            }
            if (empty($_POST["comment"])) {
                $comment = "";
            } else {
                $comment = test_input($_POST["comment"]);
            }
            if (empty($_POST["gender"])) {
                $genderErr = "Gender is required";
            } else {
                $gender = test_input($_POST["gender"]);
            }
        }

        //LITERALLY ALWAYS DO THIS, CHECK   E V E R Y   S I N G L E   USER INPUT
        function test_input($data) {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
        }
    ?>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
        <!--TEXT FIELDS-->
        Name: <input type="text" name="name" value="<?php echo $name;?>">
        <span class="error">* <?php echo $nameErr;?></span>
        <br><br>
        E-mail: <input type="text" name="email" value="<?php echo $email;?>">
        <span class="error">* <?php echo $emailErr;?></span>
        <br><br>
        Website: <input type="text" name="website" value="<?php echo $website;?>">
        <span class="error">* <?php echo $websiteErr;?></span>
        <br><br>
        Comment: <textarea name="comment" row="5" cols="40"><?php echo $comment;?></textarea>
        <!--RADIO BUTTONS-->
        Gender:
        <input type="radio" name="gender" <?php if (isset($gender) && $gender=="female") echo "checked";?> value="Female">Female
        <input type="radio" name="gender" <?php if (isset($gender) && $gender=="male") echo "checked";?> value="Male">Male
        <input type="radio" name="gender" <?php if (isset($gender) && $gender=="other") echo "checked";?> value="Other">Other
        <span class="error">* <?php echo $genderErr;?></span>
        <br><br>
        <!--SUBMIT BUTTON-->
        <input type="submit" name="submit" value="Submit">
    </form>
    <?php
        echo "<h2>Your Input:</h2>";
        echo $name;
        echo "<br>";
        echo $email;
        echo "<br>";
        echo $website;
        echo "<br>";
        echo $comment;
        echo "<br>";
        echo $gender;
    ?>
</body>
</html>
