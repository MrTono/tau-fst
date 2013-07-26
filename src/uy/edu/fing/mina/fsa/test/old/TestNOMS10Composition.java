package uy.edu.fing.mina.fsa.test.old;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import uy.edu.fing.mina.fsa.tf.SimpleTf;
import uy.edu.fing.mina.fsa.tf.TfI;
import uy.edu.fing.mina.fsa.tffsr.Tffsr;
import uy.edu.fing.mina.fsa.tffst.State;
import uy.edu.fing.mina.fsa.tffst.Tffst;
import uy.edu.fing.mina.fsa.tffst.Transition;
import uy.edu.fing.mina.fsa.utils.Utils;
import uy.edu.fing.mina.lupa.LupaExporter;
import uy.edu.fing.mina.lupa.tf.ActionTf;
import uy.edu.fing.mina.lupa.tf.EventTf;
import uy.edu.fing.mina.lupa.tf.Sentence;

/**
 * @author Javier Baliosian &lt; <a
 *         href="mailto:jbaliosian@tsc.upc.es">jbaliosian@tsc.upc.es </a>&gt;
 */
public class TestNOMS10Composition {


public static Tffst ruletypeA(TfI ev1, TfI ev2, TfI act1, TfI act2) {
		
		Tffst rule1a = new Tffst();
		
		State s0 = new State();
		rule1a.setInitialState(s0);
		State s1 = new State();
		State s2 = new State();
		s2.setAccept(true);

		Transition trans0 = new Transition(ev1, act1, s1);
		Transition trans1 = new Transition(ev2.not(), act1, s1);
		Transition trans2 = new Transition(ev2, act2, s2);

		s0.addTransition(trans0);
		s1.addTransition(trans1);
		s1.addTransition(trans2);

		Tffst rule1b = new Tffst();
		
		State s0b = new State();
		rule1b.setInitialState(s0b);
		State s1b = new State();
		State s2b = new State();
		s2b.setAccept(true);

		Transition trans0b = new Transition(ev2, act1, s1b);				
		Transition trans1b = new Transition(ev1.not(), act1, s1b);
		Transition trans2b = new Transition(ev1, act2, s2b);

		s0b.addTransition(trans0b);
		s1b.addTransition(trans1b);
		s1b.addTransition(trans2b);

		//return rule1a.union(rule1b);
		
		return rule1a.kleene();
		
	}

public static Tffst ruletypeB(TfI ev1, TfI ev2, TfI act1) {
	
	Tffst rule1a = new Tffst();
	
	State s0 = new State();
	rule1a.setInitialState(s0);
	State s1 = new State();
	State s2 = new State();
	State s3 = new State();
	s3.setAccept(true);

	Transition trans0 = new Transition(ev1, ev1, s1,1);
	Transition trans1 = new Transition(ev2.not(), ev2.not(), s1, 1);
	Transition trans2 = new Transition(ev2, ev2, s2, 1);
	Transition trans3 = new Transition(SimpleTf.Epsilon(), act1, s3);

	s0.addTransition(trans0);
	s1.addTransition(trans1);
	s1.addTransition(trans2);
	s2.addTransition(trans3);
	
	return rule1a.kleene();
	
}
	
	
	
