package edu.cvtc.web.comparators;

import java.util.Comparator;

import edu.cvtc.web.model.Movie;

public class TitleComparator implements Comparator<Movie> {

	@Override
	public int compare(Movie firstMove, Movie secondMovie) {
		return firstMove.getTitle().compareTo(secondMovie.getTitle());
	}

}
