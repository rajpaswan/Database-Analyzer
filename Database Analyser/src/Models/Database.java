/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Raj Kishor
 */
public class Database {
    private String _name;
    private List<Table> _tables;
    
    public Database(String name){
        _name = name;
        _tables = new LinkedList<Table>();
    }
     public void Rename(String newName){
        _name = newName;
    }
    
    public void AddTable(String tableName){
        Table table = new Table(tableName);
        _tables.add(table);
    }
    
    public void DropTable(String tableName){
        Table table = getTable(tableName);
        if(table!=null)
        _tables.remove(tableName);
    }
    
    public void RenameTable(String tableName, String newName){
        Table table = getTable(tableName);
        if(table!=null)
            table.Rename(newName);
    }
    
    private Table getTable(String tableName){
        for (Table table : _tables){
            if(table.getName().equals(tableName))
                return table;
        }
        return null;
    }
    
}
