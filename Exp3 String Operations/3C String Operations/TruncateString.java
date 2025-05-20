// Q7. Shorten a string to a specified length and add ellipsis 
//using user-defined function truncate()

package stringexercises;

public class TruncateString {
    public static String truncate(String str, int length) {
        return str.length() <= length ? str : str.substring(0, length) + "...";
    }

    public static void main(String[] args) {
        String input = "This is a very long sentence about Java.";
        System.out.println("Before: " + input);
        System.out.println("After: " + truncate(input, 20));
    }
}
