package com.hagenson.pizza.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hagenson.pizza.*;

@Controller
public class OrderController {
  
  @RequestMapping("/order/index.html")
  public ModelAndView index(String op, String id){
    // TODO: enforce access permissions before doing anything
    
    // Perform any operations
    if("disp".equals(op)){
      orderManager.dispatchOrder(Integer.parseInt(id));
    }
    else if ("clos".equals(op)){
      orderManager.closeOrder(Integer.parseInt(id));
    }
    
    // Return the active orders
    ModelAndView result = new ModelAndView("order/index");
    result.addObject("process", orderManager.getActiveOrders());
    result.addObject("deliver", orderManager.getDeliveryOrders());
    return result;
  }
  
  
  @Autowired
  public void setOrderManager(IOrderManager orderManager) {
    this.orderManager = orderManager;
  }


  private IOrderManager orderManager;
}
