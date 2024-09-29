/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ejer2;

/**
 *
 * @author Usuario
 */
public class Entrenador extends Empleado{
    private int cantCampeonatosGanados;

    public Entrenador(int cantCampeonatosGanados, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    public int getCantCampeonatosGanados() {
        return cantCampeonatosGanados;
    }

    public void setCantCampeonatosGanados(int cantCampeonatosGanados) {
        this.cantCampeonatosGanados = cantCampeonatosGanados;
    }

    @Override
    public double calcularEfectividad() {
            
        return  this.getCantCampeonatosGanados() / this.getAntiguedad();
    }
   
    
    public double calcularSueldoACobrar()
    {
        double sueldo =  super.calcularSueldoACobrar();
       if( getCantCampeonatosGanados()> 10 ) 
       {
           return sueldo + 50000;
       }
       else
       {
            if(5 <= getCantCampeonatosGanados() && getCantCampeonatosGanados() <= 10)
            {
                return sueldo + 30000;
            }
            else
            {
                if(1 <= getCantCampeonatosGanados() && getCantCampeonatosGanados() <= 4)
                {
                     return sueldo+ 5000;
                }
            }
       }
        return sueldo;
    }
    
}
