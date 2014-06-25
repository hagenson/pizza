package com.hagenson.pizza.impl;

import java.util.List;

import javax.annotation.PreDestroy;

import org.hibernate.*;
import org.hibernate.type.Type;
import org.hibernate.type.TypeHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagenson.pizza.*;

public class ShoppingCartImpl extends ServiceBase implements IShoppingCart {

  public Order getOrder() {
    Visitor visitor = visitorManager.getCurrentVisitor();
    // Is there an open order for the current visitor?
    if (visitor.getCurrentOrder() == null
        || visitor.getCurrentOrder().getState() != OrderState.Open) {
      visitor.setCurrentOrder(new Order());
      session.saveOrUpdate(visitor);
      session.flush();
    }

    return visitor.getCurrentOrder();
  }

  public void updateOrder() throws Exception {

    // Check we have an order in the correct state to update
    Visitor visitor = visitorManager.getCurrentVisitor();
    if (visitor == null)
      throw new IllegalStateException("There is no current visitor.");

    Order order = visitor.getCurrentOrder();

    if (order == null)
      throw new IllegalStateException("There is no current order.");

    if (order.getState() != OrderState.Open)
      throw new IllegalStateException(
          "The current order is not open for update.");

    // Validate the order
    for (LineItem item : order.getLines()) {
      if (item.getProduct() == null)
        throw new IllegalStateException(
            "The order line item must have a product.");

      for (Customisation cust : item.getCustomisations()) {
        if (!item.getProduct().getCustomisations().contains(cust))
          throw new IllegalStateException(String.format(
              "The product {0} cannot be customised with {1}", item
                  .getProduct().getName(), cust.getName()));
      }
    }

    session.saveOrUpdate(order);
    session.flush();

  }

  public void cancelOrder() throws Exception {
    if (visitorManager.getCurrentVisitor() != null
        && visitorManager.getCurrentVisitor().getCurrentOrder() != null) {
      Visitor visitor = visitorManager.getCurrentVisitor();
      Order order = visitor.getCurrentOrder();
      order.setState(OrderState.Cancelled);
      visitor.setCurrentOrder(null);
      session.saveOrUpdate(order);
      session.saveOrUpdate(visitor);
      session.flush();
    }
  }

  public void processOrder() {
    Order order = getOrder();
    if (order.getState() == OrderState.Open) {
      order.setState(OrderState.Processing);
      session.saveOrUpdate(order);
      session.flush();
    }
  }

  public void addProduct(int sizeId, int[] customisations) {
    Order order = getOrder();

    // Get the product and size to add
    ProductSize size = (ProductSize) session.get(ProductSize.class, sizeId);

    @SuppressWarnings("unchecked")
    List<Product> prods = session.createCriteria(Product.class).list();
    Product prod = null;
    for (Product cur : prods) {
      if (cur.getSizes().contains(size)) {
        prod = cur;
        break;
      }
    }

    // Do we already have a non-custom product of this type?
    LineItem itm = null;
    for (LineItem cur : order.getLines()) {
      if (cur.getCustomisations().size() == 0 && prod.equals(cur.getProduct())
          && size.equals(cur.getSize())) {
        itm = cur;
        break;
      }
    }

    if (itm == null) {
      itm = new LineItem();
      itm.setProduct(prod);
      itm.setSize(size);
      itm.setCount(1);
      order.getLines().add(itm);
    } else {
      itm.setCount(itm.getCount() + 1);
    }

    // Handle any customisations
    for (int i = 0; i < customisations.length; i++) {
      Customisation cust = (Customisation) session.get(Customisation.class,
          customisations[i]);
      itm.getCustomisations().add(cust);
    }

    session.saveOrUpdate(order);
    session.flush();
  }

  public void incrementLine(int lineId) {
    Order order = getOrder();
    LineItem itm = findById(order.getLines(), lineId);
    itm.setCount(itm.getCount() + 1);
    session.saveOrUpdate(itm);
    session.flush();

  }

  public void decrementLine(int lineId) {
    Order order = getOrder();
    LineItem itm = findById(order.getLines(), lineId);
    itm.setCount(itm.getCount() - 1);
    if (itm.getCount() <= 0) {
      order.getLines().remove(itm);
      session.delete(itm);
      session.saveOrUpdate(order);
    } else {
      session.saveOrUpdate(itm);
    }
    session.flush();
  }

  public void assignCustomer(Customer customer) {
    Order order = getOrder();
    session.saveOrUpdate(customer);
    order.setCustomer(customer);
    session.saveOrUpdate(order);
    session.flush();
  }

  @Autowired
  public void setVisitorManager(IVisitorManager visitorManager) {
    this.visitorManager = visitorManager;
  }

  private <T extends EntityBase> T findById(List<T> list, int id) {
    for (T ent : list) {
      if (ent.getId() == id) {
        return ent;
      }
    }
    return null;
  }

  private IVisitorManager visitorManager;
}
