/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        System.out.println("Color linea: " + cuad.toString()); 
       
       
        System.out.println("------------ Triangulo ----------- "); 
        
        Triangulo tri = new Triangulo(10,10,10,"Rojo", "Negro"); 
        System.out.println("Representacion del cuadrado: " + tri.toString()); 
        
        System.out.println("------------ Circulo ----------- "); 
        
        Circulo cir = new Circulo(10,"azul", "violeta");
        System.out.println("Representacion del cuadrado: " + cir.toString()); 
        
        
        System.out.println("------------ despintar ----------- "); 
        System.out.println(); 
        tri.despintarFigura();
         System.out.println("Representacion del cuadrado: " + tri.toString()); 
        
    }
    
    
    
}
