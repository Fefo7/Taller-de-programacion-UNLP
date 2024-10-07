/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac5ejer3;

/**
 *
 * @author Usuario
 */
public abstract class Recital {
    private int dimL;
    private int dimf;
    private String nombreBanda;
    private String[] listaTemas;

    public Recital(String nombreBanda, int cantTemas) {
        this.nombreBanda = nombreBanda;
        this.dimL= 0;
        this.dimf = cantTemas;
        this.listaTemas = new String[cantTemas];
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
    
    
    public void  AgregarTema(String nombreTema)
    {
        if(dimL < dimf)
        {
            this.listaTemas[dimL] = nombreTema;
            this.dimL++;
        }
        else
        {
            System.out.println("ya no hay mas temas");
        }
    }
   
    public String  Actuar()
    {
        String aux= "";
        for (int i = 0; i < dimf; i++) {
            aux += "y ahora tocaremos... " + this.listaTemas[i] + "\n";
        }
        return aux;
    }
    
    
    public abstract double  calcularCosto();
}
