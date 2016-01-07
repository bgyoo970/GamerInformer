<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.chart.js"></script>
	<link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
	<title>GamerInsider: Black Friday Popular OS</title>

    <!-- CSS Part of the Code -->
    <style>
    h1 {
		font-size: 48px;
		text-decoration: underline;
	}
    </style>

	<!-- JavaScript Code -->
	<script type="text/javascript">
		$(function(){
			if(!(/^\?noconvert/gi).test(location.search))
				$(".donutchart").donutChart().css("border","solid 1px black");
		});
	</script>

</head>
<body>
	<%
	/*
	Select OS, count(*)
	from Owns
	group by OS order by count(*) desc
	*/
	%>

	<nav class="navbar navbar-default" role="navigation">
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	<form class="navbar-form navbar-left" role="search" action="SearchResultsPage.jsp">
	<div class="form-group">
	<input type="text" class="form-control" size="50" id="searchBar" name="searchBar" placeholder="Search Title">
	</div> 
	<select class="form-control" id="genreSelect" name="genreSelect">
	<option value="">Genre</option>
	<option value="Action">Action</option>
	<option value="Adventure">Adventure</option>
	<option value="Fighting">Fighting</option>
	<option value="Platformer">Platformer</option>
	<option value="RPG">RPG</option>
	<option value="Shooter">Shooter</option>
	<option value="Strategy">Strategy</option>
	<option value="Racing">Racing</option>
	<option value="Sports">Sports</option>
	<option value="Puzzle">Puzzle</option>
	</select>
	<select class="form-control" id="consoleSelect" name="consoleSelect">
	<option value="">Console</option>
	<option value="PlayStation 4">PS4</option>
	<option value="Xbox One">Xbox One</option>
	<option value="Wii U">Wii U</option>
	<option value="PC">PC</option>
	<option value="PlayStation 3">PS3</option>
	<option value="PlayStation 2">PS2</option>
	<option value="Xbox 360">Xbox 360</option>
	<option value="Xbox">Xbox</option>
	<option value="Wii">Wii</option>
	<option value="GameCube">GameCube</option>
	<option value="Nintendo 3DS">Nintendo 3DS</option>
	</select>
	<button type="searchButton" class="btn btn-default" id="searchButton" onclick="searchByTitle()">Search</button>
	</form>
	<form class="navbar-form navbar-right" role="search" action="FrontPage.jsp">
	<button type="text" class="btn btn-default" id="homeButton">
	Home
	</button>
	</form>
	</div> 
	</nav>
    <!-- NAVBAR CODE END -->
    <div class="container">
        <div class="row">
        	<div class="col-md-11 text-left">
				<h1>Sony Dominates Competitors on Black Friday</h1>
				<br />
				<p>
                	With numbers from a market study, Sony manage to overtake its competitors in game console sales during Black Friday and gain the most from the frantic sales over
                	the holiday weekend. According to marketing survey by <i>InfoScout</i>, the PlayStation 4 was able to appeal to the mass as it favors both the younger audience
                	(ages 18-35) and the middle-aged consumers (ages 36-55) with the bundles and savings that the new generation console is sold with.
                </p>
                <p><br>
                	Additionally, with Sony's week early release on it's <i>Uncharted: The Nathan Drake Collection</i> sale bundle, the PlayStation 4 was able to get a head start on sales
                	which added to the general craze of low prices gaming consoles. Savings went from $350 to as low as $289.99 for a 500 GB memory space. The low prices made a fair appeal
                	to the general populace as Microsoft enforced their <i>Rise of the Tomb Raider</i> bundle with the Xbox One at their standard price of $349.99. Wii U was able to make
                	a fair sale, with a holiday bundle priced at $249.99 coupled with a 32GB console and a copy of <i>Splatoon</i> and <i>Super Smash Bros.</i>
                </p>
			</div>
        </div>
        <div class="row">
        	<div class="col-md-12 text-center">
                <h2>Black Friday Console Game Sales (Thousands)</h2>
                <br /><br />
            </div>
            <div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                <!--  START -->
              <canvas id="BarChart" height="100" class="img-responsive" ></canvas>
                 <!--  END -->
            </div>
        </div>
        <div class="row">
        	<div class="col-md-11 text-left">
        	<br>
				<p>
                	However, it is surprising that the console was able to do so well despite its lack of console exclusive titles. With the recent release of the two major console 
                	exclusive games, <i>Halo 5: Rise of the Guardians</i> and <i>Rise of the Tomb Raider</i>, Xbox One sales are projected to rise within for coming holidays 
                	of the next month. Speculation suggests the reason behind these significant sales can be attributed towards the strong marketing campaign recommending the 
                	gaming audience to turn to the PlayStation 4 for a popular release: <i>Star War Battlefront</i>, despite its multi-platform availability. While, on the normal
                	shopping day, Sony and Microsoft hold roughly equal sales for gaming consoles. However, for the recent sales from Black Friday, it is clear that PS4 reaped the
                	favor of consumers that day.rt
                </p>
			</div>
        </div>
    </div>

 <!-- REQUIRED SCRIPTS FILES -->
    <script src="bootstrap/js/jquery-1.11.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/Chart.js"></script>
    <script>
    var barChartData = {
        labels: ["PS4", "Xbox One", "Wii U"],
        datasets: [
            {
                //SET COLORS BELOW
                fillColor: "rgba(0,12,160,0.5)",
                strokeColor: "rgba(0,32,160,0.5)",
                highlightFill: "rgba(76,194,88,0.75)",
                highlightStroke: "rgba(76,194,88,1)",
                data: [132, 32, 59] // SET YOUR DATA POINTS HERE
            }
        ]

    }

    window.onload = function () {
        var ctx = document.getElementById("BarChart").getContext("2d");
        window.myLine = new Chart(ctx).Bar(barChartData, {
            responsive: true
        });
    };
    </script>

</body>
</html>
