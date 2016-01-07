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
    
    </style>
    
    <!-- JavaScript Code -->
    <script>
		function searchByTitle() {
		    var x = document.getElementById("searchBar").value;
		    document.getElementById("searchBar").value = x;
		}
	</script>
	
  </head>
  <body>
  <%!
	// For java functions
	%>
  
  
<%


try {

	//Create a connection string
	//String url = "jdbc:mysql://your_VM:3306/your_db";
	String url = "jdbc:mysql://gamesdb.c5afqejilekn.us-east-1.rds.amazonaws.com:3306/GamesDB";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");
	
	// Games Table
	Connection con = DriverManager.getConnection(url, "amn128", "cookie321");
	Statement stmt = con.createStatement();
	
	// Get the passed parameters
	String entity = request.getParameter("searchBar");
	String genre = request.getParameter("genreSelect");
	String console = request.getParameter("consoleSelect");
	
	//Make a SELECT query based on passed parameters
	String str = "";
	if ( !(genre.isEmpty() || console.isEmpty()) ) {
		str = "select * " +
				"from Games2 g " +
				"where g.Game REGEXP \"[[:<:]]" +entity+ "[[:>:]]\" " +
				"and g.Genre = \"" +genre+ "\" " +
				"and g.OS = \"" +console+ "\"";
	}
	else if (!genre.isEmpty() && console.isEmpty()) {
		str = "select * " +
				"from Games2 g " +
				"where g.Game REGEXP \"[[:<:]]" +entity+ "[[:>:]]\" " +
				"and g.Genre = \"" +genre+ "\"";
	}
	else if (genre.isEmpty() && !console.isEmpty()) {
		str = "select * " +
				"from Games2 g " +
				"where g.Game REGEXP \"[[:<:]]" +entity+ "[[:>:]]\" " +
				"and g.OS = \"" +console+ "\"";
	}
	else{
		str = "SELECT * FROM " + "Games2 " + "WHERE " + "Game REGEXP \"[[:<:]]" +entity+ "[[:>:]]\"";
	}

	//Run the query against the database.
	ResultSet result = stmt.executeQuery(str);
	boolean isNotEmpty = result.next();
	result.previous();
	
	out.print("<title>GamerInsider: " + entity + " Search Results</title>");
	out.print("<div class=\"container-fluid\">");
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-12\">");
	out.print("<h3> You searched: </h3>");
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
	out.print("<button type=\"submit\" class=\"btn btn-default\" id=\"searchButton\" onclick=\"searchByTitle()\">");
	out.print("Submit");
	out.print("</button>");
	out.print("</form>");
	out.print("<form class=\"navbar-form navbar-right\" role=\"search\" action=\"FrontPage.jsp\">");
	out.print("<button type=\"text\" class=\"btn btn-default\" id=\"homeButton\">");
	out.print("Home");
	out.print("</button>");
	out.print("</form>");
	out.print("</nav>");
	out.print("<table class=\"table\">");
	out.print("<thead>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Game Title");
	out.print("</th>");
	out.print("<th>");
	out.print("Year of Release");
	out.print("</th>");
	out.print("<th>");
	out.print("Score");
	out.print("</th>");
	out.print("</tr>");
	out.print("</thead>");
	out.print("<tbody>");
	if (!isNotEmpty) {
		out.print("<tr>");
    	out.print("<td>");
    	out.print("<i>");
		out.print("No results found for your search: " + entity);
		out.print("</i>");
		out.print("</td>");
		out.print("<td>");
	}
    while(result.next())
    {
    	out.print("<tr>");
    	out.print("<td>");
    	String gameTitle = result.getString("Game");
    	out.print("<a href=\"GameTitlePage.jsp?gameTitle=" + gameTitle + "\">" + gameTitle + "</a>");
    	//out.print("<form action=\"GameTitlePage.jsp\">"); // onClick=\"getGameTitle(this.id)\"
    	//out.print("<button id=\"" + result.getString("Game") + "\" name=\"GameTitle\" type=\"text\" onClick=\"getGameTitle(this.id)\">" + result.getString("Game") + "</button>");		// onClick=store this buttons string value.
    		//out.print("<button id=\"GameTitle\" name=\"GameTitle\" type=\"text\" onClick=\"getGameTitle(this.id)\">" + result.getString("Game") + "</button>");		// onClick=store this buttons string value.
    	//out.print("</form>");
		out.print("</td>");
		out.print("<td>");
			out.print(result.getString("Year"));
		out.print("</td>");
		out.print("<td>");
			out.print(result.getString("Score"));
		out.print("</td>");
		out.print("</tr>");
    }
	out.print("</tbody>");
	out.print("</table>");
	out.print("</div>");
	out.print("</div>");
	out.print("</div>");
	out.print("<script src=\"bootstrap/js/jquery.min.js\"></script>");
	out.print("<script src=\"bootstrap/js/bootstrap.min.js\"></script>");
	out.print("<script src=\"bootstrap/js/scripts.js\"></script>");

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
			<table class="table">
				<thead>
					<tr>
						<th>
							Game Title
						</th>
						<th>
							Release Date
						</th>
						<th>
							Score
						</th>
					</tr>
				</thead>
				<tbody>
				<%%>
					<tr>
						<td>
							<a href="#">Kingdom Hearts</a>
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							9.0
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">Kingdom Hearts: Re:coded</a>
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							8.0
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">Kingdom Hearts HD II.5 ReMIX</a>
						</td>
						<td>
							02/04/2012
						</td>
						<td>
							8.4
						</td>
					</tr>
					<tr>
						<td>
							<a href="#">Kingdom Hearts: Birth by Sleep</a>
						</td>
						<td>
							03/04/2012
						</td>
						<td>
							8.5
						</td>
					</tr>
					<tr >
						<td>
							<a href="#">Kingdom Hearts: Chain of Memories</a>
						</td>
						<td>
							04/04/2012
						</td>
						<td>
							8.0
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
 -->

  </body>
</html>