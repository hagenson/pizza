package com.hagenson.pizza.impl;

import javax.annotation.PreDestroy;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class ServiceBase {

  @Autowired
  public void setSession(Session session) {
    this.session = session;
    
  }

  @PreDestroy
  public void Done(){
//    if (session != null && session.isOpen())
//      session.close();
  }
    
  protected Session session;
}