	public static void main(String[] args) {

		
		/*
		 * 
			if is\_high($T/H$) and increasing($T/H$) then turn\_on($GW_H$)
			if is\_high($T/H$) and steady($T/H$) then turn\_on($GW_H$)
			
			if is\_low($T/H$) and steady($T/H$) then turn\_off($GW_H$)
			if is\_low($T/H$) and decreasing($T/H$) then turn\_off($GW_H$)
			
			
			if is\_low($T/H$) and increasing($T/H$) then decrease\_price\_fast
			if is\_medium($T/H$) and steady($T/H$) then decrease\_price\_slow
			if is\_medium($T/H$) and decreasing($T/H$) then  decrease\_price\_fast
			if is\_medium($T/H$) and increasing($T/H$) then do\_nothing (no need to write this rule)
			if is\_high($T/H$) and steady($T/H$) then increase\_price\_slow
			if is\_high($T/H$) and decreasing($T/H$) then  decrease\_price\_slow
			if is\_high($T/H$) and increasing($T/H$) then increase\_price\_fast
			
			if new\_price(gwX) and\\ price(gwX) < current\_price(defaultGW)\\ then setGW(gwX)
		 * 
		 */
		
		Tffst.setMinimizeAlways(false);
		
		EventTf etf_ih = new EventTf();
		etf_ih.setName("ih");
		EventTf etf_ii = new EventTf();
		etf_ii.setName("ii");
		EventTf etf_is = new EventTf();
		etf_is.setName("is");
		EventTf etf_il = new EventTf();
		etf_il.setName("il");
		EventTf etf_id = new EventTf();
		etf_id.setName("id");
		EventTf etf_im = new EventTf();
		etf_im.setName("im");
		 
		ActionTf atf_tongwh = new ActionTf();
		atf_tongwh.setName("tongwh");
		ActionTf atf_toffgwh = new ActionTf();
		atf_toffgwh.setName("toffgwh");
		ActionTf atf_dpf = new ActionTf();
		atf_dpf.setName("dpf");
		ActionTf atf_dps = new ActionTf();
		atf_dps.setName("dps");
		ActionTf atf_ips = new ActionTf();
		atf_ips.setName("ips");
		ActionTf atf_ipf = new ActionTf();
		atf_ipf.setName("ipf");
		
		
		ActionTf atf_Eps = new ActionTf();
		atf_Eps.setName("Eps");
		atf_Eps.setEpsilon();

		List<Tffst> rules = new ArrayList<Tffst>();

		//rule 1: if is\_high($T/H$) and increasing($T/H$) then turn\_on($GW_H$)
		rules.add(TestNOMS10Composition.ruletypeB(etf_ih, etf_ii, atf_tongwh));
		
		//if is\_high($T/H$) and steady($T/H$) then turn\_on($GW_H$)
		rules.add(TestNOMS10Composition.ruletypeB(etf_ih, etf_is, atf_tongwh));

		//if is\_low($T/H$) and steady($T/H$) then turn\_off($GW_H$)
		rules.add(TestNOMS10Composition.ruletypeB(etf_il, etf_is, atf_toffgwh));

		//if is\_low($T/H$) and decreasing($T/H$) then turn\_off($GW_H$)
		rules.add(TestNOMS10Composition.ruletypeB(etf_il, etf_id, atf_toffgwh));

		//if is\_low($T/H$) and increasing($T/H$) then decrease\_price\_fast
		rules.add(TestNOMS10Composition.ruletypeB(etf_il, etf_ii, atf_dpf));
				
		//if is\_medium($T/H$) and steady($T/H$) then decrease\_price\_slow
		rules.add(TestNOMS10Composition.ruletypeB(etf_im, etf_is, atf_dps));

		//if is\_medium($T/H$) and decreasing($T/H$) then  decrease\_price\_fast
		rules.add(TestNOMS10Composition.ruletypeB(etf_im, etf_id, atf_dpf));
		
		//if is\_high($T/H$) and steady($T/H$) then increase\_price\_slow
		rules.add(TestNOMS10Composition.ruletypeB(etf_ih, etf_is, atf_ips));
		
		//if is\_high($T/H$) and decreasing($T/H$) then  decrease\_price\_slow
		rules.add(TestNOMS10Composition.ruletypeB(etf_ih, etf_id, atf_dps));
		
		//if is\_high($T/H$) and increasing($T/H$) then increase\_price\_fast
		rules.add(TestNOMS10Composition.ruletypeB(etf_ih, etf_ii, atf_ipf));
		
		//if new\_price(gwX) and\\ price(gwX) < current\_price(defaultGW)\\ then setGW(gwX)

		Tffst rulescomposition = Tffst.all();

		for (Iterator<Tffst> iterator = rules.iterator(); iterator.hasNext();) {
			Tffst tffst = (Tffst) iterator.next();
			rulescomposition = rulescomposition.composition(tffst);
		}

        Utils.showDot(rulescomposition.toDot("composition"));

		//Tffsr rulesunionR = rulescomposition.toTffsr();
		//
        //rulesunionR.reverse();
		//rulesunionR.reverse();
		//        
		//rulescomposition = rulesunionR.toTffst();
        
        rulescomposition.setDeterministic(false); //
        rulescomposition.determinize(); //

        Utils.showDot(rulescomposition.toDot("determinized"));

//		String lupa = LupaExporter.toLupa(rulescomposition, "src/fsm_template.lua"); //
//
//		//		System.out.println(lupa);
		
//		try {
//			FileWriter fstream = new FileWriter("out.lua");
//			BufferedWriter bw = new BufferedWriter(fstream);
//			bw.write(lupa);
//			bw.close();
//		} catch (Exception e) {// Catch exception if any
//			System.err.println("Error: " + e.getMessage());
//		}

	}


}