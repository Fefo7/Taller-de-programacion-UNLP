/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejer4;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Hotel {
   
    private int CantHabitaciones;
    private Habitacion[] habitaciones;

    public Hotel(int CantHabitaciones) {
        this.CantHabitaciones = CantHabitaciones;
        this.habitaciones = new Habitacion[CantHabitaciones];
        CargarVect();
    }
    
    private void CargarVect()
    {
        for (int i = 0; i < CantHabitaciones; i++) {
            this.habitaciones[i] = new Habitacion();
        }
    }
    
    public void IngresarCliente(int nroHabitacion)
    {
        GeneradorAleatorio.iniciar();
        String nombre = GeneradorAleatorio.generarString(5);
        int edad = GeneradorAleatorio.generarInt(99);
        int dni = GeneradorAleatorio.generarInt(99999);
        habitaciones[nroHabitacion].setCliente(nombre, edad, dni);   
    }
    
    public void AumentarPrecio(double monto)
    {
        for (int i = 0; i < CantHabitaciones; i++) {
            habitaciones[i].setCosto(habitaciones[i].getCosto() + monto);
        }
    }
    public void RepresentacionHotel()
    {
        for (int i = 0; i < CantHabitaciones; i++) {
            System.out.println("Costo: " + habitaciones[i].getCosto() + "Habitacion: " + i + " - " + habitaciones[i].isOcupada());
            if( habitaciones[i].isOcupada().equals("ocupada") )
            {
               System.out.println(habitaciones[i].getCliente().getNombre());
               System.out.println(habitaciones[i].getCliente().getEdad());
               System.out.println(habitaciones[i].getCliente().getDNI());
            }
        }
    }
   
    
    
}
