/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejer2;

/**
 *
 * @author Usuario
 */
public class Jugador extends Empleado{
    private int numeroPartidos;
    private int golesAnotados;

    public Jugador(int numeroPartidos, int golesAnotados, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.numeroPartidos = numeroPartidos;
        this.golesAnotados = golesAnotados;
    }

    public int getNumeroPartidos() {
        return numeroPartidos;
    }

    public void setNumeroPartidos(int numeroPartidos) {
        this.numeroPartidos = numeroPartidos;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }

    @Override
    public double calcularEfectividad() {
        return  this.golesAnotados / this.numeroPartidos;
    }

     public double calcularSueldoACobrar()
     {
        double sueldo =  super.calcularSueldoACobrar();
        if(this.calcularEfectividad()> 0.5 )
        {
             sueldo += 5000;
        }
         return  sueldo;
     }
    
    
    
    
    
}
