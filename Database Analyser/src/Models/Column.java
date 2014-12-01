/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.AbstractList;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Raj Kishor
 */
public class Column {
   
    private String _name;
    private Datatype _datatype;
    private List<Constraint> _constraints;
    
    public Column(String name, Datatype datatype){
        _name = name;
        _datatype = datatype;
    }
    
    public void AddConstraint(Constraint constraint){
        if(_constraints==null)
        _constraints = new LinkedList<Constraint>();

        if(!_constraints.contains(constraint))
        _constraints.add(constraint);
    }
    
    public void DropConstraint(Constraint constraint){
        if(_constraints!=null)
        _constraints.remove(constraint);
    }
    
    public void Rename(String newName){
        _name = newName;
    }
    
    public void Retype(Datatype dataType){
        _datatype = dataType;
    }
    
    public String getName(){
        return _name;
    }
    
    public Datatype getDataType(){
        return _datatype;
    }
    
    public List<Constraint> Constraints(){
        return _constraints;
    }
}
