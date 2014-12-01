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
public class Table {
    
    private String _name;
    private List<Column> _columns;
    
    public Table(String name){
        _name = name;
        _columns = new LinkedList<Column>();
    }

    public void Rename(String newName){
        _name = newName;
    }
    
    public void AddColumn(String columnName, Datatype dataType){
        Column column = new Column(columnName, dataType);
        _columns.add(column);
    }
    
    public void DropColumn(String columnName){
        Column column = getColumn(columnName);
        if(column!=null)
        _columns.remove(columnName);
    }
    
    public void RenameColumn(String columnName, String newName){
        Column column = getColumn(columnName);
        if(column!=null)
            column.Rename(newName);
    }
    
    public void RetypeColumn(String columnName, Datatype dataType){
        Column column = getColumn(columnName);
        if(column!=null)
            column.Retype(dataType);
    }
    
    public void AddConstraint(String columnName, Constraint constraint){
        Column column = getColumn(columnName);
        if(column!=null)
            column.AddConstraint(constraint);
    }
    
    public void DropConstraint(String columnName, Constraint constraint){
        Column column = getColumn(columnName);
        if(column!=null)
            column.DropConstraint(constraint);
    }
    
    public String getName(){
        return _name;
    }
    
    public List<Column> Columns(){
        return _columns;
    }
    
    private Column getColumn(String columnName){
        for (Column column : _columns){
            if(column.getName().equals(columnName))
                return column;
        }
        return null;
    }
}
