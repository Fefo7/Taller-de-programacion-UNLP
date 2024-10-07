/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcialturnof2023;

/**
 *
 * @author Usuario
 */
public class Empresa {
    private int dimf;
    private String nombre;
    private String direccion;
    private Director DirectorEjecutivo; 
    private Encargado[] sucursales;

    public Empresa(String nombre, String direccion, Director DirectorEjecutivo, int Nsucursales) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.DirectorEjecutivo = DirectorEjecutivo;
        this.dimf= Nsucursales;
        this.sucursales = new Encargado[Nsucursales];
        for (int i = 0; i < this.dimf; i++) {
             this.sucursales[i] = null;
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Director getDirectorEjecutivo() {
        return DirectorEjecutivo;
    }

    public void setDirectorEjecutivo(Director DirectorEjecutivo) {
        this.DirectorEjecutivo = DirectorEjecutivo;
    }
    
    public void AgregarEncargado(int X, Encargado encargado)
    {
        this.sucursales[X-1] = encargado;

    }    

    @Override
    public String toString() {
        
        String aux = "Empresa{" + "nombre=" + nombre + ", direccion=" + direccion + ", DirectorEjecutivo=" + this.DirectorEjecutivo.toString() + '}';
        for (int i = 0; i < this.dimf; i++) {
            if (this.sucursales[i] != null) {
                aux += """
                       
                       sucursal:  """ + (i+1)+" " +this.sucursales[i].toString();
                
            }
            else
            {
                aux += "\n" + (i+1)+" " + "esta sucursal no tiene encargado";
            }
        }
        
        return aux;
    }
    
    
    
}
