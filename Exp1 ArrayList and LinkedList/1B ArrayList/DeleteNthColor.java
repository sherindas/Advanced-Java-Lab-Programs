// 6. Write a java program for getting different colors through ArrayList interface 
// and delete nth element from the ArrayList object by using remove by index

package arraylist;

import java.util.ArrayList;

public class DeleteNthColor {
    public static void main(String[] args) {
        int n = 2; // index to delete

        ArrayList<String> colors = new ArrayList<>();
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");

        System.out.println("Before deletion: " + colors);

        if (n < colors.size()) {
            colors.remove(n);
            System.out.println("Deleted element at index " + n);
        } else {
            System.out.println("Index out of bounds.");
        }

        System.out.println("After deletion: " + colors);
    }
}
