<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Enter Details</title>
        <link rel="icon"
            href="data:image/png;base64,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" />

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

        <style>
            body {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            .container {
                width: 50%;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                width: 100%;
                font-size: 16px;
            }

            input {
                width: 100%;
                padding: 8px;
                font-size: 14px;
            }

            input[type="submit"] {
                width: auto;
                padding: 10px;
                font-size: 16px;
                margin-top: 10px;
            }

            h1 {
                font-size: 24px;
                text-align: center;
            }

            .btn:hover {
                background-color: rgb(235, 84, 84);
                border-radius: 10px;
            }

            .btn {
                background-color: #f0f0f0;
            }

            .non-editable {
                background-color: #f0f0f0;
                cursor: not-allowed;
            }

            .form-control:hover {
                border-color: rgb(235, 84, 84);
                border: 2px solid rgb(235, 84, 84);
                box-shadow: 0 0 15px rgb(172, 134, 134);
            }
        </style>


        <script>

            $(document).on("click", "#signup", function (event) {

                var name = $("#name").val();
                var email = $("#email").val();
                var pwd = $("#password").val();
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
            });

        </script>

    </head>

    <body>

        <div class="container">

            <div class="row">

                <div class="col-md-7 offset-md-3">

                    <form id="signupform">
                        <h3 class="text-center"> Enter Details </h3>

                        <div class="form-group">
                            <label for="name">

                                Your Name:

                            </label>

                            <input type="text" class="form-control name-field" id="name" name="name"
                                placeholder="Enter Your Name">
                            <small class="name-field-msg form-text text-danger ml-2"></small>
                        </div>


                        <div class="form-group">
                            <label for="eMail">

                                E Mail:

                            </label>
                            <input type="text" class="form-control email-field" id="email" name="email"
                                placeholder="example@gmail.com">
                            <small class="email-field-msg form-text text-danger ml-2"></small>
                        </div>

                        <div class="form-group">
                            <label for="password">

                                Password:

                            </label>
                            <input type="password" class="form-control password-field" id="password" name="password"
                                placeholder="*********">
                            <small class="password-field-msg form-text text-danger ml-2"></small>
                        </div>

                        <div class="form-group">
                            <label for="confirmPassword">

                                Confirm Password:

                            </label>
                            <input type="password" class="form-control confirmPassword-field" id="confirmPassword"
                                name="confirmPassword" placeholder="*********">
                            <small class="confirmPassword-field-msg form-text text-danger ml-2"></small>
                        </div>


                        <!-- <div class="center-button">
                            <button class="btn  " type="reset" style="padding: 5px 10px 5px 10px; border-radius: 5px;"
                                onclick="goBack()">

                                Back

                            </button> -->

                            <button class="btn" id="signup" type="button"
                                style="padding: 5px 10px 5px 10px;border-radius: 5px;">

                                Submit

                            </button>

                        <!-- </div> -->

                    </form>
                    <p class="mt-3">have an account? <a href="loginpage">Log In</a></p>

                </div>

            </div>

        </div>


        <script>

            // function showConfirmationDialog() {
            //     // Get values from the form
            //     var firstName = document.getElementById('firstName').value;
            //     var lastName = document.getElementById('lastName').value;
            //     var eMail = document.getElementById('eMail').value;
            //     var departmentName = document.getElementById('departmentName').value;

            //     // Creating a custom confirmation message
            //     var confirmationMessage = "Are you sure you want to submit the following details?\n\n";
            //     confirmationMessage += "First Name: " + firstName + "\n";
            //     confirmationMessage += "Last Name: " + lastName + "\n";
            //     confirmationMessage += "E Mail: " + eMail + "\n";
            //     confirmationMessage += "Department Name: " + departmentName;

            //     var userConfirmed = confirm(confirmationMessage);
            //     if (userConfirmed) {
            //         // User clicked "OK" then Proceed with form submission
            //         return true;
            //     } else {
            //         // User clicked "Cancel" it Prevent form submission
            //         return false;
            //     }
            //     return true;

            // }

            //------------------validating form --------------------------------------------------------------------------
            //true if form is valid 
            //false if form is not valid
            function validate() {

                let flag = true;

                //name validation
                let name = $(".name-field").val();
                if (name == "" || name == undefined) {
                    $(".name-field-msg").html("Valid Input is required !!").addClass("text-danger");
                    flag = false;
                } else {
                    $(".name-field-msg").html("Input Accepted !!").removeClass("text-danger").addClass("text-success");
                }

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

                let password = $(".password-field").val();
                let confirmPassword = $(".confirmPassword-field").val();

                if (password == "") {
                    $(".password-field-msg").html("Password is required !!").addClass("text-danger");
                    flag = false;
                } else if (confirmPassword != password) {
                    $(".confirmPassword-field-msg").html("Password should match !!").addClass("text-danger");
                    flag = false;
                }

                return flag;
            }

            function validatePassword() {
                var password = document.getElementById('password').value;
                var confirmPassword = document.getElementById('confirmPassword').value;
                var passwordError = document.getElementById('passwordError');

                if (password !== confirmPassword) {
                    passwordError.innerHTML = 'Passwords do not match.';
                    return false;
                } else {
                    passwordError.innerHTML = '';
                    return true;
                }
            }

            function goBack() {
                window.history.back();
            }

        </script>

    </body>

    </html>