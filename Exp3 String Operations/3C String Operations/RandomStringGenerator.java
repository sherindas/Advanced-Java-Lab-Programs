// Q9. Create a random string of a specified length using user-defined 
//function generateRandomString()

package stringexercises;

import java.util.Random;

public class RandomStringGenerator {
    public static String generateRandomString(int length) {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random rand = new Random();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append(chars.charAt(rand.nextInt(chars.length())));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        int length = 10;
        System.out.println("Generated Random String of length " + length + ": " + generateRandomString(length));
    }
}
