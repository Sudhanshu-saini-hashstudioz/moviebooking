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

        <title>Account </title>
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

            .title {
                text-align: center;
                font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
                    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
                font-size: 28px;
                font-weight: 800;
            }

            .input {
                margin-top: 10px;
                margin-bottom: 10px;
                font-family: 'Segoe UI', sans-serif;
                width: 290px;
                position: relative;

            }

            .input input {
                color: black;
                font-size: 100%;
                padding: 5px;
                outline: none;
                border: 2px solid white;
                /* background-color: transparent; */
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
                color: white;
                transform: translateY(-75%) scale(1.03);
                margin: 0em;
                margin-left: 1.3em;
                padding: 0.4em;
                background-color: transparent;
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
                color: black;
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
                width: 98%;
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
                background-color: white;
                color: black;
                border: 2px solid white;
            }

            .apple-icon,
            .google-icon {
                font-size: 18px;
                margin-bottom: 1px;
            }

            .text-error {
                color: yellow;
            }

            .text-pass {
                color: #00fd3a !important;
            }






            .container {
                margin-top: 20px;
                margin-bottom: 20px;
                width: 330px;

                perspective: 900px;
            }

            .card {
                height: 620px;
                width: 100%;
                background-color: aliceblue;
                position: relative;
                /* transition: transform 1500ms; */
                transform-style: preserve-3d;
                border-radius: 2rem;
                transition: transform 1500ms ease;
            }

            /* .container:hover>.card {
                cursor: pointer;
                transform: rotateY(180deg) rotateZ(180deg);
            } */

            .front,
            .back {
                height: 100%;
                width: 100%;
                border-radius: 2rem;
                position: absolute;
                box-shadow: 0 0 10px 2px rgba(50, 50, 50, 2.5);
                backface-visibility: hidden;
                display: flex;
                justify-content: center;
                flex-direction: column;
                align-items: center;
                color: aliceblue;
                background: linear-gradient(-135deg,
                        #F80A4A, #0AA4F8);
            }

            .back {
                transform: rotateY(180deg) rotateZ(180deg);
            }

            .back-heading,
            .front-heading {
                font-size: 28px;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                font-weight: bold;
            }

            #rotate {
                color: darkblue;
                border-color: transparent;
                cursor: pointer;
                border-radius: 6px;
                background-color: transparent;
                backdrop-filter: blur(10px);
            }

            #rotate :hover {}

            .cta {
                position: relative;
                margin: auto;
                transition: all 0.2s ease;
                border: none;
                background: none;
                cursor: pointer;
            }

            .cta:before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                border-radius: 50px;
                background: #b1dae7;
                width: 20px;
                height: 30px;
                transition: all 0.3s ease;
            }

            .cta span {
                position: relative;
                font-family: "Ubuntu", sans-serif;
                font-size: 18px;
                font-weight: 700;
                letter-spacing: 0.05em;
                color: #234567;
            }

            .cta svg {
                position: relative;
                top: 0;
                margin-left: 10px;
                fill: none;
                stroke-linecap: round;
                stroke-linejoin: round;
                stroke: #234567;
                stroke-width: 2;
                transform: translateX(-5px);
                transition: all 0.3s ease;
            }

            .cta:hover:before {
                width: 100%;
                background: #b1dae7;
            }

            .cta:hover svg {
                transform: translateX(0);
            }

            .cta:active {
                transform: scale(0.95);
            }


            .card.flipped {
                transform: rotateY(180deg) rotateZ(180deg);
                transition: transform 1500ms ease;
            }
        </style>
    </head>

    <body>

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
            <div class="card">

                <div class="front">
                    <p class="front-heading">Login</p>
                    <div class="input">
                        <input type="text" class="email-field" id="email" name="email" required autocomplete="off">
                        <label for="email">xyz@domain.com</label>
                        <small class="email-field-msg form-text  ml-2"></small>
                    </div>

                    <div class="input">
                        <input type="password" class="password-field" id="password" name="password" required
                            autocomplete="off">
                        <label for="password">Password</label>
                        <small class="password-field-msg form-text ml-2"></small>
                    </div>

                    <div>
                        <button id="login" type="button" class="form-btn">Log In</button>
                    </div>

                    <p class="sign-up-label">
                        Don't have an account? <!-- <button id="rotate" type="button">Sign Up</button> -->
                        <button class="cta">
                            <span>Sign up</span>
                            <svg width="15px" height="10px" viewBox="0 0 13 10">
                                <path d="M1,5 L11,5"></path>
                                <polyline points="8 1 12 5 8 9"></polyline>
                            </svg>
                        </button>
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
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" version="1.1" x="0px"
                                y="0px" class="google-icon" viewBox="0 0 48 48" height="1em" width="1em"
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


                <!-- sign up card  -->


                <div class="back">
                    <p class="back-heading">Create Account</p>
                    <div class="input">
                        <input type="text" class="signup-name-field" id="signup-name" name="signup-name" required
                            autocomplete="off">
                        <label for="signup-name">Your Name</label>
                        <small class="signup-name-field-msg form-text ml-2"></small>
                    </div>

                    <div class="input">
                        <input type="text" class="signup-email-field" id="signup-email" name="signup-email" required
                            autocomplete="off">
                        <label for="signup-email">xyz@domain.com</label>
                        <small class="signup-email-field-msg form-text  ml-2"></small>
                    </div>

                    <div class="input">
                        <input type="password" class="signup-password-field" id="signup-password" name="signup-password"
                            required autocomplete="off">
                        <label for="signup-password">Password</label>
                        <small class="signup-password-field-msg form-text  ml-2"></small>
                    </div>

                    <div class="input">
                        <input type="password" class="confirmPassword-field" id="confirmPassword" name="confirmPassword"
                            required autocomplete="off">
                        <label for="confirmPassword">Confirm Password</label>
                        <small class="confirmPassword-field-msg form-text ml-2"></small>
                    </div>

                    <div>
                        <button id="signup" type="button" class="form-btn">Create account</button>
                    </div>

                    <p class="sign-up-label">
                         Already have an account? <!--<button id="rotate" type="button">Log in</button> -->
                        <button class="cta">
                            <span>Log in</span>
                            <svg width="15px" height="10px" viewBox="0 0 13 10">
                                <path d="M1,5 L11,5"></path>
                                <polyline points="8 1 12 5 8 9"></polyline>
                            </svg>
                        </button>
                    </p>
                    <div class="buttons-container">
                        <div class="apple-login-button">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" class="apple-icon"
                                viewBox="0 0 1024 1024" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M747.4 535.7c-.4-68.2 30.5-119.6 92.9-157.5-34.9-50-87.7-77.5-157.3-82.8-65.9-5.2-138 38.4-164.4 38.4-27.9 0-91.7-36.6-141.9-36.6C273.1 298.8 163 379.8 163 544.6c0 48.7 8.9 99 26.7 150.8 23.8 68.2 109.6 235.3 199.1 232.6 46.8-1.1 79.9-33.2 140.8-33.2 59.1 0 89.7 33.2 141.9 33.2 90.3-1.3 167.9-153.2 190.5-221.6-121.1-57.1-114.6-167.2-114.6-170.7zm-105.1-305c50.7-60.2 46.1-115 44.6-134.7-44.8 2.6-96.6 30.5-126.1 64.8-32.5 36.8-51.6 82.3-47.5 133.6 48.4 3.7 92.6-21.2 129-63.7z">
                                </path>
                            </svg>
                            <span>Sign up with Apple</span>
                        </div>
                        <div class="google-login-button">
                            <svg stroke="currentColor" fill="currentColor" stroke-width="0" version="1.1" x="0px"
                                y="0px" class="google-icon" viewBox="0 0 48 48" height="1em" width="1em"
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
                            <span>Sign up with Google</span>
                        </div>
                    </div>

                </div>

            </div>
        </div>






        <script>


            const buttons = document.querySelectorAll('.card p button');

            buttons.forEach(button => {
                button.addEventListener('click', function () {
                    const card = this.closest('.card');
                    card.classList.toggle('flipped');
                });
            });


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
                    $(".email-field-msg").html("EMail is required !!").addClass("text-error");
                    flag = false;
                } else if (exp.test(email) == false) {
                    $(".email-field-msg").html("Please enter valid EMail !!").addClass("text-error");
                    flag = false;
                } else {
                    $(".email-field-msg").html("Input accepted !!").removeClass("text-error").addClass("text-pass");
                }

                //password validation
                let password = $(".password-field").val();

                if (password == "") {
                    $(".password-field-msg").html("Password is required !!").addClass("text-error");
                    flag = false;
                } else {
                    $(".password-field-msg").html("Input accepted !!").removeClass("text-error").addClass("text-pass");
                    flag = true;

                }

                return flag;
            }

            /// for signup


            $(document).on("click", "#signup", function (event) {

                var flag = validateSignUp();

                if (flag) {
                    var name = $("#signup-name").val();
                    var email = $("#signup-email").val();
                    var pwd = $("#signup-password").val();
                    $.ajax({
                        url: "http://localhost:1212/api/v1/auth/signup",
                        type: "POST",
                        data: JSON.stringify({
                            name: name,
                            email: email,
                            password: pwd
                        }),
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        success: function (response) {
                            if (response != null) {
                                window.location.replace("http://localhost:1212/movie/loginpage");
                            } else {
                                alert("error")
                            }
                        },
                        error: function (e) {
                            console.log("error:", e);
                        }
                    });
                } else {

                }

            });



            //------------------validating form --------------------------------------------------------------------------
            //true if form is valid 
            //false if form is not valid
            function validateSignUp() {

                let flag = true;

                //name validation
                let name = $(".signup-name-field").val();
                if (name == "" || name == undefined) {
                    $(".signup-name-field-msg").html("Valid Input is required !!").addClass("text-error");
                    flag = false;
                } else {
                    $(".signup-name-field-msg").html("Input Accepted !!").removeClass("text-error").addClass("text-pass");
                }

                //email validation
                let email = $(".signup-email-field").val();
                let exp = /^[\w-\.]+@([\w]+\.)+[\w-]{2,4}$/;
                if (email == "" || email == undefined) {
                    $(".signup-email-field-msg").html("EMail is required !!").addClass("text-error");
                    flag = false;
                } else if (exp.test(email) == false) {
                    $(".signup-email-field-msg").html("Please enter valid email !!").addClass("text-error");
                    flag = false;
                } else {
                    $(".signup-email-field-msg").html("Input Accepted !!").removeClass("text-error").addClass("text-pass");
                }

                //password validation
                let password = $(".signup-password-field").val();
                let confirmPassword = $(".confirmPassword-field").val();

                if (password == "") {
                    $(".signup-password-field-msg").html("Password is required !!").addClass("text-error");
                    flag = false;
                } else if (confirmPassword != password) {
                    $(".confirmPassword-field-msg").html("Password should match !!").addClass("text-error");
                    flag = false;
                }
                return flag;
            }

        </script>




    </body>

    </html>