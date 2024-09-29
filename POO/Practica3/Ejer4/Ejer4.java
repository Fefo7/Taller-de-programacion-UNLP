/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejer4;

import PaqueteLectura.Lector;
public class Ejer4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("ingrese las cantidad de habitaciones");
        int Habi = Lector.leerInt();
        Hotel ht = new Hotel(Habi);
        
        for (int i = 0; i < Habi; i++) {
              ht.IngresarCliente(i);
        }
      
        ht.RepresentacionHotel();
        ht.AumentarPrecio(3000);
        ht.RepresentacionHotel();

        
        
        
    }
    
}
