package com.view.admin_component;

import com.model.ModelCar;

public class SPBuy extends javax.swing.JPanel {

    private ModelCar model;
    
    public SPBuy(ModelCar model) {
        this.model = model;
        initComponents();
        init();
    }
    
    private void init(){
        icon.setIcon(model.getXeImg());
        lbCarName.setText(model.getTenXe());
        lbPrice.setText(model.getGiaBan());
        lbSL.setText("0");
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        icon = new javax.swing.JLabel();
        lbCarName = new javax.swing.JLabel();
        lbPrice = new javax.swing.JLabel();
        lbSL = new javax.swing.JLabel();
        cmdMinus = new com.view.swing.Button();
        cmdPlus = new com.view.swing.Button();

        setBackground(new java.awt.Color(255, 255, 255));
        setBorder(javax.swing.BorderFactory.createMatteBorder(5, 5, 5, 5, new java.awt.Color(183, 150, 107)));

        icon.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        icon.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/view/icon/Car1.png"))); // NOI18N

        lbCarName.setFont(new java.awt.Font("SansSerif", 1, 14)); // NOI18N
        lbCarName.setText("jLabel1");

        lbPrice.setFont(new java.awt.Font("SansSerif", 1, 12)); // NOI18N
        lbPrice.setText("jLabel1");

        lbSL.setFont(new java.awt.Font("SansSerif", 0, 12)); // NOI18N
        lbSL.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        lbSL.setText("1");

        cmdMinus.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/view/icon/GetIn.png"))); // NOI18N
        cmdMinus.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdMinusActionPerformed(evt);
            }
        });

        cmdPlus.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/view/icon/Header.png"))); // NOI18N
        cmdPlus.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdPlusActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(icon)
            .addGroup(layout.createSequentialGroup()
                .addGap(39, 39, 39)
                .addComponent(cmdMinus, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(27, 27, 27)
                .addComponent(lbSL, javax.swing.GroupLayout.PREFERRED_SIZE, 7, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(30, 30, 30)
                .addComponent(cmdPlus, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lbCarName))
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lbPrice))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(icon)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(lbCarName)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(lbPrice)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(cmdMinus, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                        .addComponent(lbSL)
                        .addComponent(cmdPlus, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 1, Short.MAX_VALUE))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void cmdPlusActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdPlusActionPerformed
        int sl = Integer.valueOf(lbSL.getText());
        if (sl + 1 > Integer.valueOf(model.getSoLuong())){
            sl = sl - 1;
        }
        lbSL.setText(String.valueOf(sl + 1));
        
    }//GEN-LAST:event_cmdPlusActionPerformed

    private void cmdMinusActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdMinusActionPerformed
        int sl = Integer.valueOf(lbSL.getText());
        if (sl - 1 < 0){
            sl = 1;
        }
        lbSL.setText(String.valueOf(sl - 1));
    }//GEN-LAST:event_cmdMinusActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.view.swing.Button cmdMinus;
    private com.view.swing.Button cmdPlus;
    private javax.swing.JLabel icon;
    private javax.swing.JLabel lbCarName;
    private javax.swing.JLabel lbPrice;
    private javax.swing.JLabel lbSL;
    // End of variables declaration//GEN-END:variables
}
