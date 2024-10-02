/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejer3;

/**
 *
 * @author Alumno
 */
import tema2.Persona;
public class Main3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona per = new Persona("fede",12345678, 18);
        Trabajador tr = new Trabajador("fede",12345678, 18,"programador");
        
        System.out.println(per.toString());
        System.out.println(tr.toString());

        
        
    }
    
}
