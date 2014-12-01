/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Application;

import Parser.Category;
import Parser.Query;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;

/**
 *
 * @author Raj Kishor
 */
public class ReaderExample {

    public static void main(String[] args) {

            BufferedReader br = null;
            LinkedList<Query> query_list = null;
            LinkedList<Category> cat_list = new LinkedList<>();
            int[] cat_count = new int[13];
            
            try {

                    String currentLine;
                    String fileContent="";

                    br = new BufferedReader(new FileReader("C:\\Users\\Raj Kishor\\Documents\\NetBeansProjects\\"
                            + "Database Analyser\\src\\Application\\update_1.sql"));

                    while ((currentLine = br.readLine()) != null) {
                        fileContent += currentLine +" ";
                        //System.out.println(currentLine);
                    }

                    
                    //remove comments
                    fileContent = fileContent.replaceAll("/\\*.*\\*/"," ");
                    //fileContent = fileContent.replaceAll("#", "//");                    
                    
                    //remove back qoutes
                    fileContent = fileContent.replaceAll("[`\\[\\]]"," ");

                    //remove white spaces
                    fileContent = fileContent.replaceAll("[ \\t\\n\\x0b\\r\\f]+"," ");

                    String[] queries = fileContent.split(";");
                    query_list = new LinkedList<>();

                    int i=1,j=0;
                    
                    for(String query : queries){
                        if(!query.trim().equals("")){
                            Query q = new Query(query);
                            query_list.add(q);
                            
                            if(!cat_list.contains(q.getCategoty())){
                                cat_list.add(q.getCategoty());
                            }
                            j = cat_list.indexOf(q.getCategoty());
                            cat_count[j]++;
                            
                            System.out.println(i++ + "["+ q.getCategoty()+"]"+q.toString()+" ;");
                        }
                    }
                    
                    j = 0;
                    for (Category cat : cat_list) {
                        System.out.println(cat.toString()+" => "+ cat_count[j++]);
                    }

            } catch (IOException e) {
                    e.printStackTrace();
            } finally {
                    try {
                            if (br != null)br.close();
                    } catch (IOException ex) {
                            ex.printStackTrace();
                    }
            }

	}
}
