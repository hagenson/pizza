package com.hagenson.pizza.web.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.annotation.PreDestroy;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.hagenson.pizza.*;
import com.hagenson.pizza.impl.ServiceBase;

@Controller
public class PizzaController extends ServiceBase {

  @RequestMapping("/pizza/index.html")
  public ModelAndView index() throws Exception {
    // Get the current order
    List<Product> products = catalogueManager.getProducts();
    ModelAndView result = new ModelAndView("/pizza/index");
    result.addObject("products", products);
    return result;
  }

  @RequestMapping("/pizza/cart.html")
  public ModelAndView cart(String op, String id,
      @CookieValue(value = "v", defaultValue = "") String visitorId,
      HttpServletResponse response) throws Exception {
    // Set the current visitor
    visitorManager.setCookieValue(visitorId);

    // Is there an operation specified?
    if ("add".equals(op) && id != null && id.length() > 0) {
      shoppingCart.addProduct(Integer.parseInt(id), new int[0]);
    }
    else if ("inc".equals(op) && id != null && id.length() > 0) {
      shoppingCart.incrementLine(Integer.parseInt(id));
    }
    else if ("dec".equals(op) && id != null && id.length() > 0) {
      shoppingCart.decrementLine(Integer.parseInt(id));
    }
    else if ("cancel".equals(op)){
      shoppingCart.cancelOrder();
    }

    // Get the current order
    Order order = shoppingCart.getOrder();
    ModelAndView result = new ModelAndView("/pizza/cart");
    result.addObject("order", order);

    // Remember the visitor
    response.addCookie(new Cookie("v", visitorManager.getCookieValue()));
    return result;
  }
  
  @RequestMapping(value="/pizza/customCart.html")
  public ModelAndView customCart(
    String id,
    @CookieValue(value = "v", defaultValue = "") String visitorId,
    HttpServletRequest request,
    HttpServletResponse response) throws Exception {
    
    // Set the current visitor
    visitorManager.setCookieValue(visitorId);
   
    // Process the customisations
    List<Integer> customisations = new ArrayList<Integer>();
    for(Enumeration<String> i = request.getParameterNames(); i.hasMoreElements(); ){
      String key = i.nextElement();
      if (key.startsWith("cust"))
      {
        int cust = Integer.parseInt(key.substring(4));
        customisations.add(cust);
      }
    }
    
    // Add the custom product to the order
    int[] ids = new int[customisations.size()];
    for(int i = 0; i < ids.length; i++)
      ids[i] = customisations.get(i).intValue();
    shoppingCart.addProduct(Integer.parseInt(id), ids);
    
    // Get the current order
    Order order = shoppingCart.getOrder();
    ModelAndView result = new ModelAndView("/pizza/cart");
    result.addObject("order", order);

    // Remember the visitor
    response.addCookie(new Cookie("v", visitorManager.getCookieValue()));
    return result;
  }  
  @RequestMapping("/pizza/buy.html")
  public ModelAndView buy(
    @CookieValue(value = "v", defaultValue = "") String visitorId,
    HttpServletResponse response) throws Exception {
    
    // Set the current visitor
    visitorManager.setCookieValue(visitorId);
   
    // Get the current order
    Order order = shoppingCart.getOrder();
    ModelAndView result = new ModelAndView("/pizza/buy");
    result.addObject("order", order);

    // Remember the visitor
    response.addCookie(new Cookie("v", visitorManager.getCookieValue()));
    return result;
  }

  @RequestMapping(value="/pizza/custCreate.html", method = RequestMethod.POST)
  public ModelAndView custCreate(
    @ModelAttribute("customer")Customer customer,
    @CookieValue(value = "v", defaultValue = "") String visitorId,
    HttpServletResponse response) throws Exception {
    
    // Set the current visitor
    visitorManager.setCookieValue(visitorId);
   
    // Get the current order
    Order order = shoppingCart.getOrder();
    ModelAndView result = new ModelAndView("/pizza/cardEntry");
    result.addObject("order", order);
    
    // TODO: Is the customer valid?
    
    // Add the customer to the order
    order.setCustomer(customer);
    shoppingCart.assignCustomer(customer);

    // Remember the visitor
    response.addCookie(new Cookie("v", visitorManager.getCookieValue()));
    return result;
  }

  @RequestMapping(value="/pizza/orderProcess.html", method = RequestMethod.POST)
  public ModelAndView orderProcess(
    String cardNumber, String expiryDate, String cvc,
    @CookieValue(value = "v", defaultValue = "") String visitorId,
    HttpServletResponse response) throws Exception {
    
    // Set the current visitor
    visitorManager.setCookieValue(visitorId);
   
    // Get the current order
    Order order = shoppingCart.getOrder();
    ModelAndView result = new ModelAndView("/pizza/orderProcess");
    result.addObject("order", order);
    
    // TODO: In real life we would process the credit card payment here
    
    // Process the order
    shoppingCart.processOrder();

    // Remember the visitor
    response.addCookie(new Cookie("v", visitorManager.getCookieValue()));    
    return result;
  }

  
  @RequestMapping("/pizza/customise.html")
  public ModelAndView customise(
    int id) throws Exception {
    
    // Get the product being customised
    ProductSize size = (ProductSize)session.get(ProductSize.class, id);
    
    // Return the model
    ModelAndView result = new ModelAndView("/pizza/customise");
    result.addObject("size", size);
  
    return result;

  }

  @Autowired
  public void setShoppingCart(IShoppingCart shoppingCart) {
    this.shoppingCart = shoppingCart;
  }

  @Autowired
  public void setCatalogueManager(ICatalogueManager catalogueManager) {
    this.catalogueManager = catalogueManager;
  }

  @Autowired
  public void setVisitorManager(IVisitorManager visitorManager) {
    this.visitorManager = visitorManager;
  }

  private IShoppingCart shoppingCart;
  private ICatalogueManager catalogueManager;
  private IVisitorManager visitorManager;
}
