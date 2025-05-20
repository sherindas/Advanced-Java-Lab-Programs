// 2. Write a Java program to iterate a linked list in reverse order 
// (using objlist.descendingIterator())

package linkedlist;

import java.util.LinkedList;
import java.util.Iterator;

public class ReverseIterate {
    public static void main(String[] args) {
        LinkedList<String> colors = new LinkedList<>();
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");

        System.out.println("Original list: " + colors);

        Iterator<String> iterator = colors.descendingIterator();
        System.out.println("Iterating in reverse order:");
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }
}
