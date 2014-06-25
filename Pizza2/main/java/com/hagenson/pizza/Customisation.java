package com.hagenson.pizza;

import javax.persistence.*;

@Entity
public class Customisation extends EntityBase{
  
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  public int getId() {
    return super.getId();
  }

  public String getName() {
    return name;
  }

  public void setName(String value) {
    name = value;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double value) {
    price = value;
  }

  @ManyToOne
  @JoinColumn(name="product")
  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }

  private String name;
  private double price;
  private Product product;
}
