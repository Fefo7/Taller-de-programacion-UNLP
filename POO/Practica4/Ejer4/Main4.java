/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Ejer4;

/**
 *
 * @author Usuario
 */
public class Main4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Sistema sis=  new Sistema(2021,3, "La Plata", -34.921, -57.955);
       
      System.out.println(sis.ReporteXMes());
      System.out.println(sis.MaxTemperatura());

       
    }
    
}
