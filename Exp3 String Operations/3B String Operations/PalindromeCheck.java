// Q4. Check if a string is a palindrome (ignoring case and punctuation) using user-defined function isPalindrome()

package stringexercises;

public class PalindromeCheck {
    public static boolean isPalindrome(String str) {
        String cleaned = str.replaceAll("[^a-zA-Z0-9]", "").toLowerCase();
        return cleaned.equals(new StringBuilder(cleaned).reverse().toString());
    }

    public static void main(String[] args) {
        String input = "Madam, in Eden I'm Adam";
        System.out.println("Input: " + input);
        System.out.println("Is palindrome? " + isPalindrome(input));
    }
}
