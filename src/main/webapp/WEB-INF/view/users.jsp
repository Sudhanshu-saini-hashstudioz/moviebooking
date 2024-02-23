<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@page isELIgnored="false" %>

        <!doctype html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
                integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

            <title> User Data </title>

            <link rel="icon"
                href="data:image/png;base64,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" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <script>
                $(document).ready(function () {
                    var token = localStorage.getItem("token");
                    var headers = {
                        "Authorization": "Bearer " + token,
                    };
                    $.ajax({
                        url: "http://localhost:1212/api/v1/admin/getusers",
                        type: "GET",
                        headers: headers,
                        contentType: 'application/json; charset=utf-8',
                        async: false,
                        success: function (response) {
                            var users = JSON.parse(JSON.stringify(response));
                            if (users && users.length > 0) {
                                populateUsersTable(users);
                            } else {
                                console.log("No user data found in local storage.");
                            }

                        },
                        error: function (e) {
                            window.location.replace("http://localhost:1212/movie/adminhome");
                        }
                    });

                });

                function populateUsersTable(users) {
                    var tableBody = $("table tbody");
                    tableBody.empty();
                    var statusOptions = ['DEACTIVATE', 'ACTIVE'];
                    $.each(users, function (index, user) {
                        var row = $('<tr>');
                        row.append($('<td>').text(user.id));
                        row.append($('<td>').text(user.name));
                        row.append($('<td>').text(user.email));
                        row.append($('<td>').text(user.role));
                        row.append($('<td>').text(user.createdDate));
                        row.append($('<td>').text(user.modifiedDate));

                        // Create and configure the status select element
                        var statusSelect = $('<select>');
                        var actionColumn = $("<td>");
                        if (user.role !== 'ADMIN') {
                            actionColumn.append('<a onclick="return confirmDelete(\'' + user.email + '\' , \'' + user.name + '\' , \'' + user.role + '\')"><button type="button" class="btn">Delete</button></a>');
                            // actionColumn.append('<i onclick="return confirmDelete(\''+ user.email + '\' , \'' + user.name + '\' , \'' + user.role + '\')" class="fa-solid fa-user-minus" type="button" aria-hidden="true"></i>');
                            for (var i = 0; i < statusOptions.length; i++) {
                                var option = $('<option>').text(statusOptions[i]);
                                statusSelect.append(option);
                            }
                        } else {
                            statusSelect.prop('disabled', true); // Disable select for ADMIN
                        }

                        // Set the selected option 
                        statusSelect.val(user.status);

                        statusSelect.on('change', function () {
                            var newStatus = $(this).val(); // Get the selected status
                            updateUser(user.id, newStatus); // Call the update method
                        });

                        row.append($('<td>').append(statusSelect));
                        if (!user.deleted) {
                            actionColumn.append('<a onclick="return confirmUpdate(\'' + user.id + '\' , \'' + + '\')"><button type="button" class="btn">Update</button></a>');
                        } else {
                            actionColumn.append($('<td>').text("Not Available"));
                        }

                        row.append(actionColumn);
                        tableBody.append(row);
                    });
                }


                function search() {

                    var email = $(".email-field").val();

                    if (email != "") {

                        var token = localStorage.getItem("token");
                        var headers = {
                            "Authorization": "Bearer " + token,
                        };
                        $.ajax({
                            url: "http://localhost:1212/api/v1/admin/getuser",
                            type: "GET",
                            headers: headers,
                            contentType: 'application/json; charset=utf-8',
                            data: {
                                email: email
                            },
                            async: false,
                            success: function (user) {
                                // var users = JSON.parse(JSON.stringify(response));
                                // populateUsersTable(users);
                                var statusOptions = ['DEACTIVATE', 'ACTIVE'];
                                var tableBody = $("table tbody");
                                tableBody.empty();
                                var row = $('<tr>');
                                row.append($('<th>').text(user.id));
                                row.append($('<td>').text(user.name));
                                row.append($('<td>').text(user.email));
                                row.append($('<td>').text(user.role));
                                row.append($('<td>').text(user.createdDate));
                                row.append($('<td>').text(user.modifiedDate));


                                // Create and configure the status select element
                                var statusSelect = $('<select>');
                                var actionColumn = $("<td>");
                                if (user.role !== 'ADMIN') {
                                    // actionColumn.append('<a onclick="return confirmDelete(\'' + user.email + '\' , \'' + user.name + '\' , \'' + user.role + '\')"><button type="button" class="btn">Delete</button></a>');
                                    actionColumn.append('<i onclick="return confirmDelete(\''+ user.email + '\' , \'' + user.name + '\' , \'' + user.role + '\')" class="fa-solid fa-trash" type="button" aria-hidden="true"></i>');
                                    for (var i = 0; i < statusOptions.length; i++) {
                                        var option = $('<option>').text(statusOptions[i]);
                                        statusSelect.append(option);
                                    }
                                } else {
                                    statusSelect.prop('disabled', true); // Disable select for ADMIN
                                }

                                // Set the selected option 
                                statusSelect.val(user.status);

                                statusSelect.on('change', function () {
                                    var newStatus = $(this).val(); // Get the selected status
                                    updateUser(user.id, newStatus); // Call the update method
                                });

                                row.append($('<td>').append(statusSelect));
                                var actionColumn = $("<td>");

                                if (!user.deleted) {
                                    actionColumn.append('<a onclick="return confirmUpdate(\'' + user.id + '\' , \'' + + '\')"><button type="button" class="btn">Update</button></a>');
                                } else {
                                    actionColumn.append($('<td>').text("Not Available"));
                                }
                                row.append(actionColumn);
                                tableBody.append(row);

                            },
                            error: function (e) {
                                alert("User Not Found");
                            }
                        });

                    }
                }

                function searchByName() {
                    var name = $("#search-input").val();
                    var token = localStorage.getItem("token");
                    var headers = {
                        "Authorization": "Bearer " + token,
                    };
                    $.ajax({
                        url: "http://localhost:1212/api/v1/admin/getuserbyname",
                        type: "GET",
                        headers: headers,
                        contentType: 'application/json; charset=utf-8',
                        data: {
                            name: name
                        },
                        async: false,
                        success: function (response) {
                            var users = JSON.parse(JSON.stringify(response));
                            if (users && users.length > 0) {
                                populateUsersTable(users);
                            } else {
                                console.log("No user data found in local storage.");
                            }

                        },
                        error: function (e) {
                            window.reload();
                        }
                    });
                }


                function showConfirmationDialog() {
                    var confirmationMessage = "Are you sure you want to delete data ?"
                    return confirm(confirmationMessage);
                }


                function updateUser(id, status) {
                    var token = localStorage.getItem("token");
                    var formData = new FormData();
                    formData.append("id", id);
                    formData.append("status", status);
                    var headers = {
                        "Authorization": "Bearer " + token,
                    };

                    $.ajax({
                        url: "http://localhost:1212/api/v1/admin/updateuser",
                        type: "PUT",
                        headers: headers,
                        data: formData,
                        contentType: false,
                        processData: false,
                        async: false,
                        success: function (response) {

                            window.location.reload();

                        },
                        error: function (e) {
                            alert("Something Went Wrong:");
                            console.log("Something Went Wrong:", e);
                            window.location.reload();
                        }
                    });

                }

                function confirmDelete(email, name, role) {
                    var confirmationMessage = "Are you sure you want to Delete the data? \n";
                    confirmationMessage += "Name : " + name + "\n";
                    confirmationMessage += "Email : " + email + "\n";
                    confirmationMessage += "Role : " + role + "\n";
                    var userConfirmed = confirm(confirmationMessage);
                    if (userConfirmed) {
                        return deleteData(email);
                    } else {
                        return false;
                    }
                    return true;
                }


                function deleteData(email) {

                    var token = localStorage.getItem("token");
                    var formData = new FormData();
                    formData.append("email", email);
                    var headers = {
                        "Authorization": "Bearer " + token,
                    };

                    $.ajax({
                        url: "http://localhost:1212/api/v1/admin/deleteuser",
                        type: "DELETE",
                        headers: headers,
                        data: formData,
                        contentType: false,
                        processData: false,
                        async: false,
                        success: function (response) {
                            window.location.reload();

                        },
                        error: function (e) {
                            alert("Something Went Wrong:");
                            console.log("Something Went Wrong:", e);
                            window.location.reload();
                        }
                    });
                }



                var isAuthenticated = true;

                function toggleLoginLogout() {
                    var token = localStorage.getItem('token');
                    if (isAuthenticated) {
                        localStorage.clear();
                        sessionStorage.clear();
                        window.location.href = "home";
                        document.getElementById("logout").style.display = "none";

                    } else {
                        window.location.href = "loginpage";
                    }
                }


                function performLogout() {
                    if (isAuthenticated) {
                        localStorage.clear();
                        sessionStorage.clear();
                        document.getElementById("logoutButton").style.display = "none";
                        window.location.href = "home";

                    } else {
                        window.location.href = "loginpage";
                    }
                }

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

                .navbar {
                    background-color: whitesmoke;
                }

                .overlay {
                    position: fixed;
                    top: 0;
                    right: -50%;
                    width: 0%;
                    height: 100%;
                    background-color: whitesmoke;
                    overflow-x: hidden;
                    transition: 0.2s;
                    backface-visibility: hidden;
                    z-index: 2;

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

                .btn {
                    color: white;
                    background-color: rgb(235, 84, 84);
                    border-radius: 10px;
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
                    color: #0a0a0a;
                    display: block;
                    transition: 0.2s;
                    border-color: grey;
                    border-block: inherit;
                }

                .overlay a:hover,
                .hamburger:hover,

                .overlay a:focus {
                    color: #f1f1f1;
                    background-color: rgb(235, 84, 84);
                    border-radius: 10px;
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

                .search {
                    margin-left: 75%;
                    margin-bottom: 5px;
                    display:inline-flex;
                    flex-direction: row;
                }

                .table {
                    align-items: center;
                    overflow-y: auto;
                    height: 400px;
                }

                table {
                    font-family: arial, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                }

                tbody {
                    overflow-y: auto;
                }

                td,
                th {
                    width: auto;
                   
                    text-align: center;
                    padding: 8px;
                }

                tr,
                th {
                    margin: 6px;
                }

                tr:nth-child(even) {
                    background-color: rgb(221, 221, 221);
                }


                /* .table {
                    align-items: center;
                    overflow-y: auto;
                    height: 400px;
                }

                table {
                    border-collapse: collapse;
                    width: 100%;
                }

                th,
                td {
                    padding: 8px 16px;
                }

                th {
                    background: #eee;
                } */
            </style>
        </head>



        <body>

            <!-- Navigation Bar -->
            <nav class="navbar navbar-expand-lg navbar-light ">
                <a class="navbar-brand" href="adminhome"> <img src="/movie/logo1.png" alt="Logo" height="40"> </a>
                <span style="font-size:20px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span>


                <!-- Search Bar -->
                <form class="form-inline my-2 my-lg-0 mx-auto">
                    <input class="form-control mr-sm-2" id="search-input" type="search" placeholder="User Name"
                        aria-label="Search">
                    <button class="btn searchbutton  my-2 my-sm-0" type="button" style="margin-left: 5px;"
                        onclick="searchByName()">Search</button>
                </form>

                <div id="myNav" class="overlay left">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                    <i style="margin-left: 20px ;font-size:40px;color:lightblue;text-shadow:2px 2px 4px #000000;"> <img
                            src="/movie/logo1.png" alt="Logo" height="40"> </i>
                    <div class="overlay-content">
                        <a type="button" href="#" onclick="handleLinkClick(event)">About</a>
                        <a type="button" href="users" onclick="handleLinkClick(event)">Users</a>
                        <a type="button" href="theatres" onclick="handleLinkClick(event)">Theatres</a>
                        <a type="button" href="shows" onclick="handleLinkClick(event)">Shows</a>
                        <a type="button" href="bookings" onclick="handleLinkClick(event)">Bookings</a>
                        <a type="button" href="#" id="logoutButton" onclick="performLogout()">Logout</a>

                    </div>
                </div>
                <!-- <span style="font-size:30px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span> -->
                <button onclick="goBack()" class="btn backbtn">Back</button>
            </nav>

            <div class="container mt-3">

                <div class="row">

                    <div class="col-md-12">



                        <h3 class="text-center mb-3"> Registered Users </h3>
                        <div class="search">
                            <input type="test" class="form-control email-field" id="email" name="email"
                                placeholder="User Email">
                            <button class="btn searchbutton  my-2 my-sm-0" type="button" style="margin-left: 5px;"
                                onclick="search()">Search</button>
                        </div>


                        <div class="table">

                            <table>

                                <thead class="thead-dark">
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">User Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Role</th>
                                        <th scope="col">Created Date</th>
                                        <th scope="col">Modeified Date</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>

                                <tbody>

                                </tbody>

                            </table>

                        </div>
                    </div>


                </div>


            </div>

        </body>

        </html>