/*
5d. Develop a Swing program in Java to create a Tabbed Pan of Cyan, Magenta and Yellow and
display the concerned color whenever the specific tab is selected in the Pan.
*/

package Swings;

import javax.swing.*;
import java.awt.*;

public class ColorTabbedPane {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Color Tabbed Pane");
        frame.setSize(400, 300);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // Create tabbed pane
        JTabbedPane tabbedPane = new JTabbedPane();

        // Create panels with background colors
        JPanel cyanPanel = new JPanel();
        cyanPanel.setBackground(Color.CYAN);

        JPanel magentaPanel = new JPanel();
        magentaPanel.setBackground(Color.MAGENTA);

        JPanel yellowPanel = new JPanel();
        yellowPanel.setBackground(Color.YELLOW);

        // Add panels to tabbed pane
        tabbedPane.addTab("Cyan", cyanPanel);
        tabbedPane.addTab("Magenta", magentaPanel);
        tabbedPane.addTab("Yellow", yellowPanel);

        frame.add(tabbedPane);
        frame.setVisible(true);
    }
}
