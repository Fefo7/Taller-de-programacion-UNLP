

package tema2;

    import PaqueteLectura.Lector;

public class Ejer5 {

  
    public static void main(String[] args) {
        Partido[] Partidos =  new Partido[20];
        int i = 0;
        int cantRiver = 0;
        int golesBoca= 0;
        Partido aux = new Partido();
        cargarPartido(aux);
        while((i < 20) && (!aux.getVisitante().equals("zzz")) )
        {
            Partidos[i] = aux;
            i++;
            aux = new Partido();
            cargarPartido(aux);
        }
        
        
        for (int j = 0; j < i; j++) {
            System.out.println(Partidos[j].getLocal() + " - " + Partidos[j].getGolesLocal() +
                    " vs " + Partidos[j].getVisitante() + " - " + Partidos[j].getGolesVisitante());
            
            if(Partidos[j].getGanador().equals("river"))
            {
                cantRiver++;
            }
            if(Partidos[j].getLocal().equals("boca"))
            {
                golesBoca= Partidos[j].getGolesLocal();
            }
            
        }
        
        System.out.println("cantidad de partidos de river ganados: " + cantRiver);
        System.out.println("cantidad de partidos de river ganados: " + golesBoca);

        
    }
    
    
    public static Partido cargarPartido( Partido p)
    {
      System.out.println("ingrese el visitante:  ");
      p.setVisitante(Lector.leerString());
      if (!p.getVisitante().equals("zzz") )
      {
          System.out.println("ingrese el Local:  ");
          p.setLocal(Lector.leerString());
          System.out.println("ingrese goles local:  ");
          p.setGolesLocal(Lector.leerInt());
          System.out.println("ingrese goles visitante:  ");
          p.setGolesVisitante(Lector.leerInt());
      }
      
      return p;
    };
    
}


