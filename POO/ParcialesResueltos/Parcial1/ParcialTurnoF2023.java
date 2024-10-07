/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcialturnof2023;


public class ParcialTurnoF2023 {

   
    public static void main(String[] args) {
        
        Director dir = new Director(30000, "fede", 12345678, 2000, 100000 );
        Empresa em= new Empresa("YPF", "ARG", dir, 3 );
        
        Encargado enca = new Encargado(3, "suipacha", 12345678, 2023 , 50000);
        Encargado enca2 = new Encargado(3, "suipacha", 12345678, 2012 , 50000);
        Encargado enca3 = new Encargado(3, "suipacha", 12345678, 2001 , 50000);
        em.AgregarEncargado(1, enca);
        em.AgregarEncargado(2, enca2);
        //em.AgregarEncargado(3, enca3);
        
        System.out.println(em.toString());
          
    }
    
}
