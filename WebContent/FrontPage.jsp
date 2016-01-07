<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>GamerInsider: Video Game Reviews, Statistics and Trends</title>

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/style.css" rel="stylesheet">
    
    <!-- CSS Part of the Code -->
    <style>
    	div.container-fluid {}
    	ul.nav li.li_navbar a{
    		color: #d7d7c1;
    	}
    	ul.nav li.li_navbar a:hover {
    		color: #6699ff;
    	}
    	ul.nav li.dropdown a.dropdown-toggle {
    		color: #d7d7c1;
    	}
    	ul.nav li.dropdown a.dropdown-toggle:hover {
    		color: #6699ff;
    	}
    	div.collapse {
    		background: #a60404;
    	}
   		ul {
		    background: #2b2b21;
		    padding: 0px 30px 0px 30px; 
		}
    	li.li_navbar {
    		display: inline;
    		padding: 0px 10px 0px 10px; 
    	}
    	input.form-control {
			border: 0;
      		font-size: 18px;
      		width: 80px;
    	}
    	ol li.mostpopular a {
    		color: #000E6A;
    	}
    	ol li.mostpopular a:hover {
    		text-decoration: underline;
    		font-weight: bold;
    	}
    	img.img-square {
    		width: 160px;
   			height: 110px;
    	}
    	div.col-md-8 div.jumbotron p a.btn {
    		background: #a60404;
    		color: white;
    		font-size: 18px
    	}
    	div.col-md-4 div.jumbotron {
    		padding: 5px 5px 5px 15px; 
    	}
    	div.col-md-4 div.jumbotron p {
    		font-size: 14px;
    	}
    </style>
    
    <!-- JavaScript Code -->
    <script>
		function searchByTitle() {
		    var x = document.getElementById("searchBar").value;
		    document.getElementById("searchBar").value = x;
		    
		}
	</script>

  </head>
  
  
  <!-- Implementation of FrontPage -->
  <body>
  <%


