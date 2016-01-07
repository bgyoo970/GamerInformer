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

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/style.css" rel="stylesheet">
    
    <!-- CSS Part of the Code -->
    <style>
        h2 {
    		font-size: 48px;
    		font-weight: bold;
    	}
    	h3 {
    		font-size: 36px;
    	}
    	h4 {
    		font-size: 24px;
    		font-weight: bold;
    		color: white;
    	}
    	div.col-md-4 div.jumbotron {
    		background: #a60404; 
    		border: 5px ridge #a60404;
    		padding: 0px 0px 0px 10px;
    	}
    	div.col-md-4 div.jumbotron ul.list-unstyled li {
    		font-size: 22px;
    		padding: 10px 0px 0px 0px;
    		font-weight: bold;
    		color: white;
    		text-align: left;
    	}
    	div.col-md-4 div.jumbotron ul.list-unstyled li.suggestion a{
    		font-size: 18px;
    		padding: 10px 0px 0px 0px;
    		font-weight: bold;
    		color: #cbcbb3;
    		text-align: left;
    	}
    	div.col-md-8 div.jumbotron ul.list-unstyled li {
    		font-size: 20px;
    		padding: 5px 0px 0px 100px;
    		font-weight: bold;
    		color: black;
    		text-align: left;
    	}
    </style>
    
    
    <!-- JavaScript Code -->
    <script>
		function GoToHomePage() {
			window.location = '/FrontPage.jsp';
		}
	</script>
	
	
  </head>
  <body>
<%


