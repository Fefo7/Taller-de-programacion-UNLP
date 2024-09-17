 import  PaqueteLectura.Lector;
public class ejer4 {

   /*Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.
*/
   
            
    public static void main(String[] args) {
        int piso,nroOfi;
    
        int filas = 8;
         int colum= 4;
         int[][] Edificio = new  int[filas][colum];  
         
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < colum; j++) {
                Edificio[i][j] = 0;
            }
        }
          System.out.println("ingrese el piso");
          piso = Lector.leerInt();
          while (piso != 9)
          {
              System.out.println("ingrese el oficina");
              nroOfi = Lector.leerInt();
              Edificio[piso][nroOfi] ++;
              System.out.println("ingrese el piso");
              piso = Lector.leerInt();
          }
        
        for (int i = 0; i < filas; i++) {
            for (int j = 0; j < colum; j++) {
                
                System.out.println("piso - " + i + "oficina - " + j + " = "+ Edificio[i][j]);
            }
        }
  
          
    }
    
}
