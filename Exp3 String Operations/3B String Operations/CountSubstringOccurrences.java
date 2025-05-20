// Q2. Count how many times a substring appears in a main 
//string using user-defined function countOccurrences()

package stringexercises;

public class CountSubstringOccurrences {
    public static int countOccurrences(String str, String sub) {
        int count = 0;
        int index = 0;
        while ((index = str.indexOf(sub, index)) != -1) {
            count++;
            index += sub.length();
        }
        return count;
    }

    public static void main(String[] args) {
        String str = "AIET is great. AIET is smart.";
        String sub = "AIET";
        System.out.println("Input String: " + str);
        System.out.println("Substring to search: " + sub);
        System.out.println("Occurrences: " + countOccurrences(str, sub));
    }
}
