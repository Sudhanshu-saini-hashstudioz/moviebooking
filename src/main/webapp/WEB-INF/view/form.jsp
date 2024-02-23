<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!doctype html>
    <html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            integrity="sha384-csTRlHlkXPvW/9aVxUT9sqqf4YUqg+xhclpvSO/e4Fp5ktQ3ROrMQIt09HPF5fjj" crossorigin="anonymous">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <title>Login Account</title>
        <link rel="icon"
            href="data:image/png;base64,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" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script>

            //navigation bar
            function openNav() {
                document.getElementById("myNav").style.width = "20%";
            }

            function closeNav() {
                document.getElementById("myNav").style.width = "0%";
            }
            function goBack() {
                window.history.back();
            }

        </script>

        <style>
            body {
                font-family: 'Lato', sans-serif;
            }

            .container {
                margin-top: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-around;

            }

            .form-container {
                width: 350px;
                margin-bottom: 20px;
                background-color: #fff;
                /* box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px; */
                border-radius: 10px;
                box-sizing: border-box;
                padding: 20px 30px;

                border-radius: 30px;
                /* background: #e0e0e0; */
                box-shadow: 15px 15px 20px #e7e3e3,
                    -15px -15px 30px #ffffff;
            }

            .title {
                text-align: center;
                font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
                    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
                font-size: 28px;
                font-weight: 800;
            }

            .sub-title {
                margin: 0;
                margin-bottom: 5px;
                font-size: 9px;
                font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
                    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            }

            .form {
                width: 100%;
                display: flex;
                flex-direction: column;
                gap: 18px;
                margin-bottom: 15px;
            }

            /* .input {
                border-radius: 20px;
                border: 1px solid #c0c0c0;
                outline: 0 !important;
                box-sizing: border-box;
                padding: 12px 15px;
            } */

            .input {
                font-family: 'Segoe UI', sans-serif;
                width: 290px;
                position: relative;

            }

            .input input {
                font-size: 100%;
                padding: 0.8em;
                outline: none;
                border: 2px solid darkgrey;
                background-color: transparent;
                border-radius: 20px;
                width: 100%;
            }

            .input label {
                font-size: 100%;
                position: absolute;
                left: 0;
                padding: 0.8em;
                margin-left: 0.5em;
                pointer-events: none;
                transition: all 0.3s ease;
                /* color: rgb(37, 37, 211); */
                color: grey;
            }

            .input :is(input:focus, input:valid)~label {
                /* color: rgb(37, 37, 211); */
                color: darkgrey;
                transform: translateY(-50%) scale(.9);
                margin: 0em;
                margin-left: 1.3em;
                padding: 0.4em;
                background-color: white;
            }

            .inputGroup :is(input:focus, input:valid) {
                border-color: rgb(37, 37, 211);
            }

            .form-btn {
                width: 100%;
                padding: 10px 15px;
                font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
                    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
                border-radius: 20px;
                border: 0 !important;
                outline: 0 !important;
                background: teal;
                color: white;
                cursor: pointer;
                box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            }

            .form-btn:active {
                box-shadow: none;
            }

            .sign-up-label {
                padding-top: 10px;
                font-size: 12px;
                color: #747474;
                font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
                    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            }

            .sign-up-link {
                margin-left: 1px;
                font-size: 11px;
                text-decoration: underline;
                text-decoration-color: teal;
                color: teal;
                cursor: pointer;
                font-weight: 800;
            }

            .buttons-container {
                width: 100%;
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
                margin-top: 20px;
                gap: 15px;
            }

            .apple-login-button,
            .google-login-button {
                border-radius: 20px;
                box-sizing: border-box;
                padding: 10px 15px;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px,
                    rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
                cursor: pointer;
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
                    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
                font-size: 11px;
                gap: 5px;
            }

            .apple-login-button {
                background-color: #000;
                color: #fff;
                border: 2px solid #000;
            }

            .google-login-button {
                border: 2px solid #747474;
            }

            .apple-icon,
            .google-icon {
                font-size: 18px;
                margin-bottom: 1px;
            }


            .navbar {
                background-color: oldlace;
                box-shadow: 3px;
            }

            .overlay {
                color: maroon;
                position: fixed;
                top: 0;
                right: -50%;
                width: 0%;
                height: 100%;
                background-color: oldlace;
                overflow-x: hidden;
                backface-visibility: hidden;
                transition: 0.2s;
                z-index: 4;

            }

            .overlay-content {

                position: relative;
                top: 10%;
                width: 100%;
                text-align: center;
                margin-top: 30px;
            }

            .overlay.left {
                left: 0;
            }

            .closebtn {
                position: absolute;
                top: 10px;
                left: 80%;
                font-size: 30px;
                cursor: pointer;
            }

            .overlay a {
                padding: 8px;
                text-decoration: none;
                font-size: 20px;
                color: maroon;
                display: block;
                transition: 0.1s;
                border-color: grey;
                border-block: inherit;
            }

            .overlay a:hover,
            .hamburger:hover,
            .overlay a:focus {
                background-color: lavender;
                color: darksalmon;
                /* background-color: rgb(235, 84, 84); */
                border-radius: 10px;
                transition: transform 0.3s ease-out;
                transform: scale(1.15);
            }

            @media screen and (max-height: 450px) {
                .overlay a {
                    font-size: 20px
                }

                .overlay .closebtn {
                    font-size: 40px;
                    top: 15px;
                    right: 35px;
                }
            }


            .center-button {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-evenly;
            }

            .btn {

                margin-left: 5px;
                margin-right: 5px;
                color: white;
                background-color: rgb(235, 84, 84);
                border-radius: 10px;
            }

        </style>
    </head>

    <body class="body">

        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light ">
            <a class="navbar-brand" href="home"> <img src="/movie/logo1.png" alt="Logo" height="40"> </a>
            <span style="font-size:20px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span>

            <div id="myNav" class="overlay left">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <i style=" margin-left: 20px ;font-size:40px;color:lightblue;text-shadow:2px 2px 4px #000000;"> <img
                        src="/movie/logo1.png" alt="Logo" height="40"> </i>
                <div class="overlay-content">
                    <a href="#">About</a>
                    <!-- <a type="button" href="userbookings">Bookings</a> -->
                    <a href="#">Help & Support</a>
                    <a type="button" href="">Contact</a>
                    <a href="signuppage" type="button">Sign Up</a>
                </div>
            </div>
        </nav>

        <div class="container">

            <div class="form-container">
                <p class="title">Login</p>
                <form class="form">

                    <div class="input">
                        <input type="text" class="email-field" id="email" name="email" required autocomplete="off">
                        <label for="email">xyz@domain.com</label>
                        <small class="email-field-msg form-text text-danger ml-2"></small>
                    </div>

                    <div class="input">
                        <input type="password" class="password-field" id="password" name="password" required
                            autocomplete="off">
                        <label for="password">Password</label>
                        <small class="password-field-msg form-text text-danger ml-2"></small>
                    </div>

                    <div>
                        <button id="login" type="button" class="form-btn">Log In</button>
                    </div>


                </form>
                <p class="sign-up-label">
                    Don't have an account? <a type="button" href="signuppage">Sign Up</a>
                </p>
                <div class="buttons-container">
                    <div class="apple-login-button">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" class="apple-icon"
                            viewBox="0 0 1024 1024" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M747.4 535.7c-.4-68.2 30.5-119.6 92.9-157.5-34.9-50-87.7-77.5-157.3-82.8-65.9-5.2-138 38.4-164.4 38.4-27.9 0-91.7-36.6-141.9-36.6C273.1 298.8 163 379.8 163 544.6c0 48.7 8.9 99 26.7 150.8 23.8 68.2 109.6 235.3 199.1 232.6 46.8-1.1 79.9-33.2 140.8-33.2 59.1 0 89.7 33.2 141.9 33.2 90.3-1.3 167.9-153.2 190.5-221.6-121.1-57.1-114.6-167.2-114.6-170.7zm-105.1-305c50.7-60.2 46.1-115 44.6-134.7-44.8 2.6-96.6 30.5-126.1 64.8-32.5 36.8-51.6 82.3-47.5 133.6 48.4 3.7 92.6-21.2 129-63.7z">
                            </path>
                        </svg>
                        <span>Log in with Apple</span>
                    </div>
                    <div class="google-login-button">
                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" version="1.1" x="0px" y="0px"
                            class="google-icon" viewBox="0 0 48 48" height="1em" width="1em"
                            xmlns="http://www.w3.org/2000/svg">
                            <path fill="#FFC107" d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12
          c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24
          c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"></path>
                            <path fill="#FF3D00" d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657
          C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path>
                            <path fill="#4CAF50" d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36
          c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path>
                            <path fill="#1976D2"
                                d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571
          c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"></path>
                        </svg>
                        <span>Log in with Google</span>
                    </div>
                </div>
            </div>
        </div>


        <script>


            $(document).on("click", "#login", function (event) {
                var userName = $("#email").val();
                var pwd = $("#password").val();

                var flag = validate();
                if (flag) {

                    $.ajax({
                        url: "http://localhost:1212/api/v1/auth/signin",
                        type: "POST",
                        data: JSON.stringify({
                            email: userName,
                            password: pwd
                        }),
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        success: function (response) {
                            var token = response.token;
                            localStorage.setItem("token", token);
                            var headers = {
                                "Authorization": "Bearer " + token,
                            };

                            $.ajax({

                                url: "http://localhost:1212/api/v1/auth/userdetails",
                                type: "GET",
                                headers: headers,

                                success: function (response) {
                                    if (response === 'ADMIN') {
                                        window.location.replace("http://localhost:1212/movie/adminhome")
                                    }
                                    else {
                                        window.location.replace("http://localhost:1212/movie/home");
                                    }
                                },
                                error: function (e) {
                                    console.log("error:", e);
                                }
                            });


                        },
                        error: function (e) {
                            alert("Invalid Credentials");
                            console.log("error:", e);
                        }
                    });

                }

            });



            //------------------validating form --------------------------------------------------------------------------
            //true if form is valid 
            //false if form is not valid
            function validate() {

                let flag = true;

                //email validation
                let email = $(".email-field").val();
                let exp = /^[\w-\.]+@([\w]+\.)+[\w-]{2,4}$/;
                if (email == "" || email == undefined) {
                    $(".email-field-msg").html("Valid EMail is required !!").addClass("text-danger");
                    flag = false;
                } else if (exp.test(email) == false) {
                    $(".email-field-msg").html("Valid EMail is required !!").addClass("text-danger");
                    flag = false;
                } else {
                    $(".email-field-msg").html("Input Accepted !!").removeClass("text-danger").addClass("text-success");
                }

                //password validation
                let password = $(".password-field").val();

                if (password == "") {
                    $(".password-field-msg").html("Password is required !!").addClass("text-danger");
                    flag = false;
                }

                return flag;
            }

        </script>




    </body>

    </html>