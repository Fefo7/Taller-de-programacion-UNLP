/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package parcial2021;

/**
 *
 * @author Usuario
 */
public class Concurso {
    private int dimf; 
    private int diml;
    private Pareja[] parejas;

    public Concurso(int Nparejas) {
        this.dimf= Nparejas;
        this.diml = 0;
        this.parejas = new Pareja[Nparejas];
        for (int i = 0; i < this.dimf; i++) {
            this.parejas[i] = null;
        }
    }
    public void AgregarPareja(Pareja nuevaPareja)
    {
        if(diml< dimf)
        {
            this.parejas[diml] = nuevaPareja;
            diml++;
        }
        else
        {
            System.out.println("no hay mas cupo");
        }
    }
    public Pareja MasDiferenciaEdad()
    {
        int max = -1;
        Pareja aux = new Pareja();
        for (int i = 0; i < dimf; i++) {
            if(this.parejas[i].DiferenciaEdad() > max)
            {
                max = this.parejas[i].DiferenciaEdad();
                aux = this.parejas[i];
            }
        }
        return aux;
    }

    
    
}
