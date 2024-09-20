/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author Alumno
 */
 import PaqueteLectura.Lector;
import java.util.Set;
public class Ejer3 {

  
    public static void main(String[] args) {
        Persona[][] MatrizPersonas = new Persona[5][8];
        boolean  Condicion = true;
        int i = 0;
        int j = 0;
        
        while((i<5) && (Condicion))
        {
            while ((j<8) && (Condicion))
            {
                MatrizPersonas[i][j] = new Persona();
                Persona Aux = new Persona();
                CargarPersona(Aux);
                if(Aux.getNombre().equals("zzz"))
                {
                    Condicion= false;
                }else
                {
                     MatrizPersonas[i][j] = Aux;
                     j++;
                }
                
            }
           i++;
        }
        System.out.println(i+ " " + j);
        for (int k = 0; k <i; k++) {
            for (int l = 0; l < j; l++) {
                System.out.println("dia " + k + "turno: " + j);
                System.out.println(MatrizPersonas[k][l].getNombre());
            }
        }
        
    }
    public static Persona CargarPersona( Persona p)
    {
        System.out.println("ingrese un nombre");
        p.setNombre(Lector.leerString());
        if(p.getNombre().equals("zzz"))
        {
           System.out.println("Termino la carga");
           p.setEdad(0);
           p.setDNI(0);
            
        }
        else 
        {
         System.out.println("ingrese una edad");
         p.setEdad(Lector.leerInt());
         System.out.println("ingrese un DNI");
         p.setDNI(Lector.leerInt());

        }
        return p;
    }
    
}
