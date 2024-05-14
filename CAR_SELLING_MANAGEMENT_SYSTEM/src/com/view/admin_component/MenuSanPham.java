
package com.view.admin_component;

import com.model.ModelCar;
import com.view.card.AdminInsertUpdateSPCard;
import com.model.ModelMenu;
import com.view.card.AdminBuySPCard;
import com.view.form.MainForm;
import com.view.swing.Button;
import com.view.swing.TextField;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import net.miginfocom.swing.MigLayout;

public class MenuSanPham extends javax.swing.JPanel {
    
    private MigLayout layout;
    private Button cmdAdd;
    private Button cmdBuy;
    private TextField findSP;
    private MainForm main;
    private ArrayList<ModelCar> lcar;
    
    public MenuSanPham(MainForm main, ArrayList<ModelCar> lcar) {
        this.lcar = lcar;
        this.main = main;
        initComponents();
        init();
    }
    
    private void init() {
        layout = new MigLayout("wrap", "push[CENTER]push", "push[]10[]25[]25[]10[]push");
        panel.setLayout(layout);
        cmdAdd = new Button();
        cmdAdd.setText("Thêm sản phẩm");
        cmdAdd.setFont(new java.awt.Font("sansserif", 0, 13));
        cmdAdd.setForeground(new Color(255, 255, 255));
        cmdAdd.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                main.showForm(new AdminInsertUpdateSPCard(null, main));
            }
            
        });
        cmdAdd.setIcon(new ImageIcon(getClass().getResource("/com/view/icon/+.png")));
        panel.add(cmdAdd, "w 75%");
        
        cmdBuy = new Button();
        cmdBuy.setText("Mua xe");
        cmdBuy.setFont(new java.awt.Font("sansserif", 0, 13));
        cmdBuy.setForeground(new Color(255, 255, 255));
        cmdBuy.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                main.showForm(new AdminBuySPCard(main, lcar));
            }
            
        });
        cmdBuy.setIcon(new ImageIcon(getClass().getResource("/com/view/icon/+.png")));
        
        panel.add(cmdBuy, "w 75%");
        
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
