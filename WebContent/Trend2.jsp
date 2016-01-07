<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    
        <!-- CSS Part of the Code -->
    <style>
	h1 {
		font-size: 48px;
		text-decoration: underline;
	}
	div.container div.row div.col-md-11 a
	}
	
    </style>
    
    <!-- JavaScript Code -->
    <script>
    
	</script>
    <title>GamerInsider: Shooter Games Rising In Popularity</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
</head>

<body>
  <%

	/**
try {
	String url = "jdbc:mysql://gamesdb.c5afqejilekn.us-east-1.rds.amazonaws.com:3306/GamesDB";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, "amn128", "cookie321");
	Statement stmt = con.createStatement();
	String str = "Select g.Genre, count(*) " +
		"from Plays p, Games g " +
		"where p.GameTitle = g.Game " +
		"group by genre order by count(*) desc " +
		"limit 5";
	ResultSet result = stmt.executeQuery(str);

	out.print("<nav class=\"navbar navbar-default\" role=\"navigation\">");
	out.print("<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">");
	out.print("<form class=\"navbar-form navbar-left\" role=\"search\" action=\"SearchResultsPage.jsp\">");
	out.print("<div class=\"form-group\">");
	out.print("<input type=\"text\" class=\"form-control\" size\"50\" id=\"searchBar\" name=\"searchBar\" placeholder=\"Search Title\">");
	out.print("</div> ");
	out.print("<select class=\"form-control\" id=\"genreSelect\" name=\"genreSelect\">");
	out.print("<option value=\"\">Genre</option>");
	out.print("<option value=\"Action\">Action</option>");
	out.print("<option value=\"Adventure\">Adventure</option>");
	out.print("<option value=\"Fighting\">Fighting</option>");
	out.print("<option value=\"Platformer\">Platformer</option>");
	out.print("<option value=\"RPG\">RPG</option>");
	out.print("<option value=\"Shooter\">Shooter</option>");
	out.print("<option value=\"Strategy\">Strategy</option>");
	out.print("<option value=\"Racing\">Racing</option>");
	out.print("<option value=\"Sports\">Sports</option>");
	out.print("<option value=\"Puzzle\">Puzzle</option>");
	out.print("</select>");
	out.print("<select class=\"form-control\" id=\"consoleSelect\" name=\"consoleSelect\">");
	out.print("<option value=\"\">Console</option>");
	out.print("<option value=\"PlayStation 4\">PS4</option>");
	out.print("<option value=\"Xbox One\">Xbox One</option>");
	out.print("<option value=\"Wii U\">Wii U</option>");
	out.print("<option value=\"PC\">PC</option>");
	out.print("<option value=\"PlayStation 3\">PS3</option>");
	out.print("<option value=\"PlayStation 2\">PS2</option>");
	out.print("<option value=\"Xbox 360\">Xbox 360</option>");
	out.print("<option value=\"Xbox\">Xbox</option>");
	out.print("<option value=\"Wii\">Wii</option>");
	out.print("<option value=\"GameCube\">GameCube</option>");
	out.print("<option value=\"Nintendo 3DS\">Nintendo 3DS</option>");
	out.print("</select>");
	out.print("<button type=\"searchButton\" class=\"btn btn-default\" id=\"searchButton\" onclick=\"searchByTitle()\">Search</button>");
	out.print("</form>");
	out.print("<form class=\"navbar-form navbar-right\" role=\"search\" action=\"FrontPage.jsp\">");
	out.print("<button type=\"text\" class=\"btn btn-default\" id=\"homeButton\">");
	out.print("Home");
	out.print("</button>");
	out.print("</form>");
	out.print("</div>");
	out.print("</nav>");

	out.print("<div class=\"container\">");
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-12 text-left\">");
	out.print("<h>Shooter Games Rising In Popularity</h>");
	out.print("<br /><br />");
	out.print("<p1>");
	out.print("The First-Person Shooter (FPS) is undeniably a popular gaming genre and has been captivating gamers across America since the early 1980\'s. With only about three decades since its appearance, this genre is well represented through countless numbers of games in the market today." +
            	"Though, not until the release of <i>Doom</i>, a science fiction horror-themed FPS shooter, in the year 1993, did the Shooter genre start picking up popularity." +
            	"It was one of the first to utilize 3D animation technology to help depict height and depth differences, light variations, and texture mapping, which made" +
            	"the game remarkably realistic for its time. <i>Doom</i> quickly became of one of the most influential franchises to affect this genre today.");
    out.print("</p1>");
    out.print("<p2><br><br>");
    out.print("Rare's Goldeneye 007 videogame, which was an adaptation of the movie, also because one of the most popular in the shooter genre." +
            	"It's largest appeal came from its successful multiplayer mode where players could verse each other in a match to the death." +
            	"This game was able to sell an impressive eight million copies and is well known to be one of the founding examples for shooters today." +
            	"With the release of new consoles, the shooter genre quickly took off in various different titles.");
    out.print("</p2>");
    out.print("<p3><br><br>");
    out.print("Today, we see that the combined Call of Duty franchise gross has been able to outsell the top 10 grossing films in 2012. " +
				"To put that in perspective, Modern Warfare 3 was able to top the Hollywood release of <i>Avatar</i> in its first week of release with respective numbers of " +
				"$760 million and $775 million. Since 2010, the Call of duty franchise has had a total of 125+ million people play this game. " +
				"It remains clear that the Shooter genre has taken a strong hold in gamers everywhere.");
    out.print("</p3>");
    out.print("</div>");
    out.print("<div class=\"col-md-12 text-center\">");
    out.print("<h2>Most Popular Genres</h2>");
    out.print("<br /><br />");
    out.print("</div>");
    out.print("</div>");

    out.print("<div class=\"row\">");
    out.print("<div class=\"col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1\">");
    out.print("<canvas id=\"BarChart\" height=\"100\" class=\"img-responsive\" ></canvas>");
    out.print("</div>");
    out.print("</div>");
    out.print("<p><font size=2>*Numbers are taken from a sampling pool of ~20,000 people</font></p>");
    out.print("</div>");

    out.print("<script src=\"bootstrap/js/jquery-1.11.1.js\"></script>");
    out.print("<script src=\"bootstrap/js/bootstrap.js\"></script>");
    out.print("<script src=\"bootstrap/js/Chart.js\"></script>");
    out.print("<script>");
    out.print("var barChartData = {"); 
    out.print("labels: [\"Shooter\", \"Adventure\", \"Platformer\", \"Action\", \"RPG\"],");
    out.print("datasets: [ ");
    out.print("{");
    out.print("fillColor: \"rgba(76,194,88,0.5)\"," +
    		"strokeColor: \"rgba(76,194,88,0.8)\"," +
    		"highlightFill: \"rgba(76,194,88,0.75)\"," + 
    		"highlightStroke: \"rgba(76,194,88,1)\",");
    out.print("data: [");
	boolean flag = false;
	String data;
	while(result.next()) {
		if (!flag) {
			data = result.getString("count(*)");
			out.print(data);
			flag = true;
		} else {
			data = result.getString("count(*)");
			out.print(", " + data);
		}
		System.out.println(result.getString("count(*)"));
	}
    out.print("]");
    out.print("}]}");

    out.print("window.onload = function () {");
    out.print("var ctx = document.getElementById(\"BarChart\").getContext(\"2d\");");
    out.print("window.myLine = new Chart(ctx).Bar(barChartData, {");
    out.print("responsive: true");
    out.print("});");
    out.print("};");
    out.print("</script>");

} catch (Exception e) {}
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
                <h1>Shooter Games Rising In Popularity</h1>
                <br /><br />
                <p>
                	The First-Person Shooter (FPS) is undeniably a popular gaming genre and has been captivating gamers across America since the early 1980's.
                	With only about three decades since its appearance, this genre is well represented through countless numbers of games in the market today.
                	Though, not until the release of <i>Doom</i>, a science fiction horror-themed FPS shooter, in the year 1993, did the Shooter genre start picking up popularity.
                	It was one of the first to utilize 3D animation technology to help depict height and depth differences, light variations, and texture mapping, which made
                	the game remarkably realistic for its time. <i>Doom</i> quickly became of one of the most influential franchises to affect this genre today.
                </p>
                <p><br><br>
                	Rare's <i>Goldeneye 007</i> videogame, which was an adaptation of the movie, also because one of the most popular in the shooter genre.
                	It's largest appeal came from its successful multiplayer mode where players could verse each other in a match to the death.
                	This game was able to sell an impressive eight million copies and is well known to be one of the founding examples for shooters today.
                	With the release of new consoles, the shooter genre quickly took off in various different titles.
                </p>
                <p><br><br>
                	Today, we see that the combined <i>Call of Duty</i> franchise gross has been able to outsell the top 10 grossing films in 2012. 
					To put that in perspective, Modern Warfare 3 was able to top the Hollywood release of <i>Avatar</i> in its first week of release with respective numbers of 
					$760 million and $775 million. Since 2010, the <i>Call of Duty</i> franchise has had a total of 125+ million people play this game. 
					It remains clear that the Shooter genre has taken a strong hold in gamers everywhere.
                </p>
            </div>
            <div class="col-md-12 text-center">
                <h2>Most Popular Genres</h2>
                <br /><br />
            </div>
        </div>

        <div class="row">
            <div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                <!--  START -->
              <canvas id="BarChart" height="100" class="img-responsive" ></canvas>
                 <!--  END -->
            </div>
        </div>
        <p><font size=2>*Numbers are taken from a sampling pool of ~20,000 people</font></p>
    </div>


    <!-- REQUIRED SCRIPTS FILES -->
    <script src="bootstrap/js/jquery-1.11.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/Chart.js"></script>
    <script>
        var barChartData = {
            labels: ["Shooter", "Adventure", "Platformer", "Action", "RPG"],
            datasets: [
                {
                    //SET COLORS BELOW
                    fillColor: "rgba(76,194,88,0.5)",
                    strokeColor: "rgba(76,194,88,0.8)",
                    highlightFill: "rgba(76,194,88,0.75)",
                    highlightStroke: "rgba(76,194,88,1)",
                    data: [124, 84, 57, 51, 34] // SET YOUR DATA POINTS HERE
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
