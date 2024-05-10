
package com.view.admin_component;

import com.card.AdminUpdateSPCard;
import com.model.ModelCar;
import com.view.form.MainForm;

public class SanPham extends javax.swing.JPanel {

    private ModelCar model;
    private MainForm main;
    
    public SanPham(ModelCar model, MainForm main) {
        this.main = main;
        this.model = model;
        initComponents();
        init();
    }
    
    private void init(){
        logo.setIcon(model.getXeImg());
        this.tenXe.setText(model.getTenXe());
        this.Gia.setText(model.getGia());
        this.TrangThai.setText(model.getTrangThai());
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        tenXe = new javax.swing.JLabel();
        Gia = new javax.swing.JLabel();
        TrangThai = new javax.swing.JLabel();
        logo = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        cmdUpdate = new com.view.swing.Button();

        setBackground(new java.awt.Color(255, 255, 255));
        setBorder(new javax.swing.border.LineBorder(new java.awt.Color(183, 150, 107), 5, true));

        tenXe.setFont(new java.awt.Font("SansSerif", 1, 13)); // NOI18N
        tenXe.setText("jLabel1");

        Gia.setFont(new java.awt.Font("SansSerif", 1, 11)); // NOI18N
        Gia.setForeground(new java.awt.Color(183, 150, 107));
        Gia.setText("jLabel1");

        TrangThai.setFont(new java.awt.Font("SansSerif", 1, 10)); // NOI18N
        TrangThai.setText("1");

        logo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/view/icon/Car1.png"))); // NOI18N

        jLabel1.setFont(new java.awt.Font("SansSerif", 1, 10)); // NOI18N
        jLabel1.setText("SL:");

        cmdUpdate.setText("+");
        cmdUpdate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdUpdateActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(tenXe)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(Gia)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jLabel1)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(TrangThai)
                .addGap(20, 20, 20)
                .addComponent(cmdUpdate, javax.swing.GroupLayout.PREFERRED_SIZE, 36, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(20, 20, 20))
            .addComponent(logo, javax.swing.GroupLayout.DEFAULT_SIZE, 206, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(0, 0, 0)
                .addComponent(logo, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addComponent(tenXe)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Gia)
                    .addComponent(jLabel1)
                    .addComponent(TrangThai)
                    .addComponent(cmdUpdate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void cmdUpdateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdUpdateActionPerformed
        main.showForm(new AdminUpdateSPCard(model, main));
    }//GEN-LAST:event_cmdUpdateActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Gia;
    private javax.swing.JLabel TrangThai;
    private com.view.swing.Button cmdUpdate;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel logo;
    private javax.swing.JLabel tenXe;
    // End of variables declaration//GEN-END:variables

}
