/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejer3;

import tema2.Persona;

/**
 *
 * @author Alumno
 */
public class Trabajador extends Persona {
    private String rubro;
    
     public Trabajador() {
    }
    public Trabajador(String unNombre, int unDNI, int unaEdad, String unRubro) {
        super(unNombre, unDNI, unaEdad);
        setRubro(unRubro);
    }

    public String getRubro() {
        return rubro;
    }

    public void setRubro(String rubro) {
        this.rubro = rubro;
    }

    @Override
   public String toString()
   {
       String aux; 
        aux = "Mi nombre es " + this.getNombre() 
                + ", mi DNI es " + this.getDNI() 
                + " y tengo " + this.getEdad() 
                + " años." + " Soy " + getRubro();
        return aux;
   }
    
    
    
}
