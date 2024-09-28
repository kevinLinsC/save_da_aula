/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.teste2_joption;

import java.io.DataInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import javax.swing.JOptionPane;

/**
 *
 * @author k.andrade
 */
public class Teste2_JOption {

    public static void main(String[] args) throws IOException {
        DataInputStream dado;
        String s;
        int[] num = new int[5];
        String[] caminhos = new String[5];
        int i;
        
        for (i = 0; i < num.length; i++) {
            s = JOptionPane.showInputDialog(null, "Entre com o " + (i + 1) + " numero:", "Entrada do numero " + (i + 1), JOptionPane.INFORMATION_MESSAGE);
            try {
                num[i] = Integer.parseInt(s);
            }
            catch (NumberFormatException e) {
                System.out.println("ERRO! Digite somente numeros inteiros.");
                i--;
            }
        }
        
        for (i = 0; i < num.length; i++) {
            caminhos[i] = "C:\\Users\\k.andrade\\Desktop\\tabuada " + (i + 1) + " num " + num[i] + ".txt";
            FileWriter arquivo = new FileWriter(caminhos[i]);
            PrintWriter gravar = new PrintWriter(arquivo);
            
            gravar.printf("Tabuada de " + num[i]);
            gravar.printf("\n------------------------------");
            for (int j = 1; j <= 10; j++) {
                gravar.printf("\n" + num[i] + " x " + j + " = " + (num[i] * j));
            }
            gravar.printf("\n------------------------------");
            arquivo.close();
        }
        
        JOptionPane.showMessageDialog(null, caminhos);
    }
}
