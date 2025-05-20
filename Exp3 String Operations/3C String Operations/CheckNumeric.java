// Q8. Verify if a string contains only numeric characters using 
//user-defined function isNumeric()

package stringexercises;

public class CheckNumeric {
    public static boolean isNumeric(String str) {
        return str.matches("\\d+");
    }

    public static void main(String[] args) {
        String input = "123456";
        System.out.println("Input: " + input);
        System.out.println("Is numeric? " + isNumeric(input));
    }
}
