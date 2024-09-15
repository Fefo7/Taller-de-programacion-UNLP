/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej03Matrices {

    public static void main(String[] args) {   
	GeneradorAleatorio.iniciar();
        int[][] matriz = new int[5][5];
        
        for (int i = 0; i < 5; i++) {
                
            for (int j = 0; j < 5; j++) {
                matriz[i][j] = GeneradorAleatorio.generarInt(100);
            }
        }
        
        //Paso 4. mostrar el contenido de la matriz en consola
            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 5; j++) {
                    System.out.print(matriz[i][j]+ " "); 
                }
                System.out.println();
        }
     
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
            int suma = 0;
            for (int j = 0; j < 5; j++) {
                suma += matriz[0][j];
            }
            System.out.println("suma de los elementos: " + suma);
         
            int[] vec = {0,0,0,0,0};
             for (int i = 0; i < 5; i++) {
                 for (int j = 0; j < 5; j++) {
                     vec[i] += matriz[j][i];
                 }
                
            }
             
            for (int i = 0; i < 5; i++) {
                     System.out.println(vec[i]);
                }
           
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("ingrese el valor a buscar:  ");
        int valorBuscar = PaqueteLectura.Lector.leerInt();
        boolean noEncontre = true;
        
        if(noEncontre)
        {
         for (int i = 0; i < 5; i++) 
         {
             for (int j = 0; j < 5; j++) 
             {
                    if(matriz[i][j] == valorBuscar )
                    {
                       System.out.println("fila: " + i + "columna: " + j);
                        noEncontre = false;
                    }
                    
             }
         }
           
        }
        if(noEncontre){System.out.println("no encontre");}
        
        
        
        
        
        
        
        
    }
   
}
