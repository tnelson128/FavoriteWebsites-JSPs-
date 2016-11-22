<!DOCTYPE html>
<%@page import="edu.cvtc.web.comparators.LengthInMinutesComparator"%>
<%@page import="edu.cvtc.web.comparators.DirectorComparator"%>
<%@page import="edu.cvtc.web.comparators.TitleComparator"%>
<%@page import="java.util.Collections"%>
<%@page import="edu.cvtc.web.comparators.SortBy"%>
<%@page import="java.io.File"%>
<%@page import="edu.cvtc.web.util.WorkbookUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page import="edu.cvtc.web.model.Movie"%>
<%@page import="java.util.List"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Movies</title>

<%@ include file="includes/style.jsp"%>
</head>
<body>
	<div class="container">

		<div class="hero-unit">
			<h1>My Favorite Movies</h1>
		</div>

		<%@ include file="includes/navagation.jsp"%>

		<div class="container">
			<%
				try {

					//These are scriblet tags, anything written in them will be java
					List<Movie> movies = new ArrayList<>();
					final String filePath = session.getServletContext().getRealPath("/assets/Movies.xlsx");

					final File inputFile = new File(filePath);
					movies = WorkbookUtility.retrievePeopleFromWorkbook(inputFile);

					/**
					* Sorts depeding on which sort was called
					*/
					final String sortType = request.getParameter("sort");

					if (null != sortType) {

						switch (sortType) {
						case SortBy.TITLE:
							Collections.sort(movies, new TitleComparator());
							break;
						case SortBy.DIRECTOR:
							Collections.sort(movies, new DirectorComparator());
							break;
						case SortBy.LENGTH:
							Collections.sort(movies, new LengthInMinutesComparator());
							break;
						default:
							break;
						}

					}

					for (final Movie movie : movies) {
						// Create a new HTML div with a <h2> header for the Persons name and a <p> for the details about 
						// that person
			%>
			<div class="span4">
				<h2><%=movie.getTitle()%></h2>
				<p> Directed by <%=movie.getDirector()%>.<br>
					Lasts <%=movie.getLengthInMinutes()%> minutes.
				</p>
			</div>
			<%
				}

				} catch (final Exception pokeball) {
					pokeball.printStackTrace();
			%>
			<h1>
				Error
				</h1>
					<p>Sorry, we were unable to retrieve the list of movies.</p>

					<%
						}
					%>
				
		</div>
		<hr>
		<%@ include file="includes/footer.jsp"%>
	</div>
	<%@ include file="includes/scripts.jsp"%>
</body>
</html>