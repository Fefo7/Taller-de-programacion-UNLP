/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Ejer2;

/**
 *
 * @author Usuario
 */
public class Main5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador jg = new Jugador(2, 10, "fede", 40000, 2);
        Entrenador ent = new Entrenador(2,"seba", 100000, 1);
        
        System.out.println(jg.toString());
        System.out.println();
        System.out.println(ent.toString());
        
    }
    
}
