/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Practica3.Ejer3;

/**
 *
 * @author Usuario
 */
public class Estante {
    private int Diml= 0;
    private final int Dimf = 20;
    private Libro[] libros = new Libro[Dimf];

    public Estante() {
    }
    
    public int CantidaLibros()
    {
        return this.Diml;
    }
    public boolean EstaLleno()
    {
        return this.Diml == this.Dimf;
    }
    public Libro BuscarLibro(String Titulo)
    {
        for (int i = 0; i < Diml; i++) {
            if(libros[i].getTitulo().equals(Titulo))
            {
                return libros[i];
            }
        }
        return null;
    }
    public void AgregarLibro(Libro libro) {
    if (!EstaLleno()) {
        libros[Diml] = libro;
        Diml++;
    } else {
        System.out.println("El estante está lleno.");
    }
}
     
    
    
    
}
