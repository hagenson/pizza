package com.hagenson.pizza.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.PreDestroy;

import org.hibernate.*;
import org.hibernate.criterion.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.hagenson.pizza.IOrderManager;
import com.hagenson.pizza.Order;
import com.hagenson.pizza.OrderState;

public class OrderManagerImpl extends ServiceBase implements IOrderManager {

  public List<Order> getActiveOrders() {
    return listByState(OrderState.Processing);
  }

  public List<Order> getDeliveryOrders() {
    return listByState(OrderState.Delivery);
  }

  public void dispatchOrder(int id) {
    changeOrderState(id, OrderState.Delivery);
  }

  public List<Order> getTroubledOrders(){
    List<Order> result = new ArrayList<Order>();
    // Get all orders that haven't been dispatched in 20 minutes
    Calendar cal = Calendar.getInstance();
    cal.setTime(new Date());
    cal.add(Calendar.MINUTE, -20);
    Date refDate = cal.getTime();
    
    for(Object order: session.createCriteria(Order.class)
      .add(Restrictions.eq("state", OrderState.Processing))
      .add(Restrictions.lt("date", refDate))
      .addOrder(org.hibernate.criterion.Order.asc("date"))
      .list())
    {
      result.add((Order)order);
    }
    
    // Get all orders that haven't been delivered in 15 minutes (take cook time into account )
    // TODO: Need a dispatch time on the order class
    cal.setTime(new Date());
    cal.add(Calendar.MINUTE, -35);
    refDate = cal.getTime();
    for(Object order: session.createCriteria(Order.class)
        .add(Restrictions.eq("state", OrderState.Delivery))
        .add(Restrictions.lt("date", refDate))
        .addOrder(org.hibernate.criterion.Order.asc("date"))
        .list())
      {
        result.add((Order)order);
      }
    return result;
  }
  
  public void closeOrder(int id) {
    changeOrderState(id, OrderState.Closed);
  }
  


  private void changeOrderState(int id, OrderState newState) {
    Order order = (Order)session.get(Order.class, id);
    order.setState(newState);
    session.saveOrUpdate(order);
    session.flush();
  }

  @SuppressWarnings("unchecked")
  public List<Order> listByState(OrderState state) {
    return session.createCriteria(Order.class)
      .add(Restrictions.eq("state", state))
      .addOrder(org.hibernate.criterion.Order.asc("date"))
      .list();
  }
  
}
