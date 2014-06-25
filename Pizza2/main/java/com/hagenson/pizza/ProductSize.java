package com.hagenson.pizza;

import javax.persistence.*;

@Entity
public class ProductSize extends EntityBase{
  
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  public int getId() {
    return super.getId();
  }
  
  public String getName() {
    return name;
  }
  
  public void setName(String name) {
    this.name = name;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double value) {
    this.price = value;
  }

  @ManyToOne
  @JoinColumn(name = "product")
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
