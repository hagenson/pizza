package com.hagenson.pizza.impl;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.*;

import com.hagenson.pizza.*;

@Configuration
public class AppSingletons {
  
  @Bean 
  @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
  public Session session(){
    return Database.openSession();
//    if (session == null || !session.isOpen())
//      session = Database.openSession();
//    return session;
  }
  
  @Bean
  @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
  public IVisitorManager visitorManager(){
    VisitorManagerImpl result = new VisitorManagerImpl();
//    result.setSession(session());
    return result;
  }
  
  @Bean
  @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
  public IShoppingCart shoppingCart(){
    ShoppingCartImpl result = new ShoppingCartImpl();
//    result.setSession(session());
//    result.setVisitorManager(visitorManager());
    return result;
  }
  
  @Bean
  @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
  public ICatalogueManager catalogueManager() {
    CatalogueManagerImpl result = new CatalogueManagerImpl();
//    result.setSession(session());
    return result;
  }

  @Bean
  @Scope(value = "request", proxyMode = ScopedProxyMode.INTERFACES)
  public IOrderManager orderManager(){
    OrderManagerImpl result = new OrderManagerImpl();
//    result.setSession(session());
    return result;
  }

  private Session session;
}
