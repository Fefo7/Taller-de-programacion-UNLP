/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejer2;

/**
 *
 * @author Usuario
 */
public class Auto {
    private String nombreDue;
    private String patente;

    public Auto(String nombreDue, String patente) {
        this.nombreDue = nombreDue;
        this.patente = patente;
    }

    public String getNombreDue() {
        return nombreDue;
    }

    public void setNombreDue(String nombreDue) {
        this.nombreDue = nombreDue;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "nombre del propietario: " + this.nombreDue + " patente: " +  this.patente; 
    }
    
    
    
}
