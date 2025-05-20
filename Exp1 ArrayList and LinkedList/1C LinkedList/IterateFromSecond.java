// 1. Write a Java program to iterate through all elements in a linked list starting at the
// specified position (2nd) using iterator 
// (Hint: Iterator iteratorobj = listobj.listIterator(1))

package linkedlist;

import java.util.LinkedList;
import java.util.Iterator;

public class IterateFromSecond {
    public static void main(String[] args) {
        LinkedList<String> colors = new LinkedList<>();
        colors.add("Red");
        colors.add("Blue");
        colors.add("Green");
        colors.add("Yellow");

        System.out.println("Full list: " + colors);

        Iterator<String> iterator = colors.listIterator(1); // starts from index 1 (2nd element)
        System.out.println("Iterating from 2nd element:");
        while (iterator.hasNext()) {
            System.out.println(iterator.next());
        }
    }
}
