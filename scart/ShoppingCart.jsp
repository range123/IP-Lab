<%@ page errorPage="errorpage.jsp" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="cart" scope="session" class="beans.ShoppingCart" />
<html>
  <head>
    <title>Shopping Cart Contents</title>
  </head>
  <body>
    <center>
    <table width="300" border="1" cellspacing="0"
      cellpadding="2" border="0">
      <caption><b>Shopping Cart Contents</b></caption>
      <tr>
        <th>Description</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Subtotal</th>
      </tr>
    <%
      Enumeration e = cart.getEnumeration();
      String[] tmpItem;
      // Iterate over the cart
      while (e.hasMoreElements()) {
        tmpItem = (String[])e.nextElement();
        %>
        <tr>
          <td><%=tmpItem[1] %></td>
          <td align="center">$<%=tmpItem[2] %></td>
          <td align="center"><%=tmpItem[3] %></td>
          <td align="center">$<%=Float.parseFloat(tmpItem[2])*Integer.parseInt(tmpItem[3]) %></td>
        </tr>
        <%
      }
    %> 
    </table>
    <h1> Total cost = $<%=cart.getCost() %></h1>
    </center>
    <a href="AddToShoppingCart.jsp">Back to Catalog</a>
  </body>
</html>
