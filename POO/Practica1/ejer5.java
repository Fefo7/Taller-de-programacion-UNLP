/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */

/**
 *
 * @author Usuario
 */

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class ejer5 {

    /**
     5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
    (con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
    de la comida (2) Precio (3) Ambiente.
    Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
    para cada uno de los aspectos y almacene la información en una estructura. Luego
    imprima la calificación promedio obtenida por cada aspecto.
     */
    public static void main(String[] args) {
        int clientes = 5;
        int aspect =  4;
        int califi[][] = new  int [clientes][aspect];
        int nota;
        
        double[] promedios =  new double[aspect];
         GeneradorAleatorio.iniciar();
        for (int i = 0; i < aspect; i++) {
            promedios[i]= 0;
        }
       
        
        for (int i = 0; i < clientes; i++) {
            for (int j = 0; j < aspect; j++) {
                 //System.out.print("ingrese la calificcaion entre 1 y 10 de " + j);
                 nota = GeneradorAleatorio.generarInt(11) ;
                 califi[i][j] =  nota;
            }
        }
        
        for (int i = 0; i < clientes; i++) {
            for (int j = 0; j < aspect; j++) {
                promedios[j]+= califi[i][j];
            }
            
            
        }
        
        for (int i = 0; i < aspect; i++) {
            promedios[i] = promedios[i] / clientes;
              System.out.println("el promedio de el aspecto "+ i + " es " +  promedios[i]);
        }
        
        
        
    }
    
}
