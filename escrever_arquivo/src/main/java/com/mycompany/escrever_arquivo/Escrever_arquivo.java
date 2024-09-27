/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.escrever_arquivo;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Scanner;

/**
 *
 * @author k.andrade
 */
public class Escrever_arquivo {

    public static void main(String[] args) throws IOException {
        String nomeArquivo;
        int valorUsuario;
        Scanner sc = new Scanner(System.in);
        Date date = new Date();
        
        System.out.print("Informe o nome do arquivo: ");
        nomeArquivo = sc.next();    
        sc.nextLine();
        
        System.out.print("\nInforme um valor: ");
        valorUsuario = sc.nextInt();
        sc.nextLine();
        
        FileWriter arquivo = new FileWriter("C:\\Users\\k.andrade\\Desktop\\" + nomeArquivo + ".txt");
        PrintWriter gravar = new PrintWriter(arquivo);
        
        gravar.printf("Tabuada do " + valorUsuario + " | " + date + "\n");
        gravar.printf("------------------");
        
        for (int i = 1; i <= 10; i++) {
            gravar.printf("\n" + i + " x " + valorUsuario + " = " + (i * valorUsuario));
        }
        
        gravar.printf("\n------------------");
        arquivo.close();
    }
}
