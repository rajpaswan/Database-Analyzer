/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parser;

import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Raj Kishor
 */
public class Query {
    
    private final LinkedList<Token> token_list;
    private static Tokenizer tokenizer;
    private Category category;
    
    public Query(String query){
        super();
        
        if(tokenizer==null){
            tokenizer = new Tokenizer();
            tokenizer.add("(CREATE|DROP|ALTER) (TABLE|TRIGGER|VIEW|PROCEDURE|INDEX|UNIQUE INDEX)", 1);
            tokenizer.add("(DROP|CHANGE|MODIFY) COLUMN|(ADD|DROP) (KEY|FOREIGN KEY|INDEX)|ADD",2);
            tokenizer.add("INSERT INTO|UPDATE|DELETE FROM|SELECT",3);
            tokenizer.add("(SET|DROP) DEFAULT|NULL|NOT NULL",4);
            tokenizer.add("(CHAR|INT|NVARCHAR)\\(([0-9])*\\)", 5);
            tokenizer.add("[a-zA-Z][a-zA-Z0-9_]*", 6);
            tokenizer.add("[(),;]", 7);
            tokenizer.add("[0-9]+",8);
            tokenizer.add(".",9);
            tokenizer.add("\\s+",10);
        }
        tokenizer.tokenize(query);
        token_list = tokenizer.getTokens();
    }
    
    public List<Token> getTokens(){
        return token_list;
    }
    
    @Override
    public String toString(){
        String query="";
        for(Token token : token_list){
            query+=token.toString()+" ";
        }
        return query;
    }
    
    public Category getCategoty(){
        
        category = Category.UnSpecified;
        
        if(token_list!=null){   
           
            switch(token_list.get(0).sequence.toUpperCase()){
                
                case "INSERT INTO": category = Category.Isertion; break;
                case "UPDATE": category = Category.Updatation; break;
                case "DELETE FROM": category = Category.Deletion; break;
                case "SELECT": category = Category.Selection; break;
                
                case "CREATE TABLE":
                case "CREATE TRIGGER":
                case "CREATE PROCEDURE": category = Category.Refinement; break;

                case "CREATE INDEX":
                case "CREATE UNIQUE INDEX": category = Category.Reinterpretation; break;
                    
                case "CREATE VIEW":
                case "DROP VIEW": category = Category.Redefination; break;

                case "DROP TABLE":
                case "DROP TRIGGER":
                case "DROP PROCEDURE": category = Category.Removal; break;

                case "ALTER TABLE":
                  
                    switch(token_list.get(2).sequence){
                       case "DROP COLUMN": category = Category.Removal;break;
                       case "ADD" : category = Category.Extension; break;
                       case "RENAME" : 
                       case "CHANGE COLUMN" : category = Category.Renaming; break;
                       case "ADD KEY": 
                       case "DROP KEY":
                       case "ADD FOREIGN KEY":
                       case "DROP FOREIGN KEY":
                       case "ADD INDEX":
                       case "DROP INDEX": category = Category.Reinterpretation; break;
                       case "MODIFY COLUMN":
                          
                           switch(token_list.get(4).sequence){
                               case "SET DEFAULT":
                               case "DROP DEFAULT": category = Category.DefaultValue ; break;
                               case "NULL":
                               case "NOT NULL": category = Category.Optionality; break;
                               default : category = Category.Retyping;
                           } break;

                   } break;
            }
        }
        
        return category;
    }
}
