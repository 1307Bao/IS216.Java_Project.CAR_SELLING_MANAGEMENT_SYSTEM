package com.view.main_frame;

import com.controller.event.EventAdminMenuSelected;
import com.model.ModelMenu;
import com.view.admin_component.HeaderAdmin;
import com.view.admin_component.MenuAdmin;
import com.view.form.AdminHDForm;
import com.view.form.AdminKHForm;
import com.view.form.AdminLSCForm;
import com.view.form.AdminPKForm;
import com.view.form.MainForm;
import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import net.miginfocom.swing.MigLayout;
import org.jdesktop.animation.timing.Animator;
import org.jdesktop.animation.timing.TimingTarget;
import org.jdesktop.animation.timing.TimingTargetAdapter;

public class Main_Staff_Frame extends javax.swing.JFrame {

    private AdminPKForm PKform;
    private AdminLSCForm LSCform;
    private AdminHDForm HDform;
    private AdminKHForm KHform;

    private MenuAdmin menu;
    private HeaderAdmin header;
    private MigLayout layout;
    private Animator animator;
    private MainForm main;
    
    public Main_Staff_Frame() {
        initComponents();
        init();
    }
    
    private void init(){
        main = new MainForm();
        
        layout = new MigLayout("fill", "0[]0[100%, fill]0", "0[fill, top]0");
        bg.setLayout(layout);
        
        menu = new MenuAdmin();
        menu.initItem(new ModelMenu(new ImageIcon(getClass().getResource("/com/view/icon/PK.png")), "    Phụ kiện"));
        menu.initItem(new ModelMenu(new ImageIcon(getClass().getResource("/com/view/icon/LSC.png")), "    Lịch sửa chữa"));
        menu.initItem(new ModelMenu(new ImageIcon(getClass().getResource("/com/view/icon/HD.png")), "    Hóa đơn"));
        menu.initItem(new ModelMenu("Khách hàng"));
        
        header = new HeaderAdmin();
        main.setLayout(new BorderLayout());
        bg.add(menu, "w 0!, spany 2");
        bg.add(header, "h 50!, wrap");
        bg.add(main, "w 100%, h 100%");
        
        PKform = new AdminPKForm(this.main);
        LSCform = new AdminLSCForm(main);
        HDform = new AdminHDForm();
        KHform = new AdminKHForm(main);
        
        menu.addEvent(new EventAdminMenuSelected(){
            @Override
            public void eventSelected(int index) {
                switch(index){
                    case 0: main.showForm(PKform);
                    break;
                    case 1: main.showForm(LSCform);
                    break;
                    case 2: main.showForm(HDform);
                    break;
                    case 3: main.showForm(KHform);
                }
            }
            
        });
        
        main.showForm(new AdminPKForm(main));
        
        TimingTarget target;
        target = new TimingTargetAdapter(){
            @Override
            public void timingEvent(float fraction){
                double width;
                if (menu.isShowMenu()){
                    width = 0 + 170 * (1f - fraction);
                } else {
                    width = 0 + 170 * fraction;
                }
                layout.setComponentConstraints(menu, "w " + width + "!, spany 2");
                menu.revalidate();
            }
            
            public void end() {
                menu.setShowMenu(!menu.isShowMenu());
            }
        };
        
        animator = new Animator(500, target);
        animator.setResolution(0);
        animator.setDeceleration(0.5f);
        animator.setAcceleration(0.5f);
        header.addMenuEvent(new ActionListener(){
            public void actionPerformed(ActionEvent ae){
                if (!animator.isRunning()){
                    animator.start();
                }
            }
        });
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        bg = new javax.swing.JPanel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setPreferredSize(new java.awt.Dimension(1024, 571));

        javax.swing.GroupLayout bgLayout = new javax.swing.GroupLayout(bg);
        bg.setLayout(bgLayout);
        bgLayout.setHorizontalGroup(
            bgLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        bgLayout.setVerticalGroup(
            bgLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bg, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(bg, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Main_Staff_Frame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Main_Staff_Frame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel bg;
    // End of variables declaration//GEN-END:variables
}
