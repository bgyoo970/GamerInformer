<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/style.css" rel="stylesheet">
    <title>GamerInsider: What Makes a Game Successful</title>
    
    <!-- CSS Part of the Code -->
    <style>
    h1 {
    	text-decoration: underline;
    	font-size: 40px;
    }
    h2 {
    	text-align: center;
    }
    table.table thead tr th{
    	text-align: center;
    }
    table.table {
    	text-align: center;
    }
    </style>
    
    <!-- JavaScript Code -->
    <script>
	</script>

</head>
<body>
<% 
try {
	String url = "jdbc:mysql://gamesdb.c5afqejilekn.us-east-1.rds.amazonaws.com:3306/GamesDB";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, "amn128", "cookie321");
	Statement stmt = con.createStatement();
	String entity = request.getParameter("gameTitle");
	String str = "SELECT g.Genre, Round(AVG(p.Overall)/AVG(p.Gameplay),1)-1 AS Gameplay, " +
			"Round(AVG(p.Overall)/AVG(p.Story),1)-1 as Story, " +
			"Round(AVG(p.Overall)/AVG(p.Visual),1)-1 as Visual, " +
			"Round(AVG(p.Overall)/AVG(p.Replay),1)-1 as Replay, " +
			"Round(AVG(p.Overall)/AVG(p.Difficulty),1)-1 as Difficulty, " +
			"Round(AVG(p.Overall)/AVG(p.Uniqueness),1)-1 as Uniqueness " +
			"From GamesDB.Genre g, GamesDB.Plays2 p Where g.Genre LIKE p.Genre " +
			"Group By g.Genre";
	
	ResultSet result = stmt.executeQuery(str);
	//boolean isNotEmpty = result.next();	
	
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
	out.print("</div>");
	out.print("</nav>");
	out.print("</div>");
	out.print("</div>");
	out.print("</div>");
	
	
	out.print("<div class=\"container-fluid\">");
	out.print("<div class=\"row\">");
	out.print("<div class=\"col-md-12\">");
	out.print("<h1>Key Elements That Make a Game Successful</h1>");
	out.print("<br>");
	out.print("<p>");
	out.print("There are a vast variety of components that can make up the composition of a good game, whether that be from the written story, how fun the gameplay is, to how the game is aesthetically presented. But, in the end, there are few components that make a game memorable and fun.");
	out.print("</p>");
	out.print("<p>");
	out.print("While a good story may be thought as crucial to a good game, it does not always translate to a fun experience for the player. A game can tell an amazing tale, but may not allow for the game to have room explore and interact. A game should be fully immersive to let the player enjoy themselves how they would like. For a good video game, the gameplay should let the player be in control.");
	out.print("</p>");
	out.print("<p>");
	out.print("A challenge and how unique the experience certainly adds to the experience of the game, but can also detract from the game if taken too far. A game should be challenging and rewarding once the player overcomes the obstacles in the game. However, if the challenges are too difficult and the payoff is not satisfying, it can leave the player frustrated and dissatisfied. A good game should have a good balance between challenge and reward so that the player can still enjoy the game as he progresses.");
	out.print("</p>");
	out.print("<p>");
	out.print("The aesthetics of the game play an important part to delivering the experience to the player. Without a well thought out interface or an environment good enough to immerse the player in, the game would lack in providing a memorable experience to the player. The visual and audio effects are crucial in adding to the games experience and making the game fun for the player.");
	out.print("</p>");
	out.print("<p>");
	out.print("Each aspect of the game does play an important role into making a game successful. However, the genre has an important influence to what aspects will be important in making its game successful. Certain aspects to a game genre will certainly play more of a role than other games. For example, a puzzle game would be more focused on the difficulty than a storyline. Or an adventure game would pay much closer attention to the plot than how complex the gameplay might be.");
	out.print("</p>");
	out.print("<h2> Score Correlation </h2>");
	out.print("<table class=\"table\">");
	out.print("<thead>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Genre");
	out.print("</th>");
	out.print("<th>");
	out.print("Gameplay");
	out.print("</th>");
	out.print("<th>");
	out.print("Story");
	out.print("</th>");
	out.print("<th>");
	out.print("Visual");
	out.print("</th>");
	out.print("<th>");
	out.print("Replay");
	out.print("</th>");
	out.print("<th>");
	out.print("Difficulty");
	out.print("</th>");
	out.print("<th>");
	out.print("Uniqueness");
	out.print("</th>");
	out.print("</tr>");
	out.print("</thead>");
	out.print("<tbody>");
    while(result.next())
    {
    	out.print("<tr>");
    	out.print("<td>");
    	out.print(result.getString("Genre"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("Gameplay"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("Story"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("Visual"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("Replay"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("Difficulty"));
		out.print("</td>");
		out.print("<td>");
		out.print(result.getString("Uniqueness"));
		out.print("</td>");
		out.print("</tr>");
    }
	out.print("</tbody>");
	out.print("</table>");
	
	out.print("<br>");
	out.print("<p>");
	out.print("But overall, by the data given from a data study, the gameplay and visuals provide the most crucial elements to a game in order to immerse the player in the experience. The table depicts how important each element of a game is to its success, the lower the ratio, the greater its importance.");
	out.print("</p>");
	out.print("<p>");
	out.print("While aesthetics and gameplay are important components to making a game successful, all gamers will have different tastes in genres and games that will define for them what makes a game good. ");
	out.print("</p>");
	out.print("</div>");
	
	out.print("</div>"); //for row
	out.print("</div>"); //for container
	
	out.print("<script src=\"bootstrap/js/jquery.min.js\"></script>");
	out.print("<script src=\"bootstrap/js/bootstrap.min.js\"></script>");
	out.print("<script src=\"bootstrap/js/scripts.js\"></script>");
} catch (Exception e) {}
%>

</body>
</html>