try {

	//Create a connection string
	//String url = "jdbc:mysql://your_VM:3306/your_db";
	String url = "jdbc:mysql://gamesdb.c5afqejilekn.us-east-1.rds.amazonaws.com:3306/GamesDB";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	
	// Games Table
	Connection con = DriverManager.getConnection(url, "amn128", "cookie321");
	//Create a SQL statement
	Statement stmt = con.createStatement();
	//Get the selected radio button from the HelloWorld.jsp
	String entity = request.getParameter("gameTitle");
	//Make a SELECT query from the table specified by the 'command' parameter at the HelloWorld.jsp
	String str = "SELECT * FROM " + "Games2 " + "WHERE " + "Game = \"" + entity + "\"";	
	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str);
	boolean isNotEmpty = result.next();									// NOTE: For some reason here. We pull one null entry from our database..
	
	// Plays Table
	Statement stmt2 = con.createStatement();
	String str2 = "SELECT * FROM " + "Plays2 " + "WHERE " + "GameTitle = \"" + entity + "\"";
	ResultSet result2 = stmt2.executeQuery(str2);
	boolean isNotEmpty2 = result2.next();
	
	// Games you might like query
	Statement stmt3 = con.createStatement();
	String str3 = "SELECT * FROM Games2 g WHERE g.Genre IN (select Genre from Games2 g2 where g2.Game = \"" + entity + "\") order by rand() limit 5;";
	ResultSet result3 = stmt3.executeQuery(str3);
	//boolean isNotEmpty3 = result3.next();
	
	out.print("<title>GamerInsider: " + entity + " Results</title>");
	out.print("<div class=\"container-fluid\">");
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-12\">");
	out.print("<nav class=\"navbar navbar-default\" role=\"navigation\">");
	out.print("<form class=\"navbar-form navbar-left\" role=\"search\" action=\"SearchResultsPage.jsp\">");
	out.print("<div class=\"form-group\">");
	out.print("<input type=\"text\" class=\"form-control\" size=\"75\" name=\"searchBar\" id=\"searchBar\" placeholder=\"" + entity + "\">");
	out.print("</div>");
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
	out.print("<button type=\"submit\" class=\"btn btn-default\" id=\"searchButton\" onclick=\"setEmptyValues()\">");
	out.print("Submit");
	out.print("</button>");
	out.print("</form>");
			
	out.print("<form class=\"navbar-form navbar-right\" role=\"button\" action=\"FrontPage.jsp\">");
	out.print("<button type=\"submit\" class=\"btn btn-default\" id=\"homeButton\">");
	out.print("Home");
	out.print("</button>");
	out.print("</form>");
	
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-8\">");
	out.print("<div class=\"jumbotron\">");
	out.print("<h2>");
	out.print(entity);
	out.print("</h2>");
	out.print("<h3>");
	if (isNotEmpty)
		out.print("Score: " + result.getString("Score") + "/10");
	else
		out.print("Score: Not yet rated");
	out.print("</h3>");
	out.print("</div>");
	out.print("</div>");
	out.print("<div class=\"col-md-4\">");
	out.print("<div class=\"jumbotron\">");
	out.print("<ul class=\"list-unstyled\">");
	out.print("<li>");
	out.print("Genre: " + result.getString("Genre"));
	out.print("</li>");
	out.print("<li>");
	out.print("ESRB Rating: " + result.getString("ESRBRating"));
	out.print("</li>");
	out.print("<li>");
	out.print("Year of Release: " + result.getString("Year"));
	out.print("</li>");
	out.print("<li>");
	out.print("MSRP: $" + result.getString("Price"));
	out.print("</li>");
	out.print("</ul>");
	out.print("</div>");
	out.print("</div>");
	out.print("</div>");
	
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-8\">");
	out.print("<div class=\"jumbotron\">");
	out.print("<h3><b> Player Ratings: </b></h3>");
	out.print("<ul class=\"list-unstyled\">");
	if (!isNotEmpty2) {
		out.print("<li>");
		out.print("Pending reviews");
		out.print("</li>");
	}
	else {
		out.print("<li>");
		out.print("Gameplay: " + result2.getString("Gameplay"));
		out.print("</li>");
		out.print("<li>");
		out.print("Story: " + result2.getString("Story"));
		out.print("</li>");
		out.print("<li>");
		out.print("Visual: " + result2.getString("Visual"));
		out.print("</li>");
		out.print("<li>");
		out.print("Replay Value: " + result2.getString("Replay"));
		out.print("</li>");
		out.print("<li>");
		out.print("Difficulty: " + result2.getString("Difficulty"));
		out.print("</li>");
		out.print("<li>");
		out.print("Uniqueness: " + result2.getString("Uniqueness"));
		out.print("</li>");
	}
	out.print("</ul>");
	out.print("</div>");
	out.print("</div>");
	out.print("<div class=\"col-md-4\">");
	out.print("<div class=\"jumbotron\">");
	out.print("<h4>");
	out.print("Games you might like");
	out.print("</h4>");
	out.print("<ul class=\"list-unstyled\">");
	while(result3.next())
    {
		out.print("<li class=\"suggestion\">");
		String gameTitle = result3.getString("Game");
    	out.print("<a href=\"GameTitlePage.jsp?gameTitle=" + gameTitle + "\">" + gameTitle + "</a>");
		out.print("</li>");
    }
	out.print("</ul>");
	out.print("</div>");
	out.print("</div>");
	
    //close the connection.
    con.close();


} catch (Exception e) {
}
%>
<!-- 
    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-default" role="navigation">
				
				
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" size="75" placeholder="Kingdom Hearts">
						</div> 
						<button type="submit" class="btn btn-default">
							Submit
						</button>
					</form>
					
				
			</nav>
			<div class="row">
				<div class="col-md-8">
				<div class="jumbotron">
					<h3>
						Halo 5: Guardians
					</h3>
					<h3>
						Score: 9.2
					</h3>
				</div>
				</div>
				<div class="col-md-4">
				<div class="jumbotron">
					<ul class="list-unstyled">
						<li>
							Genre: Shooter
						</li>
						<li>
							USRB Rating: M
						</li>
						<li>
							Release Date: 2015
						</li>
						<li>
							MSRP: $60
						</li>
					</ul>
				</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<h3>
						h3. Lorem ipsum dolor sit amet.
					</h3>
					<ul class="list-unstyled">
						<li>
							Lorem ipsum dolor sit amet
						</li>
						<li>
							Consectetur adipiscing elit
						</li>
						<li>
							Integer molestie lorem at massa
						</li>
						<li>
							Facilisis in pretium nisl aliquet
						</li>
						<li>
							Nulla volutpat aliquam velit
						</li>
						<li>
							Faucibus porta lacus fringilla vel
						</li>
						<li>
							Aenean sit amet erat nunc
						</li>
						<li>
							Eget porttitor lorem
						</li>
					</ul>
				</div>
				<div class="col-md-4">
					<h3>
						h3. Lorem ipsum dolor sit amet.
					</h3>
					<ul class="list-unstyled">
						<li>
							Lorem ipsum dolor sit amet
						</li>
						<li>
							Consectetur adipiscing elit
						</li>
						<li>
							Integer molestie lorem at massa
						</li>
						<li>
							Facilisis in pretium nisl aliquet
						</li>
						<li>
							Nulla volutpat aliquam velit
						</li>
						<li>
							Faucibus porta lacus fringilla vel
						</li>
						<li>
							Aenean sit amet erat nunc
						</li>
						<li>
							Eget porttitor lorem
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
-->
    <script src="bootstrap/js/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/scripts.js"></script>
  </body>
</html>