
package parcialturnof2023;


public class Encargado extends Empleado{
   
   
    private int cantEmpleados;

    public Encargado(int cantEmpleados, String nombre, int DNI, int anioIngreso, double sueldoBasico) {
        super(nombre, DNI, anioIngreso, sueldoBasico);
        this.cantEmpleados = cantEmpleados;
    }

    public int getCantEmpleados() {
        return cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }
    
    
    
    @Override
    public double calcularSueldo() {
        return super.calcularSueldo() + 1000*this.cantEmpleados;
    }

   
    
    
}
