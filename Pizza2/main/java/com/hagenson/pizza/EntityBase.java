package com.hagenson.pizza;


public class EntityBase {

  public boolean equals(Object obj){
    if (id == 0)
      return super.equals(obj);
    else
      return obj != null &&
      obj.getClass() == this.getClass() &&
      this.getClass().cast(obj).getId() == this.id;
  }
  
  
  public int hashCode(){
    if (id == 0)
      return super.hashCode();
    else
      return id;
  }
  
  
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }
  
  private int id;

}
