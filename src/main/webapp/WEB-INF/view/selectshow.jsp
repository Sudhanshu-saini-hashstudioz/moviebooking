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
                background-color: oldlace;
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
                color:maroon;
                display: block;
                transition: 0.1s;
                border-color: grey;
                border-block: inherit;
            }

            .overlay a:hover,
            .hamburger:hover,
            .overlay a:focus {
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


                border-radius: 15px;
                background: linear-gradient(145deg, #ffffff, #e3dede);
                box-shadow: 7px 7px 8px #656363,
                    -7px -7px 8px #ffffff;

                color:maroon;
                background-color:lavender;
                border-radius: 10px;
                cursor: pointer;

            }

            .btn:hover {
                color: darksalmon;
            }

            .timebtn {
                margin: 10px;
                background-color: white;
                border-color: green;
                color: green;

            }


            .timebtn:hover {
                background-color: green;
                color: white;
            }

            .timeslot {
                margin-top: 4%;
                margin-left: 5%;
            }

            .ticketbtn {
                bottom: 5px;
                align-items: center;
                border-radius: 10px;
                cursor: pointer;
                padding: 10px;
                font-weight: bold;
                color: white;
                background-color: rgb(235, 84, 84);
                border-color: rgb(235, 84, 84);
                position: absolute;
            }


            #loginbutton,
            #logout {}

            .logobtn {
                top: 10px;
                left: 5px;
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
                flex-wrap: nowrap;
                flex-direction: column;
                align-items: flex-start;
                justify-content: left;
                margin-top: 15px;
                margin-left: 30px;
            }

            .theatre{
                display: flex;
                flex-direction: row;
                align-items: baseline;
                margin-bottom: 10px;
                flex-wrap: nowrap;
                margin-top: 10px;
            }
            .head {
                font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                font-weight: bold;
            }

            #container {
                display: flex;
                flex-wrap: nowrap;
                flex-direction: column;
                align-items: flex-start;
                justify-content: left;
            }
        </style>

        </style>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script>

            $(document).ready(function () {

                var name = sessionStorage.getItem("showName");
                $.ajax({
                    url: "http://localhost:1212/api/v1/auth/showtime",
                    type: "GET",
                    contentType: 'application/json; charset=utf-8',
                    data: {
                        name: name
                    },
                    async: false,
                    success: function (response) {

                        var shows = JSON.parse(JSON.stringify(response));
                        populateCard(shows);
                    },
                    error: function (e) {
                        alert("Something Went Wrong:");
                        window.location.replace("http://localhost:1212/movie/home");
                    }
                });

            });



            function createTimeButton(time){
                const button = document.createElement("button");
                button.textContent = time;
                button.classList.add("show-time" , "timebtn");
                return button;
            }



            function organisedTheatres(shows){
                const theatres ={};
                shows.forEach(show => {
                    if(!theatres[show.theatre.theatreName +" , " + show.theatre.city]){
                        theatres[show.theatre.theatreName +" , " + show.theatre.city]=[];
                    }
                    theatres[show.theatre.theatreName +" , " + show.theatre.city].push(show);
                });
                return theatres;
                
            }

            function populateCard(shows){
                var showContainer = document.getElementById("showContainer");
                showContainer.innerHTML = "";

                var divElement = document.createElement("div");
                divElement.className = "timeslot";
                var headElement = document.createElement("h5");
                headElement.innerText = "Select Your Show Time : ";

                showContainer.appendChild(headElement);
                showContainer.appendChild(divElement);

                const theatres = organisedTheatres(shows);

                for(const theatreName in theatres){
                    const theatreDiv = document.createElement("div");
                    theatreDiv.classList.add("theatre");
                    const heading = document.createElement("h6");
                    heading.textContent = theatreName ;
                    theatreDiv.appendChild(heading);

                    theatres[theatreName].forEach(show=>{
                        heading.textContent = theatreName;
                        const button = createTimeButton(show.runningTime);
                        button.onclick = function () {
                        localStorage.setItem("showId", show.showId);
                        seat();
                    }
                        theatreDiv.appendChild(button);
                    });

                    divElement.appendChild(theatreDiv);
                }

            }




            // function populateCard(shows) {
            //     var showContainer = document.getElementById("showContainer");
            //     showContainer.innerHTML = "";
            //     var show = shows[0];

            //     var divElement = document.createElement("div");
            //     divElement.className = "timeslot";

            //     var headElement = document.createElement("h5");
            //     headElement.innerText = "Select Time : ";
                

            //     divElement.appendChild(headElement);

            //     showContainer.appendChild(divElement);

            //     var name ="";

                

            //     shows.forEach(function (show) {

            //         if(name===""){
            //             var theatreElement = document.createElement("div");
            //             theatreElement.className = "theatre";
            //             var theatreName = document.createElement("h6");
            //             theatreElement.appendChild(theatreName);
            //             divElement.appendChild(theatreName);

            //         }

            //         var buttonElement = document.createElement("button");
            //         buttonElement.className = "btn timebtn";
            //         buttonElement.innerText = show.runningTime;
            //         buttonElement.onclick = function () {
            //             localStorage.setItem("showId", show.showId);
            //             seat();
            //         }

            //         if (name === show.theatre.theatreName) {
            //             theatreName = document.getElementById(name);
            //             name = show.theatre.theatreName;
            //             theatreName.innerText = name;
            //             theatreElement.appendChild(buttonElement);
            //         } else {
            //             name = show.theatre.theatreName;
            //             var theatreElement = document.createElement("div");
            //             theatreElement.className = "theatre";
            //             var theatreName = document.createElement("h6");
            //             theatreElement.appendChild(theatreName);
            //             theatreElement.appendChild(buttonElement);

            //             theatreElement.id = name;
            //             theatreName.innerText = name;

            //             divElement.appendChild(theatreElement);
            //         }


            //         // divElement.appendChild(buttonElement);
            //     });


            // }


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

    <body >
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light ">
            <a class="navbar-brand" href="home"> <img src="/movie/logo1.png" alt="Logo" height="40"> </a>
            <span style="font-size:20px;cursor:pointer" class="hamburger" onclick="openNav()">&#9776;</span>
            <!-- Search Bar -->
            <form class="form-inline my-2 my-lg-0 mx-auto">
                <input class="form-control mr-sm-2 city-input" type="search" placeholder="City" aria-label="Search">
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
                    <a type="button" href="userbookings">Bookings</a>
                    <a href="#">Help & Support</a>
                    <a href="#">Contact</a>
                    <a href="#" id="logout" onclick="performLogout()">Logout</a>

                </div>
            </div>
            <button onclick="goBack()" type="button" class="btn">Back</button>

        </nav>


        <div id="showContainer">
            <h5> Select Your Show Time :</h5>
        </div>
    </body>

    </html>