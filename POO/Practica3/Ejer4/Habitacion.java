
package Ejer4;
import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Cliente cliente;
    
    public Habitacion() {
      GeneradorAleatorio.iniciar();
       this.cliente = new Cliente();
        this.costo = GeneradorAleatorio.generarDouble(6001)+ 2000 ;
        this.ocupada = false;
    }
  

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public double getCosto() {
        return costo;
    }

    public String isOcupada() {
        if(ocupada)
        {
            return "ocupada";
        }
        else
        {
             return "libre";
        }
       
    }

    public Cliente getCliente() {
        return cliente;
    }
    
    
    
   public void setCliente(String nombre, int edad, int DNI)
   {
       if(!this.ocupada)
       {
           this.cliente.setNombre(nombre);
           this.cliente.setEdad(edad);
           this.cliente.setDNI(DNI);
           this.ocupada = true;
       }
   }
    
 
}
