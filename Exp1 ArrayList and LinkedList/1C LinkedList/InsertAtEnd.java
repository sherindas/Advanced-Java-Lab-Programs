// 3. Write a Java program to insert the specified element at the end of a linked list
// (using l_listobj.offerLast("Pink"))

package linkedlist;

import java.util.LinkedList;

public class InsertAtEnd {
    public static void main(String[] args) {
        LinkedList<String> colors = new LinkedList<>();
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");

        System.out.println("Before insertion: " + colors);
        colors.offerLast("Pink"); // add at the end
        System.out.println("After inserting 'Pink' at the end: " + colors);
    }
}
