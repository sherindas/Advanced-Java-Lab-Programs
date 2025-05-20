/*
1. Develop a Swing program in Java to display a message “Digital Clock is pressed” or “Hour
Glass is pressed” depending upon the JButton with image either Digital Clock or Hour Glass is
pressed by implementing the event handling mechanism with addActionListener().
Text must display below the center of images.
*/

package Swings;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class DigitalClockHourGlassButton {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Digital Clock & Hour Glass Buttons");
        frame.setSize(500, 350);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(new BorderLayout());

        // Load and resize icons
        ImageIcon digitalClockIcon = new ImageIcon("C:\\Users\\LENOVO\\Downloads\\image1.jpg");
        ImageIcon hourGlassIcon = new ImageIcon("C:\\Users\\LENOVO\\Downloads\\image2.jpg");

        Image dImage = digitalClockIcon.getImage().getScaledInstance(100, 100, Image.SCALE_SMOOTH);
        Image hImage = hourGlassIcon.getImage().getScaledInstance(100, 100, Image.SCALE_SMOOTH);

        digitalClockIcon = new ImageIcon(dImage);
        hourGlassIcon = new ImageIcon(hImage);

        // Create buttons with icons
        JButton digitalButton = new JButton(digitalClockIcon);
        JButton hourButton = new JButton(hourGlassIcon);

        // Remove button borders for better appearance
        digitalButton.setBorderPainted(false);
        hourButton.setBorderPainted(false);

        // Panel to hold buttons side by side
        JPanel imagePanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 50, 30));
        imagePanel.add(digitalButton);
        imagePanel.add(hourButton);

        // Label to display the message
        JLabel messageLabel = new JLabel("", JLabel.CENTER);
        messageLabel.setFont(new Font("Arial", Font.BOLD, 16));
        messageLabel.setPreferredSize(new Dimension(frame.getWidth(), 50));

        // Add action listeners
        digitalButton.addActionListener(e -> messageLabel.setText("Digital Clock is pressed"));
        hourButton.addActionListener(e -> messageLabel.setText("Hour Glass is pressed"));

        // Add components to frame
        frame.add(imagePanel, BorderLayout.CENTER);
        frame.add(messageLabel, BorderLayout.SOUTH);

        // Center the frame on screen
        frame.setLocationRelativeTo(null);
        frame.setVisible(true);
    }
}
