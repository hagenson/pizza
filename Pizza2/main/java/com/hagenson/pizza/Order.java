package com.hagenson.pizza;

import javax.persistence.*;

import java.util.*;

@Entity(name="`Order`")
public class Order extends EntityBase{
  public Order(){
    state = OrderState.Open;
    date = new Date();
  }
    
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  public int getId() {
    return super.getId();
  }



  @ManyToOne
  public Customer getCustomer() {
    return customer;
  };

  public void setCustomer(Customer value) {
    customer = value;
  };

  @OneToMany(cascade = {CascadeType.ALL})
  @JoinColumn(name = "`order`")
  public List<LineItem> getLines() {
    return lines;
  };
  
  protected void setLines(List<LineItem> value){
    lines = value;
  }

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  public OrderState getState() {
    return state;
  }

  public void setState(OrderState state) {
    this.state = state;
  }

  @Transient
  public double getPrice(){
    double result = 0;
    for(LineItem itm: getLines()){
      result += itm.getPrice();
    }    
    return result;
  }
  private Customer customer;
  private List<LineItem> lines = new ArrayList<LineItem>();
  private Date date;
  private OrderState state;
}
