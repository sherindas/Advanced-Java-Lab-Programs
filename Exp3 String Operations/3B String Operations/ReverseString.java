// Q3. Reverse the characters in a string using user-defined 
//function reverseString()

package stringexercises;

public class ReverseString {
    public static String reverseString(String str) {
        return new StringBuilder(str).reverse().toString();
    }

    public static void main(String[] args) {
        String str = "AIET";
        System.out.println("Before reverse: " + str);
        System.out.println("After reverse: " + reverseString(str));
    }
}
