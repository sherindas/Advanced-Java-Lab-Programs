// Q6. Capitalize the first letter of each word using 
//user-defined function capitalizeWords()

package stringexercises;

public class CapitalizeWords {
    public static String capitalizeWords(String str) {
        String[] words = str.split("\\s+");
        StringBuilder sb = new StringBuilder();
        for (String word : words) {
            sb.append(Character.toUpperCase(word.charAt(0)))
              .append(word.substring(1)).append(" ");
        }
        return sb.toString().trim();
    }

    public static void main(String[] args) {
        String input = "java is powerful";
        System.out.println("Before: " + input);
        System.out.println("After: " + capitalizeWords(input));
    }
}
