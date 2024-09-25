/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

public class Triangulo {
    private double _lado1;
    private double _lado2;
    private double _lado3;
    private String _colorRelleno;
    private String _colorLinea;
    
    public Triangulo()
    {
    }
    public Triangulo(  double lado1, double lado2,double lado3, String colorRelleno, String colorLinea)
    {
        _lado1 = lado1;
        _lado2 = lado2;
        _lado3 = lado3;
        _colorRelleno = colorRelleno;
        _colorLinea = colorLinea;
    }
    
    public double getLado1()
    {
        return this._lado1;
    }
    public double getLado2()
    {
        return this._lado2;
    }
    public double getLado3()
    {
        return this._lado3;
    }
    public String getColorRelleno()
    {
        return this._colorRelleno;
    }
    public String getColorLinea()
    {
        return this._colorLinea;
    }
    public void setLado1(double medida)
    {
        _lado1 = medida;
    }
    public void setLado2(double medida)
    {
        _lado2 = medida;
    }
    public void setLado3(double medida)
    {
        _lado3 = medida;
    }
    public void setColorRelleno(String color)
    {
        _colorRelleno = color;
    }
    public void setColorLinea(String color)
    {
        _colorLinea = color;
    }
    
    public double getPerimetro()
    {
        return _lado1 + _lado2 +_lado3;
    }
    public double getArea()
    {
        double s =  ((_lado1 + _lado2 + _lado3)/ 2);
        s = (s - _lado1 ) * (s - _lado2)* (s - _lado3);
        return Math.sqrt(s);
    }
            
    
}

