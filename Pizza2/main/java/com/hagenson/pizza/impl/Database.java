package com.hagenson.pizza.impl;

import org.hibernate.*;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.*;

import com.hagenson.pizza.*;

public class Database {

  public static Session openSession() {
    return getSessionFactory().openSession();
  }

  public static SessionFactory getSessionFactory() {
    if (factory == null)
      factory = createSessionFactory();
    return factory;
  }

  public static SessionFactory createSessionFactory() {
    Configuration config = getConfig();

    StandardServiceRegistryBuilder serviceRegistryBuilder = new StandardServiceRegistryBuilder();

    serviceRegistryBuilder.applySettings(config.getProperties());

    ServiceRegistry serviceRegistry = serviceRegistryBuilder.build();

    return config.buildSessionFactory(serviceRegistry);
  }

  public static Configuration getConfig() {
    Configuration config = new Configuration()
        .addAnnotatedClass(Customer.class)
        .addAnnotatedClass(Customisation.class)
        .addAnnotatedClass(LineItem.class)
        .addAnnotatedClass(Order.class)
        .addAnnotatedClass(Product.class)
        .addAnnotatedClass(ProductSize.class)
        .addAnnotatedClass(Visitor.class);
    config.configure();
    return config;
  }

  private static SessionFactory factory;

}