try {
	//Create a connection string
	//String url = "jdbc:mysql://your_VM:3306/your_db";
	String url = "jdbc:mysql://gamesdb.c5afqejilekn.us-east-1.rds.amazonaws.com:3306/GamesDB";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	
	// Top 10 Most popular games table
	Connection con = DriverManager.getConnection(url, "amn128", "cookie321");
	Statement stmt = con.createStatement();
	String str = "SELECT p.GameTitle, COUNT(*) " +
		"FROM GamesDB.Plays2 p " +
		"WHERE EXISTS( " +
			"SELECT * " +
		    "FROM GamesDB.Supported s " +
		    "WHERE p.GameTitle = s.GameTitle" +
		    ")" +
		    "Group BY p.GameTitle Order by Count(*) Desc " +
		    "limit 10";
	ResultSet result = stmt.executeQuery(str);
	//boolean isNotEmpty = result.next();
	//result.previous();
	
	
	out.print("<div class=\"container-fluid\">");
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-12\">");
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-2\">");
	out.print("<img alt=\"Bootstrap Image Preview\" src=\"gilogo.jpg\" class=\"img-square\"/>");
	out.print("</div>");
	out.print("<div class=\"col-md-10\">");
	out.print("<h2><font size=\"16\">");
	out.print("GamerInsider: Video Game Reviews, Statistics and Trends");
	out.print("</h2></font>");
	out.print("</div>");
	out.print("</div>");
	out.print("<nav class=\"navbar navbar-default\" role=\"navigation\">");
				
				
	out.print("<div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">");
	out.print("<form class=\"navbar-form navbar-left\" role=\"search\" action=\"SearchResultsPage.jsp\">");
	out.print("<div class=\"form-group\">");
	out.print("<input type=\"text\" class=\"form-control\" size\"50\" id=\"searchBar\" name=\"searchBar\" placeholder=\"Search Title\">");
	out.print("</div> ");
	
	
	// your stuff goes here
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
	out.print("</div>");
				
	out.print("</nav>");
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-8\">");
	out.print("<div class=\"jumbotron\">");
	out.print("<h2>");
	out.print("PS4 game sales are on an uprise!");
	out.print("</h2>");
	out.print("<p>");
	out.print("With numbers from a market study, Sony manage to overtake its competitors in game console sales during Black Friday and gain the most from the frantic sales over the holiday weekend...");
	out.print("</p>");
	out.print("<p>");
	out.print("<a class=\"btn btn-primary btn-large\" href=\"Trend1.jsp?\">Learn more</a>");
	out.print("</p>");
	out.print("</div>");
	out.print("</div>");
	out.print("<div class=\"col-md-4\">");
	out.print("<h2>");
	out.print("Top 10 Most Popular Games");
	out.print("</h2>");
	out.print("<ol>");
	while(result.next()) {
		out.print("<li class=\"mostpopular\">");
		String gameTitle = result.getString("GameTitle");
    	out.print("<a href=\"GameTitlePage.jsp?gameTitle=" + gameTitle + "\">" + gameTitle + "</a>");
		out.print("</li>");
	}
	out.print("</ol>");
	out.print("</div>");
	out.print("</div>");
	out.print("</div>");
	out.print("</div>");
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-12\">");
	out.print("<h3>");
	out.print("<u>Top Trending Stories</u>");
	out.print("</h3>");
	out.print("</div>");
	out.print("</div>");
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-4\">");
	out.print("<div class=\"jumbotron\">");
	out.print("<h2>");
	out.print("Shooter games continue to be one of the most popular genres");
	out.print("</h2>");
	out.print("<p>");
	out.print("The First-Person Shooter (FPS) is undeniably a popular gaming genre and has been captivating gamers across...");
	out.print("</p>");
	out.print("<p>");
	out.print("<a class=\"btn\" href=\"Trend2.jsp?\">View details</a>");
	out.print("</p>");
	out.print("</div>");
	out.print("</div>");
	out.print("<div class=\"col-md-4\">");
	out.print("<div class=\"jumbotron\">");
	out.print("<h2>");
	out.print("What are the key aspects to a good game?");
	out.print("</h2>");
	out.print("<p>");
	out.print("There are a vast variety of components that can make up the composition of a good game, whether that be from the written story...");
	out.print("</p>");
	out.print("<p>");
	out.print("<a class=\"btn\" href=\"Trend3.jsp?\">View details</a>");
	out.print("</p>");
	out.print("</div>");
	out.print("</div>");
	out.print("<div class=\"col-md-4\">");
	out.print("<div class=\"jumbotron\">");
	out.print("<h2>");
	out.print("Development shift towards mobile gaming");
	out.print("</h2>");
	out.print("<p>");
	out.print("Despite PC having the largest audience in gamers, statistics show that Android application development is become the next place to develop games...");
	out.print("</p>");
	out.print("<p>");
	out.print("<a class=\"btn\" href=\"Trend4.jsp?\">View details</a>");
	out.print("</p>");
	out.print("</div>");
	out.print("</div>");
	out.print("</div>");
	out.print("</div>");

	out.print("<script src=\"bootstrap/js/jquery.min.js\"></script>");
	out.print("<script src=\"bootstrap/js/bootstrap.min.js\"></script>");
	out.print("<script src=\"bootstrap/js/scripts.js\"></script>");
} catch (Exception e) {}
%>
<!--
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
					<img alt="Bootstrap Image Preview" src="http://lorempixel.com/140/140/" class="img-circle"/>
				</div>
				<div class="col-md-10">
					<h2><font size="16">
						GamerInsider: Video Game Reviews, Statistics and Trends
					</h2></font>
				</div>
			</div>
			<nav class="navbar navbar-default" role="navigation">
				
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						
					</ul>
					<form class="navbar-form navbar-right" role="search" action="SearchResultsPage.jsp">
						<div class="form-group">
							<input type="text" size="25" class="form-control" id = "searchBar" name="searchBar" placeholder="Search Title">
						</div> 
						
						<select class="form-control" id="genreSelect" name="genreSelect">
							<option value="">Genre</option>
						    <option value="one">One</option>
						    <option value="two">Two</option>
						    <option value="three">Three</option>
						    <option value="four">Four</option>
						    <option value="five">Five</option>
						</select>
						<select class="form-control" id="consoleSelect" name="consoleSelect">
							<option value="">Console</option>
						    <option value="one">One</option>
						    <option value="two">Two</option>
						    <option value="three">Three</option>
						    <option value="four">Four</option>
						    <option value="five">Five</option>
						</select>
						
						
						<button type="searchButton" class="btn btn-default" id="searchButton" onclick="searchByTitle()">Search</button>
					</form>
				</div>
				
			</nav>
			<div class="row">
				<div class="col-md-8">
					<div class="jumbotron">
						<h2>
							PS4 game sales are on an uprise!
						</h2>
						<p>
							Sony's PlayStation 4 continues to dominate the sales charts going into the console's third year on the market. Recently crossing 30 million units sold, the PS4 is easily outselling its closest competitor..
						</p>
						<p>
							<a class="btn btn-primary btn-large" href="#">Learn more</a>
						</p>
					</div>
				</div>
				<div class="col-md-4">
					<h2>
						Top 10 Most Popular Games
					</h2>
					<ol>
						<li>
							Fallout 4
						</li>
						<li>
							Final Fantasy XVIIXVZXC
						</li>
						<li>
							Call of Duty: Black Ops III
						</li>
						<li>
							Halo 5: Guardians
						</li>
						<li>
							Kingdom Hearts 2
						</li>
						<li>
							League of Legends
						</li>
						<li>
							Okami
						</li>
						<li>
							The Last of Us
						</li>
						<li>
							Legend Of Zelda: Skyward Sword
						</li>
						<li>
							Mario Kart 8
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<h3>
				Top Trending Stories
			</h3> <a href="#" class="btn" type="button">All Stories</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-4">
			<h2>
				Shooter Games continue to be one of the most popular genres
			</h2>
			<p>
				A noticable trend shows that the younger generation of gamers are gravitating towards violent games
			</p>
			<p>
				<a class="btn" href="#">View details</a>
			</p>
		</div>
		<div class="col-md-4">
			<h2>
				Statistics show that games for the Wii and the Wii U are most family friendly!
			</h2>
			<p>
				Wii and Wii U support the largest audience of younger gamers with a large collection of games having an ERSB rating of E.
			</p>
			<p>
				<a class="btn" href="#">View details</a>
			</p>
		</div>
		<div class="col-md-4">
			<h2>
				Development shift towards mobile gaming
			</h2>
			<p>
				Despite PC having the largest audience in gamers, statistics show that Android application development is become the next place to develop games.
			</p>
			<p>
				<a class="btn" href="#">View details</a>
			</p>
		</div>
	</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
    
    -->
  </body>
</html>