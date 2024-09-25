/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Practica3;
import PaqueteLectura.Lector;

public class Ejer1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       Triangulo trian = new Triangulo();
       System.out.println("lado 1");
       trian.setLado1(Lector.leerDouble());
       System.out.println("lado 2");
       trian.setLado2(Lector.leerDouble());
       System.out.println("lado 3");
       trian.setLado3(Lector.leerDouble());
       System.out.println("color de relleno");
       trian.setColorRelleno(Lector.leerString());
       System.out.println("color de linea");
       trian.setColorLinea(Lector.leerString());
       
       
       System.out.println("Perimetro: "+trian.getPerimetro());
       System.out.println("Area: " + trian.getArea());


    }
    
}
