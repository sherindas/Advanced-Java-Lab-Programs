// 1. Write a java program for getting different colors through ArrayList interface 
// and search whether the color "Red" is available or not

package arraylist;

import java.util.ArrayList;

public class ColorSearch {
    public static void main(String[] args) {
        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");

        System.out.println("Colors: " + colors);

        if (colors.contains("Red")) {
            System.out.println("Color 'Red' is available in the list.");
        } else {
            System.out.println("Color 'Red' is not available in the list.");
        }
    }
}
