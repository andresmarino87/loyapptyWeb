package loyapptyWeb;

import java.util.*;

public class ArrayComparator implements Comparator <Object> {
	private int columnToSortOn = 1;
	private String dirSortOn = "desc";

	//Constructor takes & stores the column to use for sorting
	public ArrayComparator(int columnToSortOn,String dirSortOn) {
		this.columnToSortOn = columnToSortOn;
		this.dirSortOn = dirSortOn;
	}

	//Return the result of comparing the two row arrays
	public int compare(Object o1, Object o2) {
	//cast the object args back to string arrays
		String[] row1 = (String[])o1;
		String[] row2 = (String[])o2;

	//compare the desired column values & return result
		if(dirSortOn.equals("desc")){
			return row1[columnToSortOn].compareTo(row2[columnToSortOn]);
		}
		else{
			return row2[columnToSortOn].compareTo(row1[columnToSortOn]);
		}
	}
}