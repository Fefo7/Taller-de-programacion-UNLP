/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package parcial2021;

/**
 *
 * @author Usuario
 */
public class Parcial2021 {
    public static void main(String[] args) {
        Concurso con = new Concurso(2);
        Participante part1 = new Participante(111, "Matias", 18);
        Participante part2 = new Participante(222, "Victoria", 20);
        Participante part3 = new Participante(333, "Pepe", 30);
        Participante part4 = new Participante(444, "Rosina", 22);
        
        Pareja par1 = new Pareja("Tango");
        par1.AgregarParticipante(part1, part2);
        Pareja par2 = new Pareja( "Breack Dance");
        par2.AgregarParticipante(part3, part4);
        
        con.AgregarPareja(par1);
        con.AgregarPareja(par2);
        
        System.out.println(con.MasDiferenciaEdad().toString());
        
         
    }
    
}
