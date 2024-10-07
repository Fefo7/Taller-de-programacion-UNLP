/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejer2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Main5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String patenteB;
        Estacionamiento esta = new Estacionamiento(3,3, "autos felices","avellaneda", 8.0, 21.0);
        
        GeneradorAleatorio.iniciar();
        for (int i = 0; i < 6; i++) {
                
                Auto  at = new Auto(GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(8));
                esta.AgregarAuto(at,GeneradorAleatorio.generarInt(3), GeneradorAleatorio.generarInt(3));
            
        }
        
        
        System.out.println(esta.toString());
        System.out.println(esta.obtenerCantXPlaza(1));
        
        System.out.println("\n");
        System.out.println("ingrese una patente");
        patenteB = Lector.leerString();
        System.out.println(esta.obtenerUbicacion(patenteB));
    }
    
}
