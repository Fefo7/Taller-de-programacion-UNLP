/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2021;

/**
 *
 * @author Usuario
 */
public class Pareja {
    private Participante[] integrantes;
    private String estiloBaile;

    public Pareja()
    {
    }
    
    public Pareja(String estiloBaile) {
        this.estiloBaile = estiloBaile;
        this.integrantes = new Participante[2];
        for (int i = 0; i < 2; i++) {
            this.integrantes[i] = null;
        }
    }

    public String getEstiloBaile() {
        return estiloBaile;
    }

    public void setEstiloBaile(String estiloBaile) {
        this.estiloBaile = estiloBaile;
    }
    
    public void AgregarParticipante (Participante p1, Participante p2 )
    {
        this.integrantes[0] = p1;
        this.integrantes[1] = p2;
    }
    
    public int DiferenciaEdad()
    {
        if(this.integrantes[0].getEdad() > this.integrantes[1].getEdad())
        {
            return this.integrantes[0].getEdad() - this.integrantes[1].getEdad();
        }
        else
        {
            return this.integrantes[1].getEdad() - this.integrantes[0].getEdad();
        }
        
    }

    @Override
    public String toString() {
        String aux = "pareja participante 1: " + this.integrantes[0].toString() + "pareja participante 2: " +this.integrantes[0].toString();
        return aux;
    }
    
    
    
}
