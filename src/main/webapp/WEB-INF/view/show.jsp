<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Movie </title>

        <link rel="icon"
            href="data:image/png;base64,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" />

        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: 'Lato', sans-serif;
               
            }

            .navbar {
                background-color:oldlace;
            }

            .overlay {
                position: fixed;
                top: 0;
                right: -50%;
                width: 0%;
                height: 100%;
                background-color: oldlace;
                overflow-x: hidden;
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
            .hamburger:hover{
                color:darksalmon;
                background-color: lavender;
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

            .btn,
            #btn {
                /* color: white; */
                /* background-color: rgb(235, 84, 84); */

                border-radius: 15px;
                background: linear-gradient(145deg, #ffffff, #e3dede);
                box-shadow: 7px 7px 8px #656363,
                    -7px -7px 8px #ffffff;

                background-color:lavender;
                box-shadow: 5px;
                color: maroon;
                border-radius: 10px;
                cursor: pointer;

            }

            .btn:hover{
                color: darksalmon;
            }

            p {
                color: maroon;
            }
            .ticketbtn {
                bottom: 5px;
                align-items: center;
                border-radius: 10px;
                cursor: pointer;
                padding: 10px;
                font-weight: bold;
                color: maroon;
                background-color:lavender;
                border-color: lavender;
                position: absolute;
            }


            #loginbutton,
            #logout {}

            .logobtn {
                top: 15px;
                left: 10px;
            }

            .form-control:hover {
                border-color: 3px solid rgb(235, 84, 84);
                border: 0.5px solid rgb(235, 84, 84);
                box-shadow: 0 0 15px rgb(172, 134, 134);
            }

            .card-body {
                border-radius: 15px;
                background-color: whitesmoke;
                box-shadow: 5% rgb(235, 84, 84);
                padding: 20px;
                text-align: center;
                align-self: center;
            }



            #showContainer {
                display: flex;
                flex-wrap: wrap;
                justify-content: left;
            }

            #othermovies{
                display: flex;
                flex-wrap: nowrap;
                justify-content: left;
            }


            #showcard{
                margin-top: 15px;
                margin-left: 80px ;
            }

            .show-card {
                background-color: oldlace;
                /* color: white; */
                border-radius: 15px;
                width: 100%;
                height: 263px;
                margin-top: 20px;
                margin-bottom: 10PX;
                margin-left: 80px;
                margin-right:80px ;
                padding-top: 5px;
                padding-left: 5px;
                border: 1px solid #ccc;
                text-align: center;
                display: inline-flex;
                justify-content: left;
                flex-direction: row;
            }

            .ratingcontainer {
                flex-direction: row;
                display: inline-flex;
                justify-content: center;
                text-align: center;
            }

            .details {
                min-width: max-content;
                position: relative;
                flex-direction: column;
                display: flex;
                align-items: flex-start;
                padding-left: 20px;
            }

            .show-card img,
            showcard img {
                /* aspect-ratio: 1/1;
                object-fit: cover;
                padding: 2px; */
                border-radius:10px ;
                width: fit-content;
                justify-content: baseline;
                height: 250px;
                object-fit: cover;

            }

            .about-show {
                position: relative;
                flex-direction: column;
                display: flex;
                align-items: flex-start;
                padding-left: 20px;
                padding-right: 20px;
                font-weight: 400;
                margin-left: 40px;
                font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            }
            p{
                text-align: left;
            }

            .head {
                font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                font-weight: bold;
            }

            #container {
                display: flex;
                flex-wrap: wrap;
                margin-left: 40px;
                margin-top: 10px;
                justify-content: left;
            }

            .body-show-card {
                background-color: oldlace;
                /* background-color: white; */
                border-radius: 10px;
                width: 225px;
                height: 380px;
                margin: 15px;
                border: 1px solid #ccc;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
                text-align: center;
                cursor: pointer;
                transition: transform 0.3s ease-out;
            }
            .body-show-card img{
                border-radius: 10px;
            }
            .body-show-card:hover {
                transform: scale(1.07);
                /* Scale the element on hover */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                z-index: 3;

            }

            i {
                margin: 5px;
                cursor: pointer;
            }

            i:hover {
                transition: transform 0.3s ease-out;
                transform: scale(1.70);
                /* Scale the element on hover */
                box-shadow: 0 0 10px rgb(221, 221, 221, 0.5);
                z-index: 3;

            }


        </style>

        </style>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>

            $(document).ready(function () {

                var showId = localStorage.getItem("showId");
                $.ajax({
                    url: "http://localhost:1212/api/v1/auth/getshowbyid",
                    type: "GET",
                    contentType: 'application/json; charset=utf-8',
                    data: {
                        id: showId
                    },
                    async: false,
                    success: function (response) {

                        var show = JSON.parse(JSON.stringify(response));
                        populateCard(show);
                    },
                    error: function (e) {
                        alert("Something Went Wrong:");
                        window.location.replace("http://localhost:1212/movie/home");
                    }
                });

            });

            function populateCard(show) {
                var showContainer = document.getElementById("showContainer");
                showContainer.innerHTML = "";
                var card = createShowCard(show);
                showContainer.appendChild(card);
                populateBody();
            }

            function createShowCard(show) {
                var card = document.createElement("div");
                var card1 = document.createElement("div");
                var card2 = document.createElement("div");
                var card3 = document.createElement("div");

                var ratingContainer = document.createElement("div");
                card.className = "show-card";
                card1.className = "image";
                card2.className = "details";
                ratingContainer.className = "ratingcontainer";

                var imageElement = document.createElement("img");

                // Use the first photo if available
                if (show.files && show.files.length > 0) {
                    var base64Image = show.files[0].imagedata;
                    imageElement.src = "data:image/jpeg;base64," + base64Image;
                } else {
                    imageElement.src = "path/to/default/image.jpg";
                }

                imageElement.alt = "Show Image";

                var titleElement = document.createElement("h2");
                titleElement.className = "head";
                titleElement.innerText = show.upcomingShows;

                sessionStorage.setItem("showName" ,show.upcomingShows);

                var ratingElement = document.createElement("h5");
                ratingElement.innerText = " " + show.rating + "/10";

                var ratingIcon = document.createElement("i");
                ratingIcon.className = "fa fa-star";
                ratingIcon.setAttribute("aria-hidden", "true");

                ratingContainer.appendChild(ratingIcon);
                ratingContainer.appendChild(document.createTextNode(" "));
                ratingContainer.appendChild(ratingElement);

                var languageElement = document.createElement("h5");
                languageElement.innerText = show.language;

                var genreElement = document.createElement("h5");
                genreElement.innerText = show.genre;

                var bookTicketElement = document.createElement("button");
                bookTicketElement.className = "ticketbtn"
                bookTicketElement.setAttribute("onclick", "seat()");
                bookTicketElement.innerHTML = "Book Tickets"
                card1.appendChild(imageElement);
                card2.appendChild(titleElement);
                card2.appendChild(ratingContainer);
                card2.appendChild(languageElement);
                card2.appendChild(genreElement);
                card2.appendChild(bookTicketElement);


                //extra 
                var aboutCard = document.createElement("div");
                aboutCard.className = "about-show";

                var aboutHead = document.createElement("h5");
                aboutHead.innerText = "About The Movie";
                aboutHead.className = "head";
                var aboutDiv = document.createElement("p");
                aboutDiv.innerText = show.description;

                var castHead = document.createElement("h5");
                castHead.innerText = "Cast";
                castHead.className = "head";
                var castDiv = document.createElement("p");
                castDiv.innerText = show.cast;
                aboutCard.appendChild(aboutHead);
                aboutCard.appendChild(aboutDiv);
                aboutCard.appendChild(castHead);
                aboutCard.appendChild(castDiv);

                card.appendChild(card1);
                card.appendChild(card2);
                card.appendChild(aboutCard);

                return card;
            }

            //byte array to a base64-encoded string
            function arrayBufferToBase64(buffer) {
                var binary = '';
                var bytes = new Uint8Array(buffer);
                var len = bytes.byteLength;
                for (var i = 0; i < len; i++) {
                    binary += String.fromCharCode(bytes[i]);
                }
                return btoa(binary);
            }


            function seat() {
                window.location.href = "http://localhost:1212/movie/selectshow";
            }


            function searchByName() {
                var name = $("#search-input").val();
                if (name != "") {
                    $.ajax({
                        url: "http://localhost:1212/api/v1/auth/getshowsbynameandcity",
                        type: "GET",
                        contentType: 'application/json; charset=utf-8',
                        data: {
                            name: name
                        },
                        async: false,
                        success: function (response) {
                            var shows = JSON.parse(JSON.stringify(response));
                            if (shows.length == 0) {
                                alert("No Show Found");
                            } else {
                                populateBodyCard(shows);
                            }

                        },
                        error: function (e) {
                            alert("Something Went Wrong:");
                            window.location.replace("http://localhost:1212/movie/home");
                        }
                    });
                } 
            }

            function populateBody(){

                $.ajax({
                    url: "http://localhost:1212/api/v1/auth/getshowslist", 
                    type: "GET",
                    contentType: 'application/json; charset=utf-8',
                    async: false,
                    success: function (response) {
                        var shows = JSON.parse(JSON.stringify(response));
                        console.log(shows);
                        populateBodyCard(shows);
                    },
                    error: function (e) {
                        window.location.replace("http://localhost:1212/movie/home");
                    }
                });
            }

            function populateBodyCard(shows){

                var showContainer = document.getElementById("othermovies");
                showContainer.innerHTML = "";

                shows.forEach(function (show) {
                    var card = createBodyShowCard(show);
                    showContainer.appendChild(card);
                });
            }

            function createBodyShowCard(show) {
                var card = document.createElement("div");
                card.className = "body-show-card";

                var imageElement = document.createElement("img");

                // Use the first photo if available
                if (show.files && show.files.length > 0) {
                    var base64Image = show.files[0].imagedata;
                    imageElement.src = "data:image/jpeg;base64," + base64Image;
                } else {
                    imageElement.src = "path/to/default/image.jpg";
                }

                imageElement.alt = "Show Image";

                var titleElement = document.createElement("b");
                titleElement.className = "title";
                titleElement.innerText = show.upcomingShows;

                var genreElement = document.createElement("span");
                genreElement.innerText = show.genre;

                var ratingElement = document.createElement("span");
                ratingElement.innerText ="Rating " + show.rating + "/10";


                card.appendChild(imageElement);
                card.appendChild(document.createElement("br"));
                card.appendChild(titleElement);
                card.appendChild(document.createElement("br"));
                card.appendChild(genreElement);
                card.appendChild(document.createElement("br"));
                card.appendChild(ratingElement);


                card.addEventListener("click", function () {
                    localStorage.setItem("showId", show.showId);
                    window.location.replace("movie");
                });
                return card;
            }


            document.addEventListener('DOMContentLoaded', function () {
                toggleLoginLogout();
            });

            var isAuthenticated;

            function toggleLoginLogout() {
                var token = localStorage.getItem('token');

                if (token) {
                    document.getElementById("loginButton").style.display = "none";
                    isAuthenticated = true;

                } else {
                    document.getElementById("logout").style.display = "none";
                    isAuthenticated = false;
                }
            }

            function performLogout() {
                if (isAuthenticated) {
                    localStorage.clear();
                    sessionStorage.clear();
                    window.location.replace("home");
                    document.getElementById("logout").style.display = "none";

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
    </head>

    <body>
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light ">
            <a class="navbar-brand" href="home"> <img src="/movie/logo1.png" alt="Logo" height="40"> </a>
            <span style="font-size:20px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span>
            <!-- Search Bar -->
            <form class="form-inline my-2 my-lg-0 mx-auto">
                <input class="form-control mr-sm-2 " id="search-input" type="search" placeholder="Movie Name" aria-label="Search">
                <i type="button" class="fas fa-search" aria-hidden="true" onclick="searchByName()"></i>
                <!-- <button class="btn searchbutton  my-2 my-sm-0" type="submit" onclick="searchByName()">Search</button> -->
            </form>

            <div class="loginbtn" id="loginButtonContainer">
                <button id="loginButton" class="btn mr-2" onclick="performLogout()">Login</button>
            </div>

            <div id="myNav" class="overlay left">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <i style="font-size:40px;color:lightblue;text-shadow:2px 2px 4px #000000;margin-left: 15px;"> <img
                        src="/movie/logo1.png" alt="Logo" height="40"> </i>
                <div class="overlay-content">
                    <a href="#">About</a>
                    <a type="button" href="userbookings">Bookings</a>
                    <a href="#">Help & Support</a>
                    <a href="#">Contact</a>
                    <a href="#" id="logout" onclick="performLogout()">Logout</a>

                </div>
            </div>
            <!-- <span style="font-size:30px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span> -->
            <button onclick="goBack()" type="button" class="btn">Back</button>

        </nav>


        <div id="showContainer">
        </div>

        <div id="showcard">
            <h3 style="font-weight: bold;">Choose Another Movie</h3>
            <div id="othermovies">


            </div>
        </div>
    </body>

    </html>