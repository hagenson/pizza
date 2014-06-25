package com.hagenson.pizza;

import javax.persistence.*;

import java.util.*;

@Entity
public class Product extends EntityBase{
  
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  public int getId() {
    return super.getId();
  }

  public String getName() {
    return name;
  };

  public void setName(String value) {
    name = value;
  };

  public String getDescription() {
    return description;
  };

  public void setDescription(String value) {
    description = value;
  };

  public String getCategory() {
    return category;
  };

  public void setCategory(String value) {
    category = value;
  };

  @OneToMany(fetch=FetchType.LAZY)
  @JoinColumn(name="product")
  public List<ProductSize> getSizes(){
    return sizes;
  }
  
  protected void setSizes(List<ProductSize> value)
  {
    sizes = value;
  }
  
  @OneToMany(fetch = FetchType.LAZY)
  @JoinColumn(name = "Product")
  public List<Customisation> getCustomisations() {
    return customisations;
  }
  
  protected void setCustomisations(List<Customisation> value){
    customisations = value;
  }
  
  public int getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(int displayOrder) {
    this.displayOrder = displayOrder;
  }

  private String name;
  private String description;
  private String category;
  private int displayOrder;
  private List<ProductSize> sizes = new ArrayList<ProductSize>();
  private List<Customisation> customisations = new ArrayList<Customisation>();

}
