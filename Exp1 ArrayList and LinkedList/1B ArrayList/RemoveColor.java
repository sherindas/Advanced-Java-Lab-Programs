// 2. Write a java program for getting different colors through ArrayList interface 
// and remove the 2nd element and color "Blue" from the ArrayList

package arraylist;

import java.util.ArrayList;

public class RemoveColor {
    public static void main(String[] args) {
        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");

        System.out.println("Before removing: " + colors);

        // Remove 2nd element (index 1)
        if (colors.size() > 1) {
            colors.remove(1);
        }

        // Remove "Blue" if still present
        colors.remove("Blue");

        System.out.println("After removing: " + colors);
    }
}
