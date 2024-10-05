/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejer1pract5;

/**
 *
 * @author Usuario
 */
public class Ejer1Pract5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Proyecto pro = new Proyecto ("appweb", 235, "federico isla");
        
        Investigador inv1 = new Investigador("a", 2, "backend");
        Investigador inv2 = new Investigador("b", 1, "front");
        Investigador inv3 = new Investigador("c", 3, "project manager");
       
        
        Subsidio sub = new Subsidio(300.000,"por que no?");
        Subsidio sub2= new Subsidio(350.000,"por que si");
        sub2.otorgarSub();
        
        inv1.agregarSubsidio(sub);
        inv1.agregarSubsidio(sub2);
        inv2.agregarSubsidio(sub);
        inv2.agregarSubsidio(sub2);
        inv3.agregarSubsidio(sub);
        inv3.agregarSubsidio(sub2);
        
        pro.agregarInvestigador(inv1);
        pro.agregarInvestigador(inv2);
        pro.agregarInvestigador(inv3);
       
        System.out.println(pro.toString());
        
       
        
        
    }
    
}
