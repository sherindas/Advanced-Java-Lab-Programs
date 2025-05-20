// 2.a. Develop a Java program for performing various string operations with different string
// handling functions directed as follows:
// String Creation and Basic Operations, Length and Character Access, String Comparison,
// String Searching, Substring Operations, String Modification, Whitespace Handling,
// String Concatenation, String Splitting, StringBuilder Demo, String Formatting,
// Validate Email with contains(), startsWith() and endsWith()

package stringops;

public class StringOperations {
    public static void main(String[] args) {
        // String Creation and Basic Operations
        String str = " Hello, AIET Students! ";
        System.out.println("Original String: \"" + str + "\"");

        // Length and Character Access
        System.out.println("Length: " + str.length());
        System.out.println("Character at index 7: " + str.charAt(7));

        // String Comparison
        String s1 = "AIET";
        String s2 = "AIET";
        String s3 = "aiet";
        System.out.println("s1 equals s2: " + s1.equals(s2));
        System.out.println("s1 equalsIgnoreCase s3: " + s1.equalsIgnoreCase(s3));

        // String Searching
        System.out.println("Index of 'AIET': " + str.indexOf("AIET"));
        System.out.println("Contains 'Students': " + str.contains("Students"));

        // Substring Operations
        System.out.println("Substring (7 to 11): " + str.substring(7, 11));

        // String Modification
        System.out.println("Replace 'AIET' with 'Java': " + str.replace("AIET", "Java"));

        // Whitespace Handling
        System.out.println("Trimmed String: \"" + str.trim() + "\"");

        // String Concatenation
        String greet = "Welcome ";
        String name = "AIET";
        System.out.println("Concatenation: " + greet.concat(name));

        // String Splitting
        String sentence = "Java is fun and powerful";
        String[] words = sentence.split(" ");
        System.out.println("Split words:");
        for (String word : words) {
            System.out.println(word);
        }

        // StringBuilder Demo
        StringBuilder sb = new StringBuilder("Hello");
        sb.append(" AIET");
        sb.insert(5, ",");
        sb.replace(0, 5, "Hi");
        System.out.println("StringBuilder result: " + sb.toString());

        // String Formatting
        int marks = 95;
        String formatted = String.format("Your score is: %d", marks);
        System.out.println(formatted);

        // Validate Email with contains(), startsWith(), endsWith()
        String email = "student@aiet.edu";
        System.out.println("Email validation:");
        System.out.println("Contains '@': " + email.contains("@"));
        System.out.println("Starts with 'student': " + email.startsWith("student"));
        System.out.println("Ends with '.edu': " + email.endsWith(".edu"));
    }
}
