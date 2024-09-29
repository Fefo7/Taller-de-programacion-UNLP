/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author Usuario
 */
public class Circulo extends Figura{

   private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        setRadio(radio);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
     
    public String toString()
    {
        return super.toString() + "Radio: " + getRadio();
    }
    
    
    @Override
    public double calcularArea() {
         return (Math.PI)*(Math.pow(radio, 2));
    }

    @Override
    public double calcularPerimetro() {
       return ((Math.PI*2)* this.radio );
    }
    
}
