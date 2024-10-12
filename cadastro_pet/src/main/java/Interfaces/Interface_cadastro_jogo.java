/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package Interfaces;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author k.andrade
 */
public class Interface_cadastro_jogo extends javax.swing.JFrame {

    /**
     * Creates new form Interface_cadastro_jogo
     */
    public Interface_cadastro_jogo() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jlbl_nome_jogo = new javax.swing.JLabel();
        jfield_nome_jogo = new javax.swing.JTextField();
        jfield_genero_jogo = new javax.swing.JTextField();
        jlbl_genero_jogo = new javax.swing.JLabel();
        jfield_preco_jogo = new javax.swing.JTextField();
        jlbl_preco_jogo = new javax.swing.JLabel();
        jbutton_enviar = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jlbl_nome_jogo.setText("Nome jogo:");

        jfield_nome_jogo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jfield_nome_jogoActionPerformed(evt);
            }
        });

        jfield_genero_jogo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jfield_genero_jogoActionPerformed(evt);
            }
        });

        jlbl_genero_jogo.setText("Gênero do jogo:");

        jfield_preco_jogo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jfield_preco_jogoActionPerformed(evt);
            }
        });

        jlbl_preco_jogo.setText("Preço jogo:");

        jbutton_enviar.setText("Enviar");
        jbutton_enviar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jbutton_enviarActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(86, 86, 86)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jfield_preco_jogo, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jlbl_preco_jogo)
                            .addComponent(jfield_genero_jogo, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jlbl_genero_jogo)
                            .addComponent(jfield_nome_jogo, javax.swing.GroupLayout.PREFERRED_SIZE, 300, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jlbl_nome_jogo)))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(200, 200, 200)
                        .addComponent(jbutton_enviar)))
                .addContainerGap(250, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(45, 45, 45)
                .addComponent(jlbl_nome_jogo)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jfield_nome_jogo, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jlbl_genero_jogo)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jfield_genero_jogo, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jlbl_preco_jogo)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jfield_preco_jogo, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(jbutton_enviar)
                .addContainerGap(66, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jfield_nome_jogoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jfield_nome_jogoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jfield_nome_jogoActionPerformed

    private void jfield_genero_jogoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jfield_genero_jogoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jfield_genero_jogoActionPerformed

    private void jfield_preco_jogoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jfield_preco_jogoActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jfield_preco_jogoActionPerformed

    private void jbutton_enviarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jbutton_enviarActionPerformed
        // TODO add your handling code here:
        Connection conexao = null;
        PreparedStatement statement = null;

        String url = "jdbc:mysql://localhost:3306/jogos";
        String usuario = "root";
        String senha = "";

        try {
            conexao = DriverManager.getConnection(url, usuario, senha);
            String sql = "INSERT INTO jogo (nome_jogo, genero_jogo, preco_jogo) VALUES (?, ?, ?)";
            statement = conexao.prepareStatement(sql);
            statement.setString(1, jfield_nome_jogo.getText()); // nome cliente
            statement.setString(2, jfield_genero_jogo.getText()); // nome pet
            statement.setString(3, jfield_preco_jogo.getText()); // cpf cliente
            
            statement.executeUpdate();
            System.out.println("Deu certo aqui.");
        } catch (SQLException ex) {
            //Logger.getLogger(Interface_cadastro_cliente.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Deu esse erro aqui ô: " + ex.getMessage());
        }
    }//GEN-LAST:event_jbutton_enviarActionPerformed

    /**
     * @param args the command line arguments
     */
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
            java.util.logging.Logger.getLogger(Interface_cadastro_jogo.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Interface_cadastro_jogo.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Interface_cadastro_jogo.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Interface_cadastro_jogo.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Interface_cadastro_jogo().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jbutton_enviar;
    private javax.swing.JTextField jfield_genero_jogo;
    private javax.swing.JTextField jfield_nome_jogo;
    private javax.swing.JTextField jfield_preco_jogo;
    private javax.swing.JLabel jlbl_genero_jogo;
    private javax.swing.JLabel jlbl_nome_jogo;
    private javax.swing.JLabel jlbl_preco_jogo;
    // End of variables declaration//GEN-END:variables
}