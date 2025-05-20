// 4. Write a Java program to display elements and their positions in a linked list 
// (using l_listobj.get(p))

package linkedlist;

import java.util.LinkedList;

public class DisplayWithPositions {
    public static void main(String[] args) {
        LinkedList<String> colors = new LinkedList<>();
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");

        System.out.println("Displaying elements with their positions:");
        for (int i = 0; i < colors.size(); i++) {
            System.out.println("Position " + i + ": " + colors.get(i));
        }
    }
}
 