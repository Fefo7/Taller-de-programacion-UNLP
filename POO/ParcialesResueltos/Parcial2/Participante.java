/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2021;

/**
 *
 * @author Usuario
 */
public class Participante {
    private int DNI;
    private String nombre;
    private int edad;

    public Participante(int DNI, String nombre, int edad) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.edad = edad;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "DNI=" + DNI + ", nombre=" + nombre + ", edad=" + edad;
    }
    
    
}
