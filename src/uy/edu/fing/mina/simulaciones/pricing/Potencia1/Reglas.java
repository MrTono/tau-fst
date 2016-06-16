package uy.edu.fing.mina.simulaciones.pricing.Potencia1;

import java.util.HashSet;
import java.util.Set;

import uy.edu.fing.mina.fsa.tffst.State;
import uy.edu.fing.mina.fsa.tffst.Tffst;
import uy.edu.fing.mina.fsa.tffst.Transition;
import uy.edu.fing.mina.lupa.tf.ActionTf;

public class Reglas {
	private static Reglas instancia;
	public Set<Tffst> reglas = new HashSet<Tffst>();
	
	public static Reglas getInstance(){
		if(instancia == null){
			instancia = new Reglas();
		}
		return instancia;
	}
	
	private Reglas(){
		super();
	}
	
	public Set<Tffst> getReglas(){
		return reglas;
	}
	
	public void construirReglas(){
		
		ActionTf epsilon = new ActionTf();
		epsilon.setEpsilon();
		Eventos eventos = Eventos.getInstance();
		Acciones acciones = Acciones.getInstance();
		Estados estados = Estados.getInstance();
		
		State estado1, estado2;
		Tffst iterador;
		
//		Rules for power

//		Regla 1 : if #ClientsConnectedHigh then Decrease Power
		
		estado1 = estados.nuevoEstado();
		estado2 = estados.nuevoEstado();
		estado2.setAccept(true);
				
		estado1.addOutTran(new Transition(eventos.getEvento("NClientsConnectedHigh"), acciones.getAccion("decrease_power"), estado2));
		
		iterador = new Tffst();
		iterador.setInitialState(estado1);
		reglas.add(iterador);
		
 // Regla 2 : if #ClientsConnectedLow then Increase Power
		estado1 = estados.nuevoEstado();
		estado2 = estados.nuevoEstado();
		estado2.setAccept(true);
		estado1.addOutTran(new Transition(eventos.getEvento("NClientsConnectedLow"), acciones.getAccion("increase_power"), estado2));

		iterador = new Tffst();
		iterador.setInitialState(estado1);
		reglas.add(iterador);	
		
		
// Regla 3: If NClients Connected Medium then Keep Power		
		
		estado1 = estados.nuevoEstado();
		estado2 = estados.nuevoEstado();
		estado2.setAccept(true);
		estado1.addOutTran(new Transition(eventos.getEvento("NClientsConnectedMedium"), acciones.getAccion("keep_power"), estado2));
				
		iterador = new Tffst();
		iterador.setInitialState(estado1);
		reglas.add(iterador);	
		

	
//		FIN DE REGLAS PARA EL CASO DE QUE LA COMPETENCIA OFREZCA PRECIOS MÃ?S ALTOS
		
//		FIN DE REGLAS PARA LA COMPETENCIA
		
		
	}

}