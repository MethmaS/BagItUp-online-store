<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bag it Up</title>

    <link rel="stylesheet" href="bootstrap.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css" />

    <link rel="icon" href="resource/logo.jpg" />

</head>

<body>

    <div class="container-fluid">
        <div class="row">

            <!-- content -->
            <div class="col-12 m-0">
                <div class="row">

                    <div class="col-6 d-none d-lg-block">
                        <div class="row">

                            <div id="carouselExampleSlidesOnly" class="col-lg-12 carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="resource/slider_img/n.jpg" class="d-block poster-img-1">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="resource/slider_img/b.jpg" class="d-block poster-img-1">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="resource/slider_img/j.jpg" class="d-block poster-img-1">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="resource/slider_img/i.jpg" class="d-block poster-img-1">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="col-12 col-lg-6 mt-4" id="signInBox">
                        <div class="row g-2">
                            <div class="col-12 logo mt-4"></div>
                            <div class="col-12 mt-4">
                                <p class="title1">Sign In</p>
                                <span class="text-danger" id="msg2"></span>
                            </div>

                            <?php

                            $email = "";
                            $password = "";

                            if (isset($_COOKIE["email"])) {
                                $email = $_COOKIE["email"];
                            }

                            if (isset($_COOKIE["password"])) {
                                $password = $_COOKIE["password"];
                            }

                            ?>

                            <div class="col-12 col-lg-10">
                                <label class="form-label">Email</label>
                                <input type="email" class="col-12 col-lg-12 i1" id="email2" value="<?php echo $email; ?>" />
                            </div>
                            <div class="col-12 col-lg-10">
                                <label class="form-label">Password</label>
                                <input type="password" class=" col-12 col-lg-12 i1" id="password2" value="<?php echo $password; ?>" />
                            </div>
                            <div class="col-6 col-lg-5">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberme">
                                    <label class="form-check-label">Remember Me</label>
                                </div>
                            </div>
                            <div class="col-6 col-lg-5 text-end">
                                <a href="#" class="link-primary" onclick="forgotPassword();">Forgot Password?</a>
                            </div>
                            <div class="col-12 col-lg-5 d-grid mt-4">
                                <button class="signbtn" onclick="signIn();">Sign In</button>
                            </div>
                            <div class="col-12 col-lg-5 d-grid mt-2 mt-lg-4">
                                <button class="newEshop" onclick="changeView();">New to eShop?Join Now</button>
                            </div>
                        </div>
                    </div>


                    <div class="col-12 col-lg-6 d-none mt-4" id="signUpBox">
                        <div class="row g-2">
                            <div class="col-12 logo"></div>
                            <div class="col-12 mt-4">
                                <p class="title1">Create New Account</p>
                                <span class="text-danger" id="msg"></span>
                            </div>

                            <div class="col-12 col-lg-5">
                                <label class="form-label">First Name</label>
                                <input type="text" class="i1 col-12" id="f" />
                            </div>
                            <div class="col-12 col-lg-5">
                                <label class="form-label">Last Name</label>
                                <input type="text" class="i1 col-12" id="l" />
                            </div>
                            <div class="col-12 col-lg-10">
                                <label class="form-label">Email</label>
                                <input type="email" class="i1 col-12" id="e" />
                            </div>
                            <div class="col-12 col-lg-10">
                                <label class="form-label">Password</label>
                                <input type="password" class="i1 col-12" id="p" />
                            </div>
                            <div class="col-12 col-lg-5">
                                <label class="form-label">Mobile</label>
                                <input type="text" class="i1 col-12" id="m" />
                            </div>
                            <div class="col-12 col-lg-5">
                                <label class="form-label">Gender</label>
                                <select class="i1 mt-1 col-12" id="g">
                                    <?php

                                    require "connection.php";

                                    $rs = Database::search("SELECT * FROM `gender`");
                                    $n = $rs->num_rows;

                                    for ($x = 0; $x < $n; $x++) {
                                        $d = $rs->fetch_assoc();

                                    ?>

                                        <option value="<?php echo $d["id"]; ?>"><?php echo $d["gender_name"]; ?></option>

                                    <?php

                                    }

                                    ?>
                                </select>
                            </div>
                            <div class="col-12 col-lg-5 d-grid mt-3">
                                <button class="signbtn" onclick="signUp();">Sign Up</button>
                            </div>
                            <div class="col-12 col-lg-5 d-grid mt-2 mt-lg-3">
                                <button class="alreadybtn" onclick="changeView();">Already have an account?Sign In</button>
                            </div>
                        </div>
                    </div>



                </div>

            </div>
        </div>
        <!-- content -->
    </div>
    </div>

    <script src="script.js"></script>
    <script src="bootstrap.bundle.js"></script>
</body>

</html>