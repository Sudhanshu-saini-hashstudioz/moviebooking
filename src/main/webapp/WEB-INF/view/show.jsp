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
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                transition: 0.5s;

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

            .btn,
            #btn {
                color: black;
                background-color: #dfdfdf;
                border-radius: 10px;
                cursor: pointer;
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

            .show-card {
                /* background-image:; */
                /* background-image: linear-gradient(whitesmoke , rgb(190, 181, 181)); */
                background-color: white;
                border-radius: 15px;
                width: 100%;
                height: 300px;
                margin-top: 5px;
                padding-top: 20px;
                padding-bottom: 20px;
                padding-left: 40px;
                border: 1px solid #ccc;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
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
                position: relative;
                align-items: left;
                justify-items: left;
                margin-top: 20px;
                padding-left: 20px;
            }

            .ticketbtn {
                border-radius: 10px;
                background-color: grey;
                align-items: baseline;
            }

            /* .search {
                margin-left: 62%;
                margin-bottom: 5px;
                display: inline-flex;
                justify-content: center;
                flex-direction: row;
            } */

            .show-card img,
            showcard img {
                margin-top: 2px;
                width: fit-content;
                justify-content: baseline;
                height: 250px;
                object-fit: cover;

            }

            #container {
                display: flex;
                flex-wrap: wrap;
                margin-left: 40px;
                margin-top: 10px;
                justify-content: left;
            }

            .showcards {
                background-color: whitesmoke;
                border-radius: 15px;
                width: calc(20% - 15px);
                margin: 10px;
                border: 1px solid #ccc;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.3);
                text-align: center;
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

                var titleElement = document.createElement("h4");
                titleElement.innerText = show.upcomingShows;

                var ratingElement = document.createElement("h6");
                ratingElement.innerText = " " + show.rating + "/10";

                var ratingIcon = document.createElement("i");
                ratingIcon.className = "fa fa-star";
                ratingIcon.setAttribute("aria-hidden", "true");

                ratingContainer.appendChild(ratingIcon);
                ratingContainer.appendChild(document.createTextNode(" "));
                ratingContainer.appendChild(ratingElement);

                var languageElement = document.createElement("h6");
                languageElement.innerText = show.language;

                var genreElement = document.createElement("h6");
                genreElement.innerText = show.genre;

                var castElement = document.createElement("h6");
                castElement.innerText = show.cast;

                var bookTicketElement = document.createElement("button");
                bookTicketElement.className = "btn ticketbtn"
                bookTicketElement.setAttribute("onclick", "seat()");
                bookTicketElement.innerHTML = "Book Tickets"
                card1.appendChild(imageElement);
                card2.appendChild(titleElement);
                card2.appendChild(ratingContainer);
                card2.appendChild(languageElement);
                card2.appendChild(genreElement);
                card2.appendChild(castElement);
                card2.appendChild(bookTicketElement);

                card.appendChild(card1);
                card.appendChild(card2);
                
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
                window.location.href = "http://localhost:1212/movie/getseat";
                // var numberOfTickets = prompt("Enter the number of tickets:");

                // if (numberOfTickets !== null && !isNaN(numberOfTickets) && numberOfTickets > 0) {
                //     localStorage.setItem("numberOfTickets", numberOfTickets);
                //     window.location.href = "http://localhost:1212/movie/getseat";
                // } else {
                //     alert("Invalid input. Please enter a valid number of tickets.");
                // }
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
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn searchbutton  my-2 my-sm-0" type="submit">Search</button>
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
                    <a type="button" href="getuserbookings">Bookings</a>
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
    </body>

    </html>