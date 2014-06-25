package com.hagenson.pizza;

public interface IShoppingCart {
	
  Order getOrder() throws Exception;
  
  void updateOrder() throws Exception;
  
  void cancelOrder() throws Exception;
  
  void processOrder() throws Exception;
  
  void addProduct(int sizeId, int[] customisations);
  
  void incrementLine(int lineId);
  
  void decrementLine(int lineId);

  void assignCustomer(Customer customer);
}
