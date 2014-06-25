package com.hagenson.pizza.impl;

import javax.annotation.PreDestroy;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hagenson.pizza.IVisitorManager;
import com.hagenson.pizza.Visitor;

public class VisitorManagerImpl extends ServiceBase implements IVisitorManager {

  public void setCookieValue(String value) {
    visitor = null;
    if (value != null && value.length() > 0) {
      visitor = (Visitor) session.get(Visitor.class, value);
    }

  }

  public String getCookieValue() {
    return getCurrentVisitor().getId().toString();
  }

  public Visitor getCurrentVisitor() {
    if (visitor == null) {
      visitor = new Visitor();
      session.saveOrUpdate(visitor);
    }

    return visitor;
  }

  private Visitor visitor;
}
