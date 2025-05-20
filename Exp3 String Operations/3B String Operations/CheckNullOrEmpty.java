// Q1. Check if a given string is null or contains only 
//whitespace using user-defined function isNullOrEmpty()

package stringexercises;

public class CheckNullOrEmpty {
    public static boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    public static void main(String[] args) {
        String input = "   ";
        System.out.println("Input: \"" + input + "\"");
        System.out.println("Is null or empty? " + isNullOrEmpty(input));
    }
}
