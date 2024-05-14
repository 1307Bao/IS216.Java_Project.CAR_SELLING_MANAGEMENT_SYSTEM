package com.view.admin_component;

import com.view.card.AdminInsertUpdateSPCard;
import com.view.dialog.SPDialog;
import com.model.ModelCar;
import com.view.form.MainForm;
import raven.glasspanepopup.GlassPanePopup;

public class SanPham extends javax.swing.JPanel {

    private ModelCar model;
    private MainForm main;

    public SanPham(ModelCar model, MainForm main) {
        this.main = main;
        this.model = model;
        initComponents();
        init();
    }

    private void init() {
        GlassPanePopup.install(main.getMainFrame());
        logo.setIcon(model.getXeImg());
        this.tenXe.setText(model.getTenXe());
        this.Gia.setText(model.getGiaBan());
        this.TrangThai.setText(String.valueOf(model.getSoLuong()));
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
        cmdCheck = new com.view.swing.Button();

        setBackground(new java.awt.Color(255, 255, 255));
        setBorder(new javax.swing.border.LineBorder(new java.awt.Color(183, 150, 107), 5, true));
        setMaximumSize(new java.awt.Dimension(243, 213));
        setMinimumSize(new java.awt.Dimension(243, 213));

        tenXe.setFont(new java.awt.Font("SansSerif", 1, 13)); // NOI18N
        tenXe.setText("jLabel1");

        Gia.setFont(new java.awt.Font("SansSerif", 1, 11)); // NOI18N
        Gia.setForeground(new java.awt.Color(183, 150, 107));
        Gia.setText("jLabel1");

        TrangThai.setFont(new java.awt.Font("SansSerif", 1, 10)); // NOI18N
        TrangThai.setText("1");

        logo.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        logo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/view/icon/Car1.png"))); // NOI18N

        jLabel1.setFont(new java.awt.Font("SansSerif", 1, 10)); // NOI18N
        jLabel1.setText("SL:");

        cmdUpdate.setText("+");
        cmdUpdate.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdUpdateActionPerformed(evt);
            }
        });

        cmdCheck.setText("-");
        cmdCheck.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmdCheckActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(5, 5, 5)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(tenXe)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(Gia)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 15, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(TrangThai, javax.swing.GroupLayout.PREFERRED_SIZE, 5, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(63, 63, 63)
                        .addComponent(cmdUpdate, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(cmdCheck, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(16, 16, 16))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addComponent(logo, javax.swing.GroupLayout.PREFERRED_SIZE, 222, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap())))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(logo, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(tenXe)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(11, 11, 11)
                        .addComponent(Gia))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(12, 12, 12)
                        .addComponent(jLabel1))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(12, 12, 12)
                        .addComponent(TrangThai))
                    .addComponent(cmdUpdate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(cmdCheck, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
    }// </editor-fold>//GEN-END:initComponents

    private void cmdUpdateActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdUpdateActionPerformed
        main.showForm(new AdminInsertUpdateSPCard(model, main));
    }//GEN-LAST:event_cmdUpdateActionPerformed

    private void cmdCheckActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmdCheckActionPerformed
        
        SPDialog dia = new SPDialog(model, main);
        GlassPanePopup.showPopup(dia);
    }//GEN-LAST:event_cmdCheckActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Gia;
    private javax.swing.JLabel TrangThai;
    private com.view.swing.Button cmdCheck;
    private com.view.swing.Button cmdUpdate;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel logo;
    private javax.swing.JLabel tenXe;
    // End of variables declaration//GEN-END:variables

}
