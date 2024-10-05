/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejer1pract5;

/**
 *
 * @author Usuario
 */
public class Proyecto {
    private final int dimF = 50;
    private int dimL;
    
    private String nombre;
    private int code;
    private String nombreCompDirector;
    private Investigador[] investigadores;

    public Proyecto(String nombre, int code, String nombreCompDirector) {
        this.nombre = nombre;
        this.code = code;
        this.nombreCompDirector = nombreCompDirector;
        this.investigadores = new Investigador[dimF];
        this.dimL = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getNombreCompDirector() {
        return nombreCompDirector;
    }

    public void setNombreCompDirector(String nombreCompDirector) {
        this.nombreCompDirector = nombreCompDirector;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }

    public void setInvestigadores(Investigador[] investigadores) {
        this.investigadores = investigadores;
    }
    
    
    
    public void agregarInvestigador(Investigador unInvestigador)
    {
        if((this.dimL) < dimF)
        {
            investigadores[this.dimL] = unInvestigador;
            this.dimL++;
        }
    }
    

   
   public void otorgarTodos(String nombre_completo)
   {
       int i = 0;
       int pos = 0;
       while(i < this.dimL && (!investigadores[i].getNombre().equals(nombre_completo)))
       {
           pos= i;
           i++;
       }
       if(investigadores[pos].getNombre().equals(nombre_completo))
       {
           for (int j = 0; j < investigadores[pos].getDimL(); j++) {
               if(!investigadores[pos].getSubsidios()[j].isOtorgado())
               {
                   System.out.println(investigadores[pos].getSubsidios()[j].toString());
               }
           }
           
       }
       
   }

   private double obtenerMontototal()
   {
       double acumulador = 0;
       for (int i = 0; i < dimL; i++) {
           acumulador =  acumulador + this.investigadores[i].dineroTotalOtorgado();
       }
       return acumulador;
   } 
   
    @Override
    public String toString() {
        
        String aux = " " +  nombre + " "+ code + " " +nombreCompDirector + " "+ obtenerMontototal();
        
        for (int i = 0; i < dimL; i++) {
            aux = aux + "\n" + investigadores[i].toString();
        }
        
        return aux; 
    }
   
   
    
     
}
