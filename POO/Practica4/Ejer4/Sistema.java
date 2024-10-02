/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejer4;
import PaqueteLectura.GeneradorAleatorio;

public class Sistema {
    private double[][] datos;
    private int anioBase; 
    private int N; 
    private Estacion estacion;

    public Sistema(int anio, int N, String nombre, double latitud, double longitud ) {
        this.anioBase = anio;
        this.N = N;
        setDatos(datos);
        this.estacion = new Estacion (nombre,latitud,longitud);
    }

    public int getAnioBase() {
        return anioBase;
    }

    public void setAnioBase(int anioBase) {
        this.anioBase = anioBase;
    }

    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }

    public Estacion getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion estacion) {
        this.estacion = estacion;
    }
    
  
     
     
    public double[][] getDatos() {
        return datos;
    }
    
    public void setDatos(double[][] datos) {
        
        if(this.N > 0 )
        {
            this.datos = new double[N][11];
            initMatriz();
        }
        else
        {
            System.out.println("debe ingresar cantidad de anios");
        }
    }
    
    public void  AgregarRegistro(int anio, int mes)
    {
        GeneradorAleatorio.iniciar();
        int indice = anio - this.getAnioBase(); 
        this.datos[indice][mes] =  GeneradorAleatorio.generarDouble(999);
        
    }
    
    public double ObtenerTemperatura(int anio, int mes)
    {
        int conver= anio - this.getAnioBase();
        return this.datos[conver][mes];
    }
    
    
    public String MaxTemperatura()
    {   
        double max = -1;
        int posAnio = 0;
        int mes=0;
        for (int i = 0; i < N; i++) {
            for (int j = 0; j < 11; j++) {
                if (this.datos[i][j] >  max)
                {
                    max = this.datos[i][j];
                    posAnio = i;
                    mes = j;
                }
            }
        }
        
        int aux = this.getAnioBase() + posAnio;
        
        return "la mayor temperatura fue " + max + " en el anio: "+ aux + " el mes de: " + mes;
    }

    public String ReporteXAnio() {
        String Aux= this.estacion.toString();
        for (int i = 0; i < N; i++) {
            double Promedio = 0;
            for (int j = 0; j < 11; j++) {
                
                Promedio += this.datos[i][j];  
            }
            Promedio = Promedio / 11;
            int anioAux = this.getAnioBase() + i;
           Aux += "\n"+ anioAux +": " + Promedio + "C"; 
        }
        return Aux; 
    }
    
    public String ReporteXMes() {
        String Aux= this.estacion.toString();
        for (int i = 0; i < 11; i++) {
            double Promedio = 0;
            for (int j = 0; j < this.N; j++) {
                
                Promedio = Promedio + this.datos[j][i];  
            }
            Promedio = Promedio / this.N;
           Aux += "\n"+ CalcularMes(i+1) +": " + Promedio + "C"; 
        }
        return Aux; 
    }
    
    
    private String CalcularMes(int mes)
    {
        switch (mes) 
        {
            case 1: return "Enero";
            case 2: return "Febrero";
            case 3: return "Marzo";
            case 4: return "Abril";
            case 5: return "Mayo";
            case 6: return "Junio";
            case 7: return "Julio";
            case 8: return "Agosto";
            case 9: return "Septiembre";
            case 10: return "Octubre";
            case 11: return "Noviembre";
            case 12: return "Diciembre";  
        }
        return null;
    }
    
    
    
    private  void initMatriz()
    {
        for (int i = 0; i < this.N; i++) {
            for (int j = 0; j < 11; j++) {
               this.datos[i][j] = GeneradorAleatorio.generarDouble(999);
            }
        }
    }
}
