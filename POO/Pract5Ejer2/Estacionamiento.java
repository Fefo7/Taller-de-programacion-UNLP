/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejer2;

/**
 *
 * @author Usuario
 */
public class Estacionamiento {
   //N numerdo de piso y M numero de plaza
    
    private int n;
    private int m;
    
    
    private String nombre;
    private String direccion;
    private double hApertura;
    private double hCierre;
    private Auto[][] autos;

    public Estacionamiento(String nombre, String direccion) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.hApertura = 8.00;
        this.hCierre = 21.00;
        this.autos = new Auto[5][10];
    }

    public Estacionamiento(int n, int m, String nombre, String direccion, double hApertura, double hCierre) {
        this.n = n;
        this.m= m;
        this.nombre = nombre;
        this.direccion = direccion;
        this.hApertura = hApertura;
        this.hCierre = hCierre;
        this.autos = new Auto[n][m];
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

    public double gethApertura() {
        return hApertura;
    }

    public void sethApertura(double hApertura) {
        this.hApertura = hApertura;
    }

    public double gethCierre() {
        return hCierre;
    }

    public void sethCierre(double hCierre) {
        this.hCierre = hCierre;
    }

    
    public void AgregarAuto(Auto newAuto, int numPiso, int numPlaza)
    {
        this.autos[numPiso][numPlaza] = newAuto;
    }
    
    
    public String obtenerUbicacion(String patenteBuscar)
    {
        int i = 0;
        int j = 0;
        boolean  encontre = false;
        while(i < this.n  && !encontre )
        {
            j=0;
            while( j < this.m  && !encontre)
            {
                if( this.autos[i][j] != null && this.autos[i][j].getPatente().equals(patenteBuscar))
                {
                    encontre = true;
                }
                else
                {
                     j++;
                }
               
            }
            if(!encontre)
            {
                i++;
            }
            
        }
        if(encontre)
        {
             return "Numero de piso: " + i + " numero de plaza: " + j;
        }
        else
        {
            return "no se encotro el auto";
        }
    }

    public int obtenerCantXPlaza(int numPlaza)
    {
        int cant = 0;
        for (int i = 0; i < this.n; i++) {
            if(autos[i][numPlaza] != null)
            {
                cant++;
            }       
        }
        return cant;
    }
    
    
    
    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.n; i++) {
            for (int j = 0; j < this.m; j++) {
                if(autos[i][j] != null)
                {
                    aux +="\n" + "Piso: " + i + "Plaza: " + j + "Auto:  "+ autos[i][j].toString();
                }
                else
                {
                    aux += "\n" + "Piso: " + i + "Plaza: " + j + " libre";
                }
            }
        }
        return aux; 
    }
    
    
    

    
    
}
