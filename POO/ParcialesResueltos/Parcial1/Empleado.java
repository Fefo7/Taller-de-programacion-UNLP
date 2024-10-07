/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnof2023;

/**
 *
 * @author Usuario
 */
public abstract class Empleado {
    private String nombre;
    private int DNI;
    private int anioIngreso;
    private double sueldoBasico;

    public Empleado(String nombre, int DNI, int anioIngreso, double sueldoBasico) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.anioIngreso = anioIngreso;
        this.sueldoBasico = sueldoBasico;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getAnioIngreso() {
        return anioIngreso;
    }

    public void setAnioIngreso(int anioIngreso) {
        this.anioIngreso = anioIngreso;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    
    
    
    @Override   
    public String toString() {
        return  "nombre=" + nombre + ", DNI=" + DNI + ", anioIngreso=" + anioIngreso + ", Sueldo a cobrar=" + calcularSueldo();
    }
    
    public  double calcularSueldo()
    {
        if(2024 - this.getAnioIngreso() > 20)
        {
             return this.sueldoBasico + ((this.sueldoBasico* 10) / 100);
        }
        else
        {
            return this.sueldoBasico;
        }
       
    };
}
