package uy.edu.fing.mina.fsa.test;

import java.util.HashSet;
import java.util.Set;

import uy.edu.fing.mina.fsa.tf.SimpleTf;
import uy.edu.fing.mina.fsa.tf.TfI;
import uy.edu.fing.mina.fsa.tffst.State;
import uy.edu.fing.mina.fsa.tffst.Tffst;
import uy.edu.fing.mina.fsa.tffst.Transition;
import uy.edu.fing.mina.fsa.utils.Utils;

public class RateAndPower_1 {

  public Tffst ruleTemplate(TfI tfinp1,TfI tfinp2,TfI tfinp3,TfI tfout4,TfI tfout5) {
    
    State s0 = new State();
    State s1 = new State();
    State s2 = new State();
    State s3 = new State();
    State s4 = new State();
    State s5 = new State();

    Tffst tffst = new Tffst();
    tffst.setInitialState(s0);
    s5.setAccept(true);
    
    s0.addTransition(new Transition(tfinp1, SimpleTf.Epsilon(),s1));
    s0.addTransition(new Transition(tfinp1.not(), tfinp1.not(),s0,1));

    s1.addTransition(new Transition(tfinp2, SimpleTf.Epsilon(),s2));
    s1.addTransition(new Transition(tfinp2.not(), tfinp2.not(),s1,1));

    s2.addTransition(new Transition(tfinp3, SimpleTf.Epsilon(),s3));
    s2.addTransition(new Transition(tfinp3.not(), tfinp3.not(),s2,1));

    s3.addTransition(new Transition(SimpleTf.Epsilon(), tfout4,s4));
    s4.addTransition(new Transition(SimpleTf.Epsilon(), tfout5,s5));
    
    Utils.showDot(tffst.toDot("before"));
    
    tffst.inLabelEpsilonRemoval();
    
    return tffst;
  }
  
  
  
  public static void main(String[] args) {

    
//                Inputs                 |       Outputs
// -------------------------------------------------------------   
//    Loss     | Rate       | Power      |  Rate    |  Power
// -------------------------------------------------------------   
//    not low  |            | high       | decrease |   keep
//    not low  |            | not high   | keep     |  increase
//    low      |            | increase   | keep     |
                                          
//Inputs                       |  Outputs       
// ---------------------------------------------------------------------   
//Loss     |  Rate     | Power |  Rate      |    Power   
// ---------------------------------------------------------------------   
//not low  |  not low  |       |  decrease  |    keep    
//not low  |  low      |  high |  keep      |    keep    
//not low  |  low not  |  high |  keep      |    increase    
//low      |  not low  |       |  keep      |    decrease    
//low      |  high     |  low  |  keep      |    keep    
//low      |  not high |  low  |  increase  |    keep    
    
    
    RateAndPower_1 rap = new RateAndPower_1();
    
    Set<Tffst> rules = new HashSet<Tffst>();
    
    rules.add(rap.ruleTemplate((new SimpleTf("ll")).not(), SimpleTf.Epsilon(), new SimpleTf("hp"), new SimpleTf("dr"), new SimpleTf("kp")));
//    rules.add(rap.ruleTemplate((new SimpleTf("ll")).not(), SimpleTf.Epsilon(), (new SimpleTf("hp")).not(), new SimpleTf("kr"), new SimpleTf("ip")));
//    rules.add(rap.ruleTemplate(new SimpleTf("ll"), SimpleTf.Epsilon(), (new SimpleTf("pi")).not(), new SimpleTf("kr"), SimpleTf.Epsilon()));
    
    for (Tffst tffst : rules) {
      Utils.showDot(tffst.toDot(""));
    }
    
    
  }
  
  
}




