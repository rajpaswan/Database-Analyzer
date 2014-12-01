/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parser;

/**
 *
 * @author Raj Kishor
 */
public class Token {
    
    public final int token;
    public final String sequence;
    
    public Token(int token, String sequence)
    {
      super();
      this.token = token;
      this.sequence = sequence.trim();
    }
    
    @Override
    public String toString(){
        if(token==10)
            return "";
        return sequence;
    }
  }
