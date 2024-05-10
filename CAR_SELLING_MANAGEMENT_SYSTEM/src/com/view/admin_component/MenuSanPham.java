
package com.view.admin_component;

import com.model.ModelMenu;
import com.view.swing.Button;
import com.view.swing.TextField;
import java.awt.Color;
import javax.swing.ImageIcon;
import net.miginfocom.swing.MigLayout;

public class MenuSanPham extends javax.swing.JPanel {
    
    private MigLayout layout;
    private Button addSP;
    private TextField findSP;

    public MenuSanPham() {
        initComponents();
        init();
    }
    
    private void init() {
        layout = new MigLayout("wrap", "push[CENTER]push", "push[]10[]25[]10[]push");
        panel.setLayout(layout);
        addSP = new Button();
        addSP.setText("Thêm sản phẩm");
        addSP.setFont(new java.awt.Font("sansserif", 0, 15));
        addSP.setForeground(new Color(255, 255, 255));
        addSP.setIcon(new ImageIcon(getClass().getResource("/com/view/icon/+.png")));
        panel.add(addSP, "w 75%");
        findSP = new TextField();
        findSP.setHint("Tìm kiếm");
        findSP.setPrefixIcon(new ImageIcon(getClass().getResource("/com/view/icon/Finding.png")));
        panel.add(findSP, "w 75%");
        
        listMenu1.setOpaque(false);
        listMenu1.addItem(new ModelMenu("Tất cả"));
        listMenu1.addItem(new ModelMenu("b"));
        listMenu1.addItem(new ModelMenu("bc"));
        listMenu1.addItem(new ModelMenu("d"));
        listMenu1.addItem(new ModelMenu("e"));
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        listMenu1 = new com.view.swing.ListMenu<>();
        panel = new javax.swing.JPanel();

        setBackground(new java.awt.Color(251, 238, 215));

        panel.setOpaque(false);

        javax.swing.GroupLayout panelLayout = new javax.swing.GroupLayout(panel);
        panel.setLayout(panelLayout);
        panelLayout.setHorizontalGroup(
            panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 302, Short.MAX_VALUE)
        );
        panelLayout.setVerticalGroup(
            panelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 105, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(panel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
            .addComponent(listMenu1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addComponent(panel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(listMenu1, javax.swing.GroupLayout.PREFERRED_SIZE, 554, javax.swing.GroupLayout.PREFERRED_SIZE))
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.view.swing.ListMenu<String> listMenu1;
    private javax.swing.JPanel panel;
    // End of variables declaration//GEN-END:variables
}
