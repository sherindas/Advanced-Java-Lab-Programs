// 4. Write a java program for getting different colors through ArrayList interface 
// and sort them using Collections.sort(ArrayListObj)

package arraylist;

import java.util.ArrayList;
import java.util.Collections;

public class SortColors {
    public static void main(String[] args) {
        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");

        System.out.println("Before sorting: " + colors);

        Collections.sort(colors);

        System.out.println("After sorting: " + colors);
    }
}
