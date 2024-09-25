/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Practica3.Ejer3;

import PaqueteLectura.Lector;

public class Ejer3 {

    public static void main(String[] args) {
        Estante unEstante = new Estante();
        while (!unEstante.EstaLleno()) {
            System.out.println("Ingrese el titulo");
            String titulo = Lector.leerString();
            System.out.println("Ingrese el autor");
            String autor = Lector.leerString();
            Libro unLibro = new Libro(titulo, autor);
            unEstante.AgregarLibro(unLibro);
        }
        if (unEstante.BuscarLibro("Mujercitas") != null) {
            System.out.println(unEstante.BuscarLibro("Mujercitas").getAutor());
            
        } else {
            
            System.out.println("no se encontro el Libro con ese titulo");
        }
    }

}
