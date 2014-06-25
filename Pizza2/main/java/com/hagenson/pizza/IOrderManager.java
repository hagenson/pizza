package com.hagenson.pizza;

import java.util.List;

public interface IOrderManager {
  List<Order> getActiveOrders();
  
  List<Order> getDeliveryOrders();
  
  void dispatchOrder(int id);
  
  void closeOrder(int id);
  
  List<Order> getTroubledOrders();
}
