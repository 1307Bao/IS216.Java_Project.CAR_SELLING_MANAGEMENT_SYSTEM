package com.view.form;

import com.model.ModelCar;
import com.view.admin_component.MenuSanPham;
import com.view.admin_component.SPForm;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import net.miginfocom.swing.MigLayout;

public class AdminSPForm extends javax.swing.JPanel {

    private MigLayout layout;
    private MenuSanPham menu;
    private SPForm form;
    private MainForm main;
    private ArrayList<ModelCar> lcar;
    
    public AdminSPForm(MainForm main) {
        lcar = new ArrayList<ModelCar>();
        this.main = main;
        initComponents();
        init();
        initList();
        initSP();
    }
    
    private void initList(){
        lcar.add(new ModelCar("BMW Roadster", 9, "3000000000", new ImageIcon(getClass().getResource("/com/view/icon/Car1.png"))));
        lcar.add(new ModelCar("BMW 8 Series Gran Coupé", 9, "6900000000", new ImageIcon(getClass().getResource("/com/view/icon/Car2.png"))));
        lcar.add(new ModelCar("BMW i7", 9, "7200000000", new ImageIcon(getClass().getResource("/com/view/icon/Car3.png"))));
        lcar.add(new ModelCar("BMW iX3", 9, "3500000000", new ImageIcon(getClass().getResource("/com/view/icon/Car4.png"))));
        lcar.add(new ModelCar("BMW i4", 9, "6900000000", new ImageIcon(getClass().getResource("/com/view/icon/Car5.png"))));
        lcar.add(new ModelCar("BMW 3 Series", 9, "7200000000", new ImageIcon(getClass().getResource("/com/view/icon/Car6.png"))));
    }

    private void init(){
        layout = new MigLayout("fill, insets 0");
        setLayout(layout);
        form = new SPForm(main);
        menu = new MenuSanPham(main, lcar);
        add(menu, "width 20%, pos 0al 0 n 100%");
        add(form, "width 80%, pos 1al 0 n 100%");
    }
    
    private void initSP(){
        for (int i = 0; i < lcar.size(); i++){
            form.addSP(lcar.get(i));
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setBackground(new java.awt.Color(255, 255, 255));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 636, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 331, Short.MAX_VALUE)
        );
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
