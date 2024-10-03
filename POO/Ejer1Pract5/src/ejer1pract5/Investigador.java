/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejer1pract5;

/**
 *
 * @author Usuario
 */
public class Investigador {
    private final int dimF = 5;
    private int dimL;
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.subsidios = new Subsidio[dimF];
        this.dimL = 0;
    }

    public int getDimL() {
        return dimL;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }
        
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }


    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    
    public void agregarSubsidio(Subsidio unSubsidio)
    {
         if(this.dimL < dimF)
        {
            this.subsidios[this.dimL] = unSubsidio;
            this.dimL++;
        }
    }
  public double dineroTotalOtorgado()
   {
       double acumulador = 0;
       for (int i = 0; i < dimL; i++) {
           if(this.subsidios[i].isOtorgado())
           {
               acumulador = acumulador+ this.subsidios[i].getMonto();
           }
       }
       return acumulador;
   }
   
    
    
    
}
