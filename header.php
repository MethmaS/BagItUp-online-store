<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="bootstrap.css" />
    <link rel="stylesheet" href="style.css" />
</head>

<body>

    <div class="col-12" style=" background-color: #B2BEB5;">
        <div class="row">

            <div class="offset-lg-1 col-6 col-lg-4 align-self-start mt-2">

                <?php

                session_start();

                if (isset($_SESSION["u"])) {
                    $data = $_SESSION["u"];

                ?>

                    <span class="text-lg-start text-dark"><b>Welcome </b><?php echo $data["fname"]; ?></span>
                    <span class="text-lg-start fw-bold signout" onclick="signout();">Sign Out</span>


                <?php

                } else {

                ?>

                    <a href="index.php" class="text-decoration-none fw-bold text-light">Sign In or Register</a> |

                <?php

                }

                ?>

            </div>

            <div class="offset-lg-4 col-5 col-lg-3 align-self-end">
                <div class="row">

                    <div class="col-2 offset-lg-1 col-lg-6">
                        <button class="btn btn-light rounded-4  text-secondary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Pocket</button>


                        <div class="offcanvas offcanvas-end" style="background-color: rgb(230, 227, 227);" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                            <div class="offcanvas-header">
                                <h5 class="offcanvas-title" id="offcanvasRightLabel">Bag it Up</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                            </div>
                            <div class="offcanvas-body">
                                <a class="col-12 col-lg-8 btn btn-outline-secondary my-2 rounded-4" href="userProfile.php">My Profile</a>
                                <a class="col-12 col-lg-8 btn btn-outline-secondary my-2 rounded-4" href="myProducts.php"> My Products</a>
                                <a class="col-12 col-lg-8 btn btn-outline-secondary my-2 rounded-4" href="watchlist.php"> Wishlist</a>
                                <a class="col-12 col-lg-8 btn btn-outline-secondary my-2 rounded-4" href="purchasingHistory.php">Purchase History</a>
                                <a class="col-12 col-lg-8 btn btn-outline-secondary my-2 rounded-4" href="message.php">Message</a>

                            </div>
                        </div>

                    </div>

                    <div class="col-3 offset-7 col-lg-3  ms-lg-0  cart" onclick="window.location='cart.php';"></div>
                </div>

            </div>

        </div>

    </div>


    <script src="script.js"></script>
</body>

</html>