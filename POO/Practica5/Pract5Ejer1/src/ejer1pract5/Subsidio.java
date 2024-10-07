/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejer1pract5;

/**
 *
 * @author Usuario
 */
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado;

    public Subsidio(double monto, String motivo) {
        this.monto = monto;
        this.motivo = motivo;
        this.otorgado = false;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }
    public boolean otorgarSub() {
        return this.otorgado = true;
    }

	@Override
	public String toString() {
		String aux = getMotivo() + " " + getMonto() ;
		if(isOtorgado())
		{
			aux += "Se otorgo";
		}
		else 
		{
			aux += "No otorgo";
		}
		return super.toString(); //To change body of generated methods, choose Tools | Templates.
	}
    
    
    
  
    
    
    
    
}
