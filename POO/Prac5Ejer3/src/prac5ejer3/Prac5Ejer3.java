/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package prac5ejer3;

/**
 *
 * @author Usuario
 */

   import PaqueteLectura.GeneradorAleatorio;
public class Prac5Ejer3 {

    public static void main(String[] args) {
        Ocasional reciOca = new Ocasional("show de TV","fede", 13, "soda estereo", 10);
        Gira gira = new Gira("locuraaa", 4,"ceratiii", 4);
        
        
        for (int i = 0; i < 10; i++) {
            GeneradorAleatorio.iniciar();
             reciOca.AgregarTema(GeneradorAleatorio.generarString(7));
             
        }
        for (int i = 0; i < 4; i++) {
            GeneradorAleatorio.iniciar();
             gira.AgregarTema(GeneradorAleatorio.generarString(7));
             
        }
        
        for (int i = 0; i < 4; i++) {
            GeneradorAleatorio.iniciar();
            Fecha f = new Fecha("chivilcoy",GeneradorAleatorio.generarInt(31) + 1);
            gira.AgregarFecha(f);
            
        }
        System.out.println("costo de recital ocacional: "+ reciOca.calcularCosto());
         System.out.println(reciOca.Actuar());
         
          System.out.println("costo de la  gira: "+ gira.calcularCosto());
         System.out.println(gira.Actuar());
        
    }
    
}
