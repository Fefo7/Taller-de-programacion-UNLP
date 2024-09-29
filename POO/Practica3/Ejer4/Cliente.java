/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejer4;

/**
 *
 * @author alumnos
 */
public class Cliente {
    private String nombre;
    private int edad;
    private int DNI;

    public Cliente() {
    }
    
    
    public Cliente(String nombre, int edad, int DNI) {
        this.nombre = nombre;
        this.edad = edad;
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public int getEdad() {
        return edad;
    }



   
    public int getDNI() {
        return DNI;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

      public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    
}
