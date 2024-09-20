/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */


package tema2;

/**
 *
 * @author Usuario
 */
import PaqueteLectura.Lector;
public class Ejer1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona p ;
        p  = new Persona();
        System.out.println("Ingrese un nombre");
        p.setNombre(Lector.leerString());
        System.out.println("Ingrese una edad");
        p.setEdad(Lector.leerInt());
        System.out.println("Ingrese un DNI");
        p.setDNI(Lector.leerInt());
         
          
        
        System.out.println(p.getNombre());
        System.out.println(p.getEdad());
        System.out.println(p.getDNI());
        
          
          
        
          
        
    }
    
}
