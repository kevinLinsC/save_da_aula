/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.teste_joptio;

import javax.swing.JOptionPane;

/**
 *
 * @author k.andrade
 */
public class Teste_JOptio {

    public static void main(String[] args) {
        float nota1 = 0;
        float nota2 = 0;
        float media = 0;

        // Pega a primeira nota através de uma caixa de diálogo
        //String inputNota1 = JOptionPane.showInputDialog(null, "Entre com a nota 1:");
        String inputNota1 = JOptionPane.showInputDialog(null, "Entre com a nota 1:", "Entrada de Nota 1", JOptionPane.INFORMATION_MESSAGE);
        nota1 = Float.parseFloat(inputNota1);  // Converte a string recebida para float

        // Pega a segunda nota através de uma caixa de diálogo
        //String inputNota2 = JOptionPane.showInputDialog("Entre com a nota 2:");
        String inputNota2 = JOptionPane.showInputDialog(null, "Entre com a nota 2:", "Entrada de Nota 2", JOptionPane.INFORMATION_MESSAGE);
        nota2 = Float.parseFloat(inputNota2);  // Converte a string recebida para float

        // Calcula a média das notas
        media = (nota1 + nota2) / 2;

        // Exibe o resultado em uma caixa de diálogo
        JOptionPane.showMessageDialog(null, "A média é: " + media);
    }
}
