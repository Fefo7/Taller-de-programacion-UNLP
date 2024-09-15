
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.GeneradorAleatorio;

public class Ej02Jugadores {
    /*Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
        básquet y las almacene en un vector. Luego informe:
        - la altura promedio
        - la cantidad de jugadores con altura por encima del promedio
    */
  
    public static void main(String[] args) {
     
         double[] alturas = new double[15];
         double AlturaProm = 0.0;
         int cantJugadores = 0; 
         GeneradorAleatorio.iniciar();
         for (int i = 0; i < 15; i++) {
               alturas[i] = GeneradorAleatorio.generarDouble(15);
               AlturaProm = AlturaProm + alturas[i];
        }
         
        /* for (int i = 0; i < 15; i++) {
            System.out.println( i + "-" + alturas[i]);
        }*/
         
        System.out.println("el promedio es: " + (AlturaProm / 15));
  
             for (int i = 0; i < 15; i++) {
               if(alturas[i] >(AlturaProm / 15)  )
               {
                   cantJugadores ++;
               }
        }
        System.out.println("La cantidad de alturas promedios es de: " + cantJugadores);
    }
    
}
