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
    <title>GamerInsider: Game Devs Go Toward Mobile Apps</title>
    
    <!-- CSS Part of the Code -->
    <style>
    h1 {
    	text-decoration: underline;
    	font-size: 40px;
    }
    h2 {
    	text-align: left;
    }
    table.table {
    	text-align: left;
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
	// Games2 Table
	Connection con = DriverManager.getConnection(url, "amn128", "cookie321");
	Statement stmt = con.createStatement();
	String entity = request.getParameter("gameTitle");
	String str = "select OS, count(*) from " + "Games2 " + "group by OS order by count(*) desc";
	/* To find OS/count(*). Will find number of Consoles owned by populace
	Select OS, count(*)
	from Owns
	group by OS order by count(*) desc
	*/
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
	out.print("<h1>Game Developers Shift Their Attention to Mobile Apps</h1>");
	out.print("<br>");
	out.print("<p>");
	out.print("The question of, \"which platform should I build an application for?\" , has had a constant debate for application and game developers alike. Many factors are taken into consideration, such as the demographics, the revenue models, release cycles, development ease and capability, and the in-pocket costs of development itself. With the release of smartphones, game developers have taken their move to the mobile market as virtually all of the public is gravitating towards the new technology shift. However, smartphones are a relatively new invention compared to the releases of gaming consoles, which have been around for decades longer. As shown, the older generation is displayed with a vast collection of game titles compared to the new gen consoles and OS.");
	out.print("</p>");
	out.print("<h2> Number of Titles Available per Console </h2>");
	out.print("<table class=\"table\">");
	out.print("<thead>");
	out.print("<tr>");
	out.print("<th>");
	out.print("Console");
	out.print("</th>");
	out.print("<th>");
	out.print("Number of Titles");
	out.print("</th>");
	out.print("</tr>");
	out.print("</thead>");
	out.print("<tbody>");
    while(result.next())
    {
    	out.print("<tr>");
    	out.print("<td>");
    	out.print(result.getString("OS"));
		out.print("</td>");
		out.print("<td>");
			out.print(result.getString("count(*)"));
		out.print("</td>");
		out.print("</tr>");
    }
	out.print("</tbody>");
	out.print("</table>");
	out.print("</div>");
	
	out.print("</div>"); //for row
	out.print("</div>"); //for container
	
	out.print("<script src=\"bootstrap/js/jquery.min.js\"></script>");
	out.print("<script src=\"bootstrap/js/bootstrap.min.js\"></script>");
	out.print("<script src=\"bootstrap/js/scripts.js\"></script>");
} catch (Exception e) {}
	%>
	
	<div class="container">
        <div class="row">
        	<div class="col-md-11 text-left">
                <h1>The Shift Toward Mobile Development</h1>
                <br />
                <p>
                	Despite this fact, it is only natural for older generations to hold a larger collection than newer generations since development on the new consoles/OS 
                	will take time to develop its titles. Smartphones are becoming such an integral part of our everyday lives and it's worth considering developing on the 
                	Android or iOS. A randomized sample of the populace shows how many people own what gaming console or smartphone OS and a noticeable amount are shown to own 
                	iOS devices. According to <i>Time</i>  magazine,  the quantity of apps are still generally equivalent, however the ease of programming (in XCode against Java), 
                	more friendly UX, and a more lucrative app market has development pointing towards the iOS.
                </p>
            </div>
         </div>
         <div class="row">
         	<div class="col-md-12 text-center">
                <h2>Consoles Owned by Sample Populace</h2>
                <br /><br />
            </div>
            <div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                <!--  START -->
              <canvas id="BarChart" height="100" class="img-responsive" ></canvas>
                 <!--  END -->
            </div>
        </div>
        <p><font size=2>*Numbers are taken from a sampling pool of ~20,000 people</font></p>
        <br /><br />
    </div>


    <!-- REQUIRED SCRIPTS FILES -->
    <script src="bootstrap/js/jquery-1.11.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    <script src="bootstrap/js/Chart.js"></script>
    <script>
        var barChartData = {
            labels: ["iPhone", "PlayStation 4", "PC", "Wii U", "Android", "Xbox 360"],
            datasets: [
                {
                    //SET COLORS BELOW
                    fillColor: "rgba(76,194,88,0.5)",
                    strokeColor: "rgba(76,194,88,0.8)",
                    highlightFill: "rgba(76,194,88,0.75)",
                    highlightStroke: "rgba(76,194,88,1)",
                    data: [199, 132, 69, 59, 50, 43] // SET YOUR DATA POINTS HERE
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