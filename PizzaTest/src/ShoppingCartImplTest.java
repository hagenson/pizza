import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.hagenson.pizza.*;
import com.hagenson.pizza.impl.*;

import junit.framework.TestCase;

@Service
public class ShoppingCartImplTest extends TestCase {

  public void testOrderLogic() throws Exception
  {
    // Check we always get an order
    Order order = uut.getOrder();
    assertNotNull(order);
    
    // Check the same order is retrieved the next time
    int id = order.getId();
    order = uut.getOrder();
    assertNotNull(order);
    assertEquals(id, order.getId());
    
    // Check cancel clears the order
    uut.cancelOrder();
    order = uut.getOrder();
    assertNotSame(id, order.getId());
  }
  
  public void testOrderUpdate() throws Exception{
    
    // Get an order
    Order order = uut.getOrder();
    
    // Change it
    LineItem itm = new LineItem();
    itm.setProduct(peperoniPizza);
    itm.getCustomisations().add(peperoniPizza.getCustomisations().get(0));
    itm.setCount(1);
    order.getLines().add(itm);
    
    // Update it
    uut.updateOrder();
    
    // Make sure we get it back ok
    order = uut.getOrder();
    assertEquals(1, order.getLines().size());
    assertEquals(1, order.getLines().get(0).getCustomisations().size());
    
    // Try an illegal customisation
    order.getLines().get(0).getCustomisations().add(magheritaPizza.getCustomisations().get(0));
    try
    {
      uut.updateOrder();
      fail("Expected exception for invalid customisation.");
    }
    catch(Exception e)
    {
      assertTrue(e.getClass() == IllegalStateException.class);
    }
  }
  
  protected void setUp() throws Exception
  {
    super.setUp();
    
    session = Database.openSession();
    visitor = new Visitor();
    session.save(visitor);
    session.flush();
    visitorManager = new VisitorManagerImpl();
    visitorManager.setSession(session);
    
    uut = new ShoppingCartImpl();
    uut.setSession(session);
    uut.setVisitorManager(visitorManager);
    
    // Get some data to play with
    magheritaPizza = (Product)session.get(Product.class, 1);
    peperoniPizza = (Product)session.get(Product.class, 2);    
  }
  
  private Session session;
  private ShoppingCartImpl uut;
  private Visitor visitor;
  private VisitorManagerImpl visitorManager;
  private Product peperoniPizza;
  private Product magheritaPizza;
  
}

