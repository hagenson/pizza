package com.hagenson.pizza.impl;


import org.hibernate.cfg.*;
import org.hibernate.tool.hbm2ddl.*;

public class SchemaGen {
  public static void main(String[] args){
    System.err.close();
    Configuration config = Database.getConfig();
    SchemaExport schemaExport = new SchemaExport(config);
    schemaExport.setDelimiter("\ngo");
    schemaExport.create(true, false);
  }
}
