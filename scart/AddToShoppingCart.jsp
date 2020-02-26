<%@ page errorPage="errorpage.jsp" %>

<jsp:useBean id="cart" scope="session" class="beans.ShoppingCart" />
<html>
  <head>
    <title>Shopping Catalog</title>
    <script type="text/javascript">
      function test(id){
        // console.log('test')
        // var but = document.getElementById(id)
        // but.insertAdjacentHTML("afterend", "<input type=\"hidden\" name=\"type\" value=\"remove\">");
        document.getElementById(id+'ff').value="remove";
        document.getElementById(id+'f').submit();
      }
    </script>
    <style type="text/css">
      .add {
        width: 100%;
        height: 100%;
      }
      img {
        width: 200px
        height: 300px;
      }
    </style>
  </head>
  <body>
  <%
    String id = request.getParameter("id");
      if ( id != null ) {
        String type = request.getParameter("type");

        if(type.equals("add")){
          String desc = request.getParameter("desc");
          Float price = new Float(request.getParameter("price"));
          cart.addItem(id, desc, price.floatValue(), Integer.parseInt(request.getParameter("quantity"))); 
        }
        else{

          
          cart.removeItem(id);
        }
      }
  %>
  <a href="ShoppingCart.jsp"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQMAAADCCAMAAAB6zFdcAAAAYFBMVEX///8op+AAod4Wo9+g0++v2vGY0O6IyesIot6y2fHh8Pkfpd/Z7vnN5vbS6ve23fL4/f6m1vDt9/zr9vx+xeq94PRvv+jz+v05rOJdueZQteXE4/VJsuSTze1ywOi43/ObpsjLAAAOLElEQVR4nO1d24KyOAweqAeGoqIioqLz/m+5gIfWpNgEysl/v4u92HWHJm3TJF/S/vx8JeJMenbkySYeeqTd4UZRgSel78+GHmpXSAKKCir4ydCD7QZzn6yCQgnroYfbBQ6kjfDaEF+5EGaCpYN86PF2AZpBVBh6vF2AdC6qdZANPd4OsOMtg6+0Byv6wVjCvww94A6w/d8k/qScvSC949Dj7QLIJMpaCD/9ShUwTGK+CIcebTdYAUdZfm1UVA9oEoPV0CPqH9AkBvuhR9Q/oEmUQw+of+zAVpCnoUfUP6CXKK9Dj6h/IJP4ja6wBdAk+l/qAnwCNInB0APqH0foIZ2HHlH/QCZxOfSI+gfMJYrD0CPqGzE2idHQY+oW8XG3D9eXw3w7Wybp6ZxnZT7gm01ifNyXEv/Nt4tS4jzLPCkD3w98IaQU94QA0MC0s0RxMcXR+rLZzhbL22OKC4mDu8TSLDHGhBKmL4kX11LiSmBRTHEglMR2gQ0Q86FFq8OxWNSrYhsvrtWi9qQQhby6xI0ENmAsZOKumOJC4tljG0u/xNuidiWxQQdD1BfEpcSFqZ5dDRKLbgXG6MMkFhKvV5fDdnZNbtWqDuAc9ymxQQc3x/LGx+o03tzPprOS2P02dgWxbSXx8S7xr5K4WtYfT+PRIWCYxDiMovJs+t0WZ5OSmHsajw4+mUHZJx5c1JOUGIFOq/8F3yExhkyJKjhwCpimBUGkmOIJqUBxpfd/iod/6T8Bfk/Np/LY+qFQ2SvpZVl+Pp3SW5Isr9fFbDvfHC6r1XodheF+d4x/QBLJ39F0cBqTLXjNsyhmVxuYT+PL1u8LgWwSe5ZSH+JzWZcr2g/K9e1l+emWXBfb+WUVarNDzISANU2mmHoTUxufrCT2SonTSuLDKioWM4hvzi8dUCcUFOWRKaasE4GDamJLKc/lxBY79zB/KUEmpcRW90UxBdQEOeAWfGo+lVvQiCQv964yWGmyLOb177IO92Bio9dmpVVFxNo3aOc85BaIVoRdxfWYa/Uv8t/NZRUV03q0hOpcHezVwIgkAeAWpEdNHqw/VvM9RBb3yfald5/rq1qm5Aidq4NQzSrR11kAc0CmmJCPdN/Rd8dDPkSezQ+XdbQ/xk/Najls6oe4OrioySESJeCYZ1BMwJDIU7mjC9cjCj9YLWWzyaEZVwfKhlJLioBlExviyH5+kneDQMvEJkoHVCKHqwNtZdP48z00iXTWfQ4cC9IuUgMk1zhwdaDNDS0zioI/ej41gmw1ZXFvXgMkZ/C5OlC7m2jgr2BTc/KpsGiBsvnUaUJ2xrg6yLlnz/ldEMGhmKA5pQgVKh1QU7dMHWgdikS/HxzyLIoJriGKQYgF6+clmDrQyo5ppGEEA2cO636B/zPFILwcBHKAytSBZuVp220OCxM5Fek7YBRJll5zEIifYepA81/FL+XvJ2A589qUoJdEUbvmIBAjE6YO/tTM0I5fKAWPYoJhN8UMaw4Ckcdg6kCL5Ug7O4aFSDyKCYaOFIOgHARqlM7UwVJaxlNV4oRRVBKem/l2CY94Huu+bmAQVJxKTWAzdaAVV8n5fL6dLa7LZXI7lSRY5j2zjmUSrmLDBEyDSGI+9YEYVrsTAi4V2VLDM00HyXplwzrXBlUm0RUDRmLB2J2b5wYmVUlkTfKUizaKNlpOJLCjbXqLSjE9AfeS3dQf1dqRWVl2UezKaluWSzZJbhVxWy3aFwHSL49B3aEv/AGDILbx/m5tCrl+n3Kl9734kEv9+s7Jl0mX55IVjEXbEdgl+yGMOoUP5RqBWCwIdhcTr1N8ApD8hv5REW4u0KCLaTYRHagNKd55Z+Qd8LuYmO3ybvF28D8E003u62Qpeas78ZzekuWTd76s1lF4hV4iv2QfNsS5Fesul843ajUDgFF/CvaiAGVWUus2ag5u5qBBF1NO2Ax6/cO7cyreCiGAWE+5thrfWJYMGFhWBc39oDg7MazZF3wVwODbU3vtKV0g73zi7SHVRqlNvBdC1IAVL6gMCmlno7xwky4mmGDPHzUe9+kyCqZy37RyD5YOtJCMkhaEHTyNupiAIikRg/ouLUxl6eBX/XFKmhuaAwbFpAA3FIHVUJQG7YssHSg7T7FuyBw062ICoSNhate8LcvTgUptUVKj0ByQc5zvAAcsIezaMaLn94ESdPCaElIcj8xBs5L9A6hfIIjFLBdi6eAVwJAsPDQHDbuY9rCGw/6/aGQY5QscHcQBRxzsHTTsYoL1TPbYU2X8SNdtcHSggnlKLgSbg4ZdTKBBlJCDUNkn0uHI0YFyDyhZa3RXYNMuJljfaLf1cx7/ztGByj0GhFMOmYOmN+GB2iyCLVKTJReED3B0oNV8EXxQFDg37WI6QmVa11PIOxw5OrhxzC0yB827mIBRJCxCJRRl8XF0oNwDwkmPKiyb3woFEuyEPZ6xDkeODpR7kG9nFmxR3E/vYoLYAKNoP5i1iqHtrxWKpZWp7bcazyasQOag+eWgITCK2WHzGQfNHttHqg/VKpjXBmyKSYMpjcKagJFAUE6pGnxLgr3NrVCLL9EBtYvJhEET7O7QgGJSgC0QE0W7i/LQpTKTRLuL8mCCfZogdzEZAascm0HnlzRSUOOZpG+B/tdsv0VUI7mLyQgcfFjqZXSdiYqHqTr2shfLdOeY5n9lS8jh+Wu5CD/jopWopnvLj0NYl9jyGn3I1lzWHxEtlRLENgz3+5KOqYs3Xxq2hnVaGG+PytFFeS3vDoXV77awSeuasIdYdB38CsafhdXWbS/KA6GjVaVaYaPdGtN1oOX57WEwrCdrRDFpgN0wNo9LW4f2JUjXgXY+2VkmGDm3vTsUdkXZVqKW1LYnO+g60LaksGWzcGti21uhPOZm0CgGa88RXQeaZq1GHt2b2fpWKHQDo2UzaL8PbMkbug60HWbN7MJAj9XFZATM1NvICr243MYxkHWgVUvak1mIdSf1e3wCrGC3Zf60U8z/s/xtsg5WHPcAxrrt7w6FFsaWmtN7km2JUrIONJfdetAh15bVxWQGqu/6PAjOsiXrQHcPbBsM5tVdXJS3gWb2M8+jETPWM4SsA621yHrYQyPu5KI8mEOwKFajGGwZbbIONK/HWk8CK8jbXZT3AOJwPx9Pmjtjc07IOtD+pM09CJFJdPHwCKpnKCb4g6llrFuqDmKGe7BBM9Yin6qA33+UQVKrBc0m2cKbl/20eOAcO5tAk+jo/TlD2a4MvNt1YYLefZYaf/HCK9lg+aEWMVndA/T2SguKSQfaY9UfrwPlN4/EGvWHukif+b45nC52F1MdtuPJsdv4Pvh7dw+PsB59GxUcvsVEqeQfI9rmU3UcJ9rj5fQtpt00leD2LaZjPonrNQEadDF9xG08pwMZTbqYPmI+1jqTerh/nm5/QlzeuNHJW0yrfFJa6OgtpnUaTOcW7rYUUz0uy0xUV7GPDHhmKPXdjRGHl7m1XrRv4ItgmzR2Thuwxfk7H6//jDPSwXTeYnKE2IMY71tMXQGxK9xbob4AvyigGeQtpkGBCgn/QZOI8jyu32IaP3BhsbN86mSAC8z/vbftESfYootpqkANJy7zqRMBpkUdUUzTAawiJPbafhXww1pDvG1/DNeH+VDYYCqsXck+H/vfW/VA54gSKP2axOM2v78sNCr0+bb9PgnGmXOXWU8GIU7Gm2iWftpH4Lhpe9tttxDdnw3xaez0m/Q7TqeFU2h/9F2y7wjrce+DJ2TenVGYiAq6PCSj0TkEtRAd5ZOOU7AFT/jdJJSmdT1E29Y2IzbGQxFXaeL/6AKfPmD+T12YBMO3pPCzNFku0wx3XZf/+bR0BVM3vvTLp/WS4uNGx9137yvh3J3ne9tnrBofDPUqDqvkYCNrqf/rc7UfN6YykQ6oBjyI4L38PjyjzeIsnMcZI/+93ORisNdNLw+sxQGmsWWGBLzC3zhpKCmB7glFOfQYMdDuKWjUM5QZGiWWcKiuUpxQQGEoNjEowdHXn0CvqBtLXlArgaOvw85bUxkmdl/atzm+Ad3jbS6I/YOvvrk5pMFDajW2Frbjua5FgCncmpYh+MCRI+oLzECdsUPteE4rl38WxLdOuZdo0PDefVzbXQ8LtBwzLvB5xzqTC4bR5uY2De9XnNZOAOp3desqgu762ub6JftSWgqa6sBBz68GcEDXeoDgCHVUDvBuD2odQHS1rtt1AO/XrBsGOBzbX0RQAbiJNZdSwAtxXRelwDsRakwzevzPkbv6furVuJ+4Q9ktA4vuRDAvM+iruaoSe/+75oNhh/xE11l26AEGpp0+c343ywPwWDItcpziaXOPpAkLuNB8XCOPuqQdHY2GrYjPG9j13EEWxRC9wpWw6C52RssQ8Sg33Jxsub6jAfBSC866xVvlaBQOcyjoGm2Z6XHTxdSG6L6xCZcGF1F8PlvvjvFxv17kBurBYdxmuJEhyK6rffHxXTQzfbyTUsXU0OwoRdnkI6Wx1cfp8YxvZCg/K+Tjn4avd1GPsePeuOvmOoonuO3XHaRUf+qS6/WDcNtvaryRoR7trwszAx8/n1TgehCsKeiufh2n7OrnwT3/faUrQXqO3SOF+ExdCR2ooAjMqUqQXpc1eifargy6qZnFXphZBVm3ldtXQj2W9LsqmT1QyuGCzsuyTIzOO4TXXRNBiL1ROAHGaM4xLKV50u+m6fqJ7cdaGOmf+inXjU6177ZLP+2C99exW9Y2oEs/76+PJUoCw3QULnPStQZK7K+ej9UghZ/2W7Ye/6W+L54FEOUNWL68XXprLlwtPd9/+7p/mnfmE3xAtLmmeTmILE8Xhz5WgI7wsrjl1QvQ2Wk5bx2i/gc+jQH6yOz/UwAAAABJRU5ErkJggg==" width="50px" height="50px"></a>

  <hr>
  <center><h3>Shopping Catalog</h3></center>
  <table border="1" width="300" cellspacing="0"
  cellpadding="2" align="center">
    <tr><th>Description</th><th>Price</th><th>Image</th></tr>
    <tr>
      <form action="AddToShoppingCart.jsp" method="post" id="b1f">
        <td>Phone</td>
        <td>$1999</td>
        <td><img height="300px" width="200px" src="https://i.pcmag.com/imagery/reviews/03xdTO0Ka4H4KvEgtSPg4c2-12.fit_lpad.size_624x364.v_1569479325.jpg"></td>
        <td>
          <select name="quantity">
               <% for(int i = 1; i <= 10; i+=1) { %>
                       <option><%= i %></option>    <% } %>
            <!-- <option></option> -->
          </select>
          <input type="submit" name="Submit" value="Add" class="add">
          <button type="button" id="b1" onclick="test(this.id);">Remove</button>

        </td>
        <input type="hidden" name="id" value="1">
        <input type="hidden" name="type" id="b1ff" value="add">
        <input type="hidden" name="desc" value="Phone">
        <input type="hidden" name="price" value="1999">
      </form>
    </tr>
    <tr>
      <form action="AddToShoppingCart.jsp" method="post" id="b2f">
        <td>Book</td>
        <td>$199</td>
        <td><img height="300px" width="200px" src="https://images-na.ssl-images-amazon.com/images/I/41fhsnzKEgL._SX258_BO1,204,203,200_.jpg"></td>
        <td>
        <select name="quantity">
               <% for(int i = 1; i <= 10; i+=1) { %>
                       <option><%= i %></option>    <% } %>
          </select>
          <input type="submit" name="Submit" value="Add" class="add">
          <button type="button" id="b2" onclick="test(this.id);">Remove</button>
        </td>
        <input type="hidden" name="id" value="2">
        <input type="hidden" name="desc" value="Book">
        <input type="hidden" name="type" id="b2ff" value="add">
        <input type="hidden" name="price" value="199">
      </form>

    </tr>
    </table>
  </body>
</html>
