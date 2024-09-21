package tema2;

import PaqueteLectura.Lector;

public class Ejer4 {

    public static void main(String[] args) {
       Persona[][] matrizPersonas = new Persona[5][8];
       
       
       
       boolean  Condicion = true;
       int dia; 
       int cant = 0;
       int j = 0;
       
             
        while (cant < 40 && Condicion ) 
        {
           System.out.println("Ingrese el dia del turno");
           dia = Lector.leerInt();
           while (j<8 && matrizPersonas[dia][j] != null )
           {
               j++;
           }
           Persona aux = new Persona();
           cargarPersona(aux);
           if(matrizPersonas[dia][j] == null)  // compruebo el ultimo para ver si me quede sin turnos 
           {
               if(!aux.getNombre().equals("zzz"))
                {
                   matrizPersonas[dia][j] = aux;  
                   cant ++;
                   j = 0;
                }
               else
               {
                   Condicion = false;
               }
           }
            else
            {
                System.out.println("No hay turnos en ese dia disponibles");
            }   
        }
             
        for (int k = 0; k <5; k++) 
        {
           int cantInsc = 0;
           int l = 0;
           while( (l< 8) && (matrizPersonas[k][l] != null))
            {
              System.out.println(matrizPersonas[k][l].getNombre());
              cantInsc ++;
              l++;
            }
            System.out.println("cantidad de inscriptos el dia " + k + " es de " + cantInsc);
        }       
    }

    public static void cargarPersona(Persona p) {
        System.out.println("Ingrese un nombre:");
        p.setNombre(Lector.leerString());
        if (!p.getNombre().equals("zzz")) {
           System.out.println("Ingrese una edad:");
            p.setEdad(Lector.leerInt());
            System.out.println("Ingrese un DNI:");
            p.setDNI(Lector.leerInt());
        } 
    }
}