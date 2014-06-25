package com.hagenson.pizza;

import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;

@Entity
public class Visitor {
  
  public Visitor(){
    creationDate = new Date();
  }
  
  @Id
  @GenericGenerator(name = "generator", strategy = "guid", parameters = {})
  @GeneratedValue(generator = "generator")
  @Column(name="id", columnDefinition="uniqueidentifier")
  public String getId(){
    return id;
  }
  
  public void setId(String value){
    id = value;
  }
  
  @ManyToOne()
  @Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
  public Order getCurrentOrder(){
    return currentOrder;
  }
  
  public void setCurrentOrder(Order value){
    currentOrder = value;
  }
  
  
  public Date getCreationDate() {
    return creationDate;
  }

  public void setCreationDate(Date creationDate) {
    this.creationDate = creationDate;
  }

  
  public boolean equals(Object obj){
    if (id == null)
      return super.equals(obj);
    else
      return obj != null &&
      obj.getClass() == this.getClass() &&
      this.id.equals(this.getClass().cast(obj).getId());
  }
  
  public int hashCode(){
    if (id == null)
      return super.hashCode();
    else
      return id.hashCode();
  }
  
  private String id;
  private Order currentOrder;
  private Date creationDate;
}
