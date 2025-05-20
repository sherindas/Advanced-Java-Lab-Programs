// 2.b. Develop a Java program to make a Performance Test on StringBuffer and StringBuilder
// for appending the string ‘AIET’ for 10000 times both in the StringBuffer and StringBuilder.
// Justify your answer which one is better.

package stringops;

public class PerformanceTest {
    public static void main(String[] args) {
        int count = 10000;

        // StringBuffer Test
        StringBuffer stringBuffer = new StringBuffer();
        long start1 = System.nanoTime();
        for (int i = 0; i < count; i++) {
            stringBuffer.append("AIET");
        }
        long end1 = System.nanoTime();
        System.out.println("StringBuffer time: " + (end1 - start1) + " ns");

        // StringBuilder Test
        StringBuilder stringBuilder = new StringBuilder();
        long start2 = System.nanoTime();
        for (int i = 0; i < count; i++) {
            stringBuilder.append("AIET");
        }
        long end2 = System.nanoTime();
        System.out.println("StringBuilder time: " + (end2 - start2) + " ns");

        // Justification
        if ((end1 - start1) > (end2 - start2)) {
            System.out.println("StringBuilder is faster than StringBuffer.");
        } else {
            System.out.println("StringBuffer is faster or equal to StringBuilder.");
        }
    }
}
