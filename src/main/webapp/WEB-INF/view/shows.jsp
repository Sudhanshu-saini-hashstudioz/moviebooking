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

    <title>Show Data</title>
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
          url: "http://localhost:1212/api/v1/admin/getshowslist",
          type: "GET",
          headers: headers,
          contentType: 'application/json; charset=utf-8',
          async: false,
          success: function (response) {
            // localStorage.setItem("shows", JSON.stringify(response));
            var shows = JSON.parse(JSON.stringify(response));
            populateShowsTable(shows);

          },
          error: function (e) {
            alert("Access Denied");
            console.log("Something Went Wrong:", e);
            window.location.replace("http://localhost:1212/movie/loginpage");
          }
        });

      });

      function searchByName() {
        var name = $(".search-input").val();
        $.ajax({
          url: "http://localhost:1212/api/v1/auth/getshowsbyname",
          type: "GET",
          contentType: 'application/json; charset=utf-8',
          data: {
            name: name
          },
          async: false,
          success: function (response) {
            var shows = JSON.parse(JSON.stringify(response));
            populateShowsTable(shows);
          },
          error: function (e) {
            alert("Something Went Wrong:");
            window.location.replace("http://localhost:1212/movie/loginpage");
          }
        });

      }

      function populateShowsTable(shows) {
        var tableBody = $("table tbody");
        tableBody.empty();

        $.each(shows, function (index, show) {
          var row = $("<tr>");
          row.append($("<th>").text(show.showId));
          row.append($("<td>").text(show.upcomingShows));
          row.append($("<td>").text(show.genre));
          row.append($("<td>").text(show.theater.theaterName));
          row.append($("<td>").text(show.screenId));
          row.append($("<td>").text(show.runningTime));
          row.append($("<td>").text(show.theater.city));

          var actionColumn = $("<td>");
          actionColumn.append('<a onclick ="return confirmDelete(\'' + show.upcomingShows + '\' , \'' + show.runningTime + '\' , \'' + show.showId + '\')"><button type="button" class="btn">Delete</button></a>');
          actionColumn.append('<a href="#"><button type="button" class="btn">Update</button></a>');

          row.append(actionColumn);
          tableBody.append(row);
        });
      }


      function search() {
        var theater = $(".theater-field").val();
        var screen = $(".screen-field").val();
        var token = localStorage.getItem("token");
        var headers = {
          "Authorization": "Bearer " + token,
        };
        $.ajax({
          url: "http://localhost:1212/api/v1/admin/getshow",
          type: "GET",
          headers: headers,
          contentType: 'application/json; charset=utf-8',
          data: {
            theaterId: theater,
            screenId: screen
          },
          async: false,
          success: function (response) {
            // localStorage.setItem("shows", JSON.stringify(response));
            var shows = JSON.parse(JSON.stringify(response));
            populateShowsTable(shows);

          },
          error: function (e) {
            alert("Access Denied");
            console.log("Something Went Wrong:", e);
            window.location.reload();
          }
        });


      }


      function showConfirmationDialog() {
        var confirmationMessage = "Are you sure you want to delete data ?"
        return confirm(confirmationMessage);
      }

      function confirmDelete(name, time, id) {
        var confirmation = "Are you sure you want to Delete the data?";
        confirmationMessage += "Name : " + name + "\n";
        confirmationMessage += "TIme : " + time + "\n";
        var confirmed = confirm(confirmation);
        if (confirmed) {
          return deleteData(id);
        } else {
          return false;
        }
      }

      function deleteData(id) {

        var formData = new FormData();
        formData.append("id", id);
        var headers = {
          "Authorization": "Bearer " + localStorage.getItem("token"),
        };

        $.ajax({
          url: "http://localhost:1212/api/v1/admin/deleteshow",
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

      document.addEventListener('DOMContentLoaded', function () {
        toggleLoginLogout();
      });

      var isAuthenticated;

      function toggleLoginLogout() {
        var token = localStorage.getItem('token');

        if (token) {
          document.getElementById("loginButton").style.display = "none";
          loginButton.innerText = "Logout";
          isAuthenticated = true;

        } else {
          isAuthenticated = false;

        }
      }

      function performLogout() {
        if (isAuthenticated) {
          localStorage.clear();
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

      .form-control {
        margin-left: 5px;
        margin-right: 5px;
        border-radius: 10px;
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
        transition: 0.5s;
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
        transition: 0.3s;
        border-color: grey;
        border-block: inherit;
      }

      .overlay a:hover,
      .hamburger:hover,
      .btn:hover,
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

      /* /* .btn:hover {
        background-color: rgb(235, 84, 84);
      } */

      .btn {

        margin-left: 5px;
        margin-right: 5px;
        color: black;
        background-color: #dfdfdf;
        border-radius: 10px;
      }

      .btnCls {
        margin-top: 5px;
      }

      .search {
        margin-bottom: 5px;
        display: flex;
        justify-content: left;
        margin-left: 20px;
        /* align-items: center; */
      }

      .search-input-container {
        display: flex;
        margin-left: 43%;
        align-items: center;
      }

      .table {
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
      }
    </style>
  </head>

  <body>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light ">
      <a class="navbar-brand" href="adminhome"> <img src="/movie/logo1.png" alt="Logo" height="40"> </a>
      <span style="font-size:20px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span>

      <!-- Search Bar -->
      <form class="form-inline my-2 my-lg-0 mx-auto">
        <input class="form-control mr-sm-2 search-input" type="search" placeholder="Search" aria-label="Search">
        <button class="btn searchbutton  my-2 my-sm-0" type="button" onclick="searchByName()">Search</button>
      </form>

      <div class="loginbtn" id="loginButtonContainer">
        <button id="loginButton" class="btn mr-2" onclick="performLogout()">Login/Signup</button>
      </div>

      <div id="myNav" class="overlay left">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <i style=" margin-left: 20px ;font-size:40px;color:lightblue;text-shadow:2px 2px 4px #000000;"> <img
            src="/movie/logo1.png" alt="Logo" height="40"> </i>
        <div class="overlay-content">
          <a type="button" href="#" onclick="handleLinkClick(event)">About</a>
          <a type="button" href="users" onclick="handleLinkClick(event)">Users</a>
          <a type="button" href="theaters" onclick="handleLinkClick(event)">Theater</a>
          <a type="button" href="shows" onclick="handleLinkClick(event)">Shows</a>
          <a type="button" href="bookings" onclick="handleLinkClick(event)">Bookings</a>
          <a type="button" id="logoutButton" onclick="performLogout()">Logout</a>
        </div>
      </div>
    </nav>

    <div class="container mt-3">

      <div class="row">

        <div class="col-md-12">

          <h3 class="text-center mb-3"> Upcoming ShowsList</h3>


          <div class="search">
            <button onclick="goBack()" class="btn">Back</button>
            <a href="createshow" class="btn" type="button">Add Show</a>

            <div class="search-input-container">
              <input type="number" min="1" class="form-control theater-field" id="theater" name="theater"
                placeholder="TheaterId">
              <input type="number" min="1" max="4" class="form-control screen-field" id="screen" name="screen"
                placeholder="Screen">
              <button class="btn searchbutton  my-2 my-sm-0" type="button" onclick="search()">Search</button>
            </div>
          </div>

          <!-- <div class="search">
            
          </div> -->

          <div class="col-md-12 table">

            <table>
              <thead class="thead-dark">
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Title</th>
                  <th scope="col">Genre</th>
                  <th scope="col">Theater Name</th>
                  <th scope="col">Screen</th>
                  <th scope="col">Time</th>
                  <th scope="col">City</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>

              </tbody>
            </table>

          </div>
          <!-- <div class="btnCls">
            
          </div> -->

        </div>
      </div>


    </div>

  </body>

  </html>