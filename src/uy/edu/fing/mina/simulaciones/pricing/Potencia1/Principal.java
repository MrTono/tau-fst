package uy.edu.fing.mina.simulaciones.pricing.Potencia1;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Set;

import uy.edu.fing.mina.fsa.tffst.Tffst;
import uy.edu.fing.mina.fsa.utils.Utils;
import uy.edu.fing.mina.lupa.LupaExporter;
import uy.edu.fing.mina.lupa.exceptions.UnsupportedTFFSTException;

public class Principal {
	
	public static String readFile(String f) {
		File aFile = new File(f);
		StringBuilder contents = new StringBuilder();
		try {
			BufferedReader input = new BufferedReader(new FileReader(aFile));
			try {
				String line = null; // not declared within while loop
				while ((line = input.readLine()) != null) {
					contents.append(line);
					contents.append(System.getProperty("line.separator"));
				}
			} finally {
				input.close();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}

		return contents.toString();

	}
	
	public static void main(String[] args){
		Tffst.setMinimizeAlways(false);
		Reglas.getInstance().construirReglas();
		Set<Tffst> reglas = Reglas.getInstance().getReglas();
		
		Tffst rulesunion = Tffst.makeEmpty();
		
		// this is to print only one rule per rule
		
		for (Tffst regla : reglas) {
//			regla = regla.kleene();
			rulesunion = rulesunion.union(regla); // Esta parte es para la unión de las reglas
			//Utils.showDot(regla.toDot(""));
		}
		
			
		rulesunion = rulesunion.kleene();
	//	Utils.showDot(rulesunion.toDot(""));	// Esta parte imprime la unión de las reglas
		
//		String lupa = LupaExporter.toLupa(rulesunion, "src/fsm_template.lua");
        
		rulesunion.setDeterministic(true);
        rulesunion.determinize();
        Utils.showDot(rulesunion.toDot("")); // esta parte imprime la determinización
        

        try{
        	LupaExporter.generateLupaFiles(rulesunion, "src/fsm_template.lua", "potenciaClients2");
        } catch (UnsupportedTFFSTException ex) {
        	System.err.println(" ERROR: An unsupported TFFST was detected when trying to export it to LUPA.");
        	System.err.println(ex.getMessage());
        	ex.printStackTrace();
        }
		

//		String template = readFile("src/fsm_template_paco.lua");
//		String out = template.replace("--datahere--", lupa);

//		System.out.println(lupa);
//		try {
//			FileWriter fstream = new FileWriter("out5.lua");
//			BufferedWriter bw = new BufferedWriter(fstream);
//			bw.write(lupa);
//			bw.close();
//		} catch (Exception e) {// Catch exception if any
//			System.err.println("Error: " + e.getMessage());
//		}
	}
	
}