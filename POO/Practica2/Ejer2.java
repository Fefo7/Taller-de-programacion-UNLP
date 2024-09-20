/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package tema2;


import PaqueteLectura.GeneradorAleatorio;
public class Ejer2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dimF = 15;
        int i = 0;
        int cant = 0;
        int min = 999;
         
        Persona[] Personas = new Persona[dimF];
        
      
        
        int edad = GeneradorAleatorio.generarInt(99);
       while((i < dimF) && (edad != 0))
        {
           Personas[i] = new Persona(); 
           Personas[i].setNombre(GeneradorAleatorio.generarString(15));
           Personas[i].setEdad(edad);
           Personas[i].setDNI(GeneradorAleatorio.generarInt(999999));
           edad = GeneradorAleatorio.generarInt(99);
           i++;
        }          
       
        for (int j = 0; j < Personas.length; j++) {
            if (Personas[j].getEdad() < 60)
            {
               cant++;
            }
            if (Personas[j].getDNI() < min)
            {
                 min = Personas[j].getDNI();
            }
            
        }
       System.out.println("la cantidad de personas cone edad mas de 60 es: " + cant);
       System.out.println(" la persona con menor dni: " + min);
       
    }
    
}
