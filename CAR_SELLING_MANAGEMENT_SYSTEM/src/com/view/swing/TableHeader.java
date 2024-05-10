package com.view.swing;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import javax.swing.JLabel;

public class TableHeader extends JLabel {
    public TableHeader(String text){
        super.setText(text);
        setOpaque(true);
        setFont(new Font("sansserif", 1, 12));
        setForeground(Color.decode("#5E4421"));
    }
    
    /**
     *
     * @param grphcs
     */
    @Override
    protected void paintComponent(Graphics grphcs) {
        super.paintComponent(grphcs);
        grphcs.setColor(new Color(230, 230, 230));
        grphcs.drawLine(0, getHeight() - 1, getWidth(), getHeight() - 1);
    }
}
