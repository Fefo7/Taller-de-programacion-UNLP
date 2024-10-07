/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnof2023;

/**
 *
 * @author Usuario
 */
public class Director extends Empleado {
    
    private double montoViaticos;

    public Director(double montoViaticos, String nombre, int DNI, int anioIngreso, double sueldoBasico) {
        super(nombre, DNI, anioIngreso, sueldoBasico);
        this.montoViaticos = montoViaticos;
    }

    @Override
    public double calcularSueldo() {
       return super.calcularSueldo() + this.montoViaticos;
    }

    

    
    
}
