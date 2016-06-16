package uy.edu.fing.mina.simulaciones.pricing.Potencia1;

import java.util.HashMap;
import java.util.Map;

import uy.edu.fing.mina.lupa.tf.ActionTf;

public class Acciones {
	private Map<String, ActionTf> conjuntoAcciones;
	private static Acciones instancia;
	
	private Acciones(){
		super();
		this.conjuntoAcciones = new HashMap<String,ActionTf>();
		this.popular();
	}
	
	public static Acciones getInstance(){
		if(instancia == null){
			instancia = new Acciones();
		}
		return instancia;
	}
	
	
	private void  popular(){
		ActionTf nuevo = new ActionTf();
		nuevo.setName("decrease_power");
		conjuntoAcciones.put(nuevo.getName(), nuevo);
		
		nuevo = new ActionTf();
		nuevo.setName("keep_power");
		conjuntoAcciones.put(nuevo.getName(), nuevo);
		
		nuevo = new ActionTf();
		nuevo.setName("increase_power");
		conjuntoAcciones.put(nuevo.getName(), nuevo);
	}
	
	public ActionTf getAccion(String nombre){
		return conjuntoAcciones.get(nombre);
	}

}