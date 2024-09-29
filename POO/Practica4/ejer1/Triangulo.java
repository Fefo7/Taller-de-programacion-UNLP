/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;


public class Triangulo extends Figura{
    
    private double lado1;
    private double lado2;
    private double lado3;

    public Triangulo(double lado1, double lado2, double lado3, String unCR, String unCL) {
        super(unCR, unCL);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    
    public String toString(){
       String aux = super.toString() + 
                    " Lado1: " + getLado1() +
                    " Lado2: " + getLado2() +
                    " Lado3: " + getLado3();
       return aux;
    }
    

    @Override
    public double calcularArea() {
         double s =  ((lado1 + lado2 + lado3)/ 2);
        s = (s - lado1 ) * (s - lado2)* (s - lado3);
        return Math.sqrt(s);
    }

    @Override
    public double calcularPerimetro() {
        return lado1 + lado2 +lado3;
    }
    
}
