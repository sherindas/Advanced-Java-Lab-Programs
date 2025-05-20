// Q5. Eliminate all whitespace characters from a string using user-defined function removeWhitespace()

package stringexercises;

public class RemoveWhitespace {
    public static String removeWhitespace(String str) {
        return str.replaceAll("\\s+", "");
    }

    public static void main(String[] args) {
        String input = " A I E T  M a n g a l o r e ";
        System.out.println("Before removing whitespace: \"" + input + "\"");
        System.out.println("After removing whitespace: \"" + removeWhitespace(input) + "\"");
    }
}
