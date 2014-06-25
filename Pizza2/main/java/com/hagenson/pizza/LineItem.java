package com.hagenson.pizza;

import javax.persistence.*;

import java.util.*;

@Entity
public class LineItem extends EntityBase{
  
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  public int getId() {
    return super.getId();
  }

  @ManyToOne(fetch=FetchType.LAZY)
  @JoinColumn(name = "`order`")
  public Order getOrder(){ return order;}
  
  public void setOrder(Order value){ order = value;}
  
  @ManyToOne
  public Product getProduct() {
    return product;
  }

  public void setProduct(Product value) {
    product = value;
  }

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name="LineItemCustomisation",
    joinColumns = {@JoinColumn(name = "LineItem")},
    inverseJoinColumns = {@JoinColumn(name="Customisation")})
  public List<Customisation> getCustomisations() {
    return customisations;
  }
  
  protected void setCustomisations(List<Customisation> value){
    customisations = value;
  }
    

  public int getCount() {
    return count;
  }

  public void setCount(int value) {
    count = value;
  };

  @ManyToOne
  public ProductSize getSize()
  {
    return size;
  }
  
  public void setSize(ProductSize value)
  {
    size = value;
  }
  
  @Transient
  public double getPrice() {
    double result = 0;
    if (getSize() != null)
      result += getSize().getPrice();
    for (Customisation cust: getCustomisations()){
      result += cust.getPrice();
    }
    
    result *= getCount();
    
    return result;
  };

  private Product product;
  private List<Customisation> customisations = new ArrayList<Customisation>();
  private int count;
  private Order order;
  private ProductSize size;
}
