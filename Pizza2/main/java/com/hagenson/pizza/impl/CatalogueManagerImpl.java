package com.hagenson.pizza.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PreDestroy;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hagenson.pizza.*;

public class CatalogueManagerImpl extends ServiceBase implements ICatalogueManager {

  @SuppressWarnings("unchecked")
  public List<Product> getProducts() {
    Criteria crit = session.createCriteria(Product.class)
      .addOrder(org.hibernate.criterion.Order.asc("displayOrder"));
  
    return crit.list();
  }
  

}
