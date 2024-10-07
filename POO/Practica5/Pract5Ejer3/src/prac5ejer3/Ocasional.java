/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prac5ejer3;

/**
 *
 * @author Usuario
 */
public class Ocasional extends Recital{
    private String motivo;
    private String nombreContratante;
    private int DiaEvento;

    public Ocasional(String motivo, String nombreContratante, int DiaEvento, String nombreBanda, int cantTemas) {
        super(nombreBanda, cantTemas);
        this.motivo = motivo;
        this.nombreContratante = nombreContratante;
        this.DiaEvento = DiaEvento;
    }

    

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDiaEvento() {
        return DiaEvento;
    }

    public void setDiaEvento(int DiaEvento) {
        this.DiaEvento = DiaEvento;
    }

    @Override
    public String Actuar()
    {
        String aux = "";
        switch (this.motivo)
        {
            case "a beneficio": aux = "Recuerden colaborar con " + this.nombreContratante;
                break;
            case "show de TV": aux = "Saludos amigos televidentes" ;
                break;
            case "show privado": aux = "Un feliz cumpleaños para " + this.nombreContratante;
                break;
            default:
                System.out.println("Motivo desconocido");
        }
       
            aux = "\n" + super.Actuar();
        return aux;
    }

    @Override
    public double calcularCosto() {
        switch (this.motivo) {
               
            case "show de TV":
                return 50000;
              
            case "show privado":
                return 150000;
            default: return 0;
                
        }
        
    }
    
    
}
