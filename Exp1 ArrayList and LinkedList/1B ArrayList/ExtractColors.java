// 5. Write a java program for getting different colors through ArrayList interface 
// and extract the elements 1st and 2nd from the ArrayList object by using subList()

package arraylist;

import java.util.ArrayList;
import java.util.List;

public class ExtractColors {
    public static void main(String[] args) {
        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");

        System.out.println("Original list: " + colors);

        List<String> subColors = colors.subList(0, 2); // index 0 and 1
        System.out.println("Extracted sublist (1st and 2nd elements): " + subColors);
    }
}
