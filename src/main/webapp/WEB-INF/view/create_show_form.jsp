<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Enter Details</title>
        <link rel="icon"
            href="data:image/png;base64,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" />


        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <style>
            body {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            .container {
                max-width: 600px;
                margin: auto;
                padding: 20px;
            }

            form {
                display: flex;
                flex-direction: column;
            }

            .center-button {
                text-align: center;
                margin-top: 10px;
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

            .btn  {
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



        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <script>

            // $(document).on("click", "#submitButton", function (event) {
            //     var name = $(".name-field").val();
            //     var city = $(".city-field").val();
            //     var token = localStorage.getItem("token");
            //     var headers = {
            //         "Authorization": "Bearer " + token,
            //     };

            //     $.ajax({
            //         url: "http://localhost:1212/api/v1/admin/addtheaters",
            //         type: "POST",
            //         headers: headers,
            //         data: JSON.stringify({
            //             theaterName: name,
            //             city: city
            //         }),
            //         contentType: 'application/json; charset=utf-8',
            //         async: false,
            //         window: alert("sucess"),
            //         success: function (response) {
            //             alert(response);
            //             alert("Data Added Successfully .");
            //             window.location.replace("http://localhost:1212/api/v1/auth/theaters");
            //         },
            //         error: function (e) {
            //             console.log("Something Went Wrong:", e);
            //         }
            //     });
            // });


            function addShow() {

                var photos = $("#photo")[0].files;
                var formData = new FormData();

                formData.append("showData", JSON.stringify({

                    upcomingShows: $(".show-field").val(),
                    runningTime: $(".time-field").val(),
                    screenId: $(".screen-field").val(),
                    capacity: $(".capacity-field").val(),

                    theater: {
                        theaterId:  $(".theater-field").val()
                    },

                    rating: $("#rating").val(),
                    genre: $("#genre").val(),
                    description: $("#description").val(),
                    language: $("#language").val(),
                    cast: $("#cast").val(),

                }));

                for (var i = 0; i < photos.length; i++) {
                    formData.append("files", photos[i]);
                }
                // formData.append("files", photo);
                var token = localStorage.getItem("token");

                var headers = {
                    "Authorization": "Bearer " + token,
                };

                $.ajax({

                    url: "http://localhost:1212/api/v1/admin/addshows",
                    type: "POST",
                    headers: headers,
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (response) {
                        alert("Data Added Successfully .");
                        window.location.replace("http://localhost:1212/movie/adminhome");
                    },
                    error: function (e) {
                        console.log("Something Went Wrong:", e);
                        window.location.replace("http://localhost:1212/movie/shows")
                    }
                });
            }

            function goBack() {
                window.history.back();
            }
        </script>

    </head>

    <body>

        <div class="container">

            <div class="row">

                <div class="col-md-7 offset-md-3">

                    <form id="createForm" enctype="multipart/form-data">
                        <h3 class="text-center"> Enter Details </h3>

                        <div class="form-group">
                            <label for="name">Show Name:</label>
                            <input type="text" class="form-control show-field" id="show" name="show"
                                placeholder="Enter Name" required>
                        </div>

                        <div class="form-group">
                            <label for="text"> Time:</label>
                            <input type="text" class="form-control time-field" id="time" name="time"
                                placeholder="dd-MM-yyyy HH:mm" required>
                        </div>
                        <div class="form-group">
                            <label for="text"> Screen:</label>
                            <input type="number" min="1" max="4" class="form-control screen-field" id="screen"
                                name="screen" placeholder="Enter screen" required>
                        </div>

                        <div class="form-group">
                            <label for="number"> Capacity:</label>
                            <input type="number" class="form-control capacity-field" id="capacity" name="capacity"
                                placeholder="Enter capacity" required>
                        </div>

                        <div class="form-group">
                            <label for="number"> Theater Id:</label>
                            <input type="number" min="1" class="form-control theater-field" id="time" name="time"
                                placeholder="Enter Theater" required>
                        </div>

                        <div class="form-group">
                            <label for="rating">Rating:</label>
                            <input type="text" class="form-control" id="rating" name="rating" placeholder="Show Rating" required>

                        </div>

                        <div class="form-group">
                            <label for="genre">Genre:</label>
                            <input type="text" class="form-control" id="genre" name="genre" required>

                        </div>

                        <div class="form-group">
                            <label for="language">Language:</label>
                            <input type="text" class="form-control" id="language" name="language" placeholder="Available Languages " required>

                        </div>

                        <div class="form-group">
                            <label for="description">Description:</label>
                            <textarea id="description" class="form-control" name="description" placeholder="About the movie" required></textarea>

                        </div>

                        <div class="form-group">
                            <label for="cast">Cast:</label>
                            <input type="text" class="form-control" id="cast" name="cast" placeholder="Cast " required>

                        </div>

                        <div class="form-group">
                            <label for="text"> Photo:</label>
                            <input type="file" class="form-control photo-field" id="photo" name="photo"
                                multiple="multipart" placeholder="Enter Path">
                        </div>


                        <div class="center-button">
                            <button class="btn  " type="reset" style="padding: 5px 10px 5px 10px; border-radius: 5px;"
                                onclick="goBack()">

                                Back

                            </button>

                            <button class="btn" id="submitButton" type="button"
                                style="padding: 5px 10px 5px 10px;border-radius: 5px;" onclick="addShow()">
                                Submit
                            </button>
                        </div>
                    </form>

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

            // $(document).ready(
            //     function () {
            //         $("#submitButton").submit(function (event) {
            //             event.preventDefault();
            //             ajaxPost();
            //         });

            //         function ajaxPost() {
            //             var formData = {
            //                 theaterName: $(".name-field").val(),
            //                 city: $(".city-field").val()
            //             }

            //             //DO POST
            //             $.ajax({
            //                 type: "POST",
            //                 url: "http://localhost:1212/api/v1/admin/addtheaters",
            //                 data: JSON.stringify(formData),
            //                 dataType: 'JSON',
            //                 success: function (response) {
            //                     if (response) {
            //                         console.log(response);
            //                     } else {
            //                         console.log("error else");
            //                     }
            //                 },
            //                 error: function (e) {
            //                     console.log(e);
            //                 }

            //             });
            //         }
            //     });





        </script>

    </body>

    </html>