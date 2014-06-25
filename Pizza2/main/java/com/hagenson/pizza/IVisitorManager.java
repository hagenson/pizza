package com.hagenson.pizza;

public interface IVisitorManager {
  
  public String getCookieValue();
  
  public void setCookieValue(String value);
  
  public Visitor getCurrentVisitor();
}
