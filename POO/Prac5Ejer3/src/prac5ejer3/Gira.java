/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac5ejer3;

/**
 *
 * @author Usuario
 */
public class Gira extends Recital{
    private int dimf;
    private int diml;
    private String nombre;
    private Fecha[] fechas;
    private int fechaActual;

    public Gira(String nombre,int CantFecha , String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.dimf = CantFecha;
        this.diml = 0;
        this.nombre = nombre;
        this.fechas = new Fecha[CantFecha];
        this.fechaActual = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void AgregarFecha(Fecha f)
    {
        if(diml < dimf)
        {
            fechas[diml] = f;
            diml++;
        }
            
    }
    
    @Override
    public String Actuar()
    {
        String aux = "";
       
        aux += "Buenas noches " + fechas[this.fechaActual].getCiudad() + "\n";
        
        if(this.fechaActual+1 < dimf)
        {
            this.fechaActual++;
            aux +=  super.Actuar();
        }
        else
        {
            System.out.println("Es la ultima fecha");
        }
        return aux;
    }

    @Override
    public double calcularCosto() {
        return 30000 * dimf;
       
    }

    
}
