package com.dialog;

import com.model.ModelCar;
import com.view.form.AdminSPForm;
import com.view.form.MainForm;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import raven.glasspanepopup.GlassPanePopup;

public class SPDialog extends javax.swing.JPanel {

    private ModelCar model;
    private MainForm main;
    
    public SPDialog(ModelCar model, MainForm main) {
        this.model = model;
        this.main = main;
        setOpaque(false);
        initComponents();
        init();
    }
    
    private void init(){
        lbNameCar.setText(model.getTenXe());
        lbPrice.setText(model.getGia());
        lbDes.setText(model.getDescription());
        lbIcon.setIcon(model.getXeImg());
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        roundPanel1 = new com.view.swing.RoundPanel();
        lbIcon = new javax.swing.JLabel();
        lbNameCar = new javax.swing.JLabel();
        lbPrice = new javax.swing.JLabel();
        lbDes = new javax.swing.JLabel();
        button1 = new com.view.swing.Button();

        setBackground(new java.awt.Color(255, 255, 255));

        jLabel1.setFont(new java.awt.Font("SansSerif", 1, 18)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(94, 68, 33));
        jLabel1.setText("Tên xe:");

        jLabel2.setFont(new java.awt.Font("SansSerif", 1, 18)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(94, 68, 33));
        jLabel2.setText("Giá:");

        jLabel3.setFont(new java.awt.Font("SansSerif", 1, 18)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(94, 68, 33));
        jLabel3.setText("Mô tả: ");

        roundPanel1.setBackground(new java.awt.Color(183, 150, 107));

        lbIcon.setBackground(new java.awt.Color(183, 150, 107));
        lbIcon.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/view/icon/Car1.png"))); // NOI18N

        javax.swing.GroupLayout roundPanel1Layout = new javax.swing.GroupLayout(roundPanel1);
        roundPanel1.setLayout(roundPanel1Layout);
        roundPanel1Layout.setHorizontalGroup(
            roundPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(roundPanel1Layout.createSequentialGroup()
                .addContainerGap(15, Short.MAX_VALUE)
                .addComponent(lbIcon)
                .addContainerGap(15, Short.MAX_VALUE))
        );
        roundPanel1Layout.setVerticalGroup(
            roundPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, roundPanel1Layout.createSequentialGroup()
                .addContainerGap(33, Short.MAX_VALUE)
                .addComponent(lbIcon)
                .addContainerGap(33, Short.MAX_VALUE))
        );

        lbNameCar.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        lbNameCar.setForeground(new java.awt.Color(153, 112, 58));
        lbNameCar.setText("jLabel5");

        lbPrice.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        lbPrice.setForeground(new java.awt.Color(153, 112, 58));
        lbPrice.setText("jLabel5");

        lbDes.setFont(new java.awt.Font("SansSerif", 0, 14)); // NOI18N
        lbDes.setForeground(new java.awt.Color(153, 112, 58));
        lbDes.setText("jLabel5");

        button1.setForeground(new java.awt.Color(255, 255, 255));
        button1.setText("OK");
        button1.setFont(new java.awt.Font("SansSerif", 1, 12)); // NOI18N
        button1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                button1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel2)
                            .addComponent(lbNameCar)
                            .addComponent(lbPrice))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(roundPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(39, 39, 39))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(lbDes))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(250, Short.MAX_VALUE)
                .addComponent(button1, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 250, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1)
                        .addGap(11, 11, 11)
                        .addComponent(lbNameCar)
                        .addGap(27, 27, 27)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lbPrice)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel3))
                    .addComponent(roundPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lbDes)
                .addGap(18, 18, 18)
                .addComponent(button1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(12, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void button1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_button1ActionPerformed
        main.showForm(new AdminSPForm(main));
        GlassPanePopup.closePopupAll();
    }//GEN-LAST:event_button1ActionPerformed

    /**
     *
     * @param g
     */
    protected void paintComponent(Graphics g){
        Graphics2D g2 = (Graphics2D) g;
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setColor(getBackground());
        g2.fillRoundRect(0, 0, getWidth(), getHeight(), 0, 0);
        super.paintComponent(g);
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.view.swing.Button button1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel lbDes;
    private javax.swing.JLabel lbIcon;
    private javax.swing.JLabel lbNameCar;
    private javax.swing.JLabel lbPrice;
    private com.view.swing.RoundPanel roundPanel1;
    // End of variables declaration//GEN-END:variables
}
