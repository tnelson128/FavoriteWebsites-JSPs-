/**
 * 
 */
package edu.cvtc.web.comparators;

import java.util.Comparator;

import edu.cvtc.web.model.Movie;

/**
 * @author Tnelson128
 *
 */
public class LengthInMinutesComparator implements Comparator<Movie> {

	@Override
	public int compare (Movie firstMovie, Movie secondMovie)  {
		// TODO Auto-generated method stub
		return firstMovie.getLengthInMinutes().compareTo(secondMovie.getLengthInMinutes());
	}

}
