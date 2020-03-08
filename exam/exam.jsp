<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
   <head>
      <title>chess quiz</title>
      <style type="text/css">
      	.correct{
      		color: green;
      	}
      	.wrong {
      		color: red;
      	}
      	form{
      		border: 1px solid black;
      		width: 60%;
      	}
      </style>
      <script type="text/javascript">
      	var countDownDate = new Date();
      	var hours = 0;
   		var mins = 10;
      	// countDownDate.setDate(new Date(countDownDate.getTime() + 1000*60*mins+1000*60*60+hours))
      	countDownDate = countDownDate.getTime()+1000*60*mins+1000*60*60*hours
      	window.onload = function() {
      		var p =document.getElementsByClassName("ans").length;
      		console.log(p)
      		if(p == 0){
      		var x = window.setInterval(()=>{
			var now = new Date().getTime();
			  var distance = countDownDate - now;
			  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
			  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
			  document.getElementById("text").innerHTML = hours + "h "
			  + minutes + "m " + seconds + "s ";
			  if (distance < 0) {
			    clearInterval(x);
			    document.getElementById("text").innerHTML = "EXPIRED";
			    alert("Test Completed")		
			    var form = document.getElementById("sub")
			    form.click()
			    // form.Finish.value = "submit"
			    // form.submit()

			  }
			}, 1000);

      		// loadDoc()
      	}
      	else{
      		document.getElementById("time").innerHTML = "Test Complete!"
      	}
      }
      
      	function loadDoc() {
		  var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		     document.getElementById("demo").innerHTML = this.responseText;
		    }
		  };
		  xhttp.open("GET", "exam.jsp?req=1", true);
		  xhttp.send();
		}
      </script>
   </head>

   <body>
   	<center><h1>Chess Quiz!</h1></center>
   	<p id="time">Time Remaining : </p><div id="text"></div>
	<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
     url = "jdbc:mysql://localhost:3306/exam"
     user = "root"  password = "1234"/>
    <sql:query dataSource = "${db}" sql = "select * from test" var = "result" />
    <sql:query dataSource = "${db}" sql = "select count(*) as coun from test" var = "count" />
    <c:set value="${(count.rows[0].coun)}" var="counter" scope="session"/>
    <!-- <h2</h2> -->
    <br>
    <br>
    <center>
    	<c:set var="score" value="0" />

	   	<form id="myform" action="exam.jsp" method="POST">
   			<c:forEach var="row" items = "${result.rows}" varStatus="status">
   			<c:set var="curstat" value="${Integer.toString(status.index)}"/>
   			<label><c:out value="${status.index+1}."/></label>
	   			<label><c:out value="${row.question}"/></label>
	   			<br><br>
	   			<c:choose>
	   				<c:when test="${param[curstat] eq row.op1}">
		   			<input type="radio" name="${status.index}" value="${row.op1}" checked><c:out value="${row.op1}"/>
		   			<br>
		   			</c:when>
	   				<c:otherwise>
		   			<input type="radio" name="${status.index}" value="${row.op1}"><c:out value="${row.op1}"/>
		   			<br>
		   			</c:otherwise>
		   			
		   		</c:choose>
	   			<c:choose>
	   				<c:when test="${param[curstat] eq row.op2}">
		   			<input type="radio" name="${status.index}" value="${row.op2}" checked><c:out value="${row.op2}"/>
		   			<br>
		   			</c:when>
	   				<c:otherwise>
		   			<input type="radio" name="${status.index}" value="${row.op2}"><c:out value="${row.op2}"/>
		   			<br>
		   			</c:otherwise>
		   			
		   		</c:choose>

	   			<c:choose>
	   				<c:when test="${param[curstat] eq row.op3}">
		   			<input type="radio" name="${status.index}" value="${row.op3}" checked><c:out value="${row.op3}"/>
		   			<br>
		   			</c:when>
	   				<c:otherwise>
		   			<input type="radio" name="${status.index}" value="${row.op3}"><c:out value="${row.op3}"/>
		   			<br>
		   			</c:otherwise>
		   			
		   		</c:choose>

	   			<c:choose>
	   				<c:when test="${param[curstat] eq row.op4}">
		   			<input type="radio" name="${status.index}" value="${row.op4}" checked><c:out value="${row.op4}"/>
		   			<br>
		   			</c:when>
	   				<c:otherwise>
		   			<input type="radio" name="${status.index}" value="${row.op4}"><c:out value="${row.op4}"/>
		   			<br>
		   			</c:otherwise>
		   			
		   		</c:choose>
				
				
				<c:set var="ansnum" value="ans${status.index}"/>
				<br>
			<c:if test="${not empty param[\"Finish\"]}">
				
				<c:choose>

				<c:when test="${(empty param[curstat] || param[curstat] ne row.answer)}">
				<p class="wrong ans">Wrong answer!</p>
				</c:when>
				<c:otherwise>
				<p class="correct ans">Correct answer!</p>
				<c:set var="score" value="${score+1}" />
				</c:otherwise>
				</c:choose>
			</c:if>
			<hr>
   			</c:forEach>
   			<br><br>
   			
	   		<c:if test="${empty param[\"Finish\"]}">
   			<input type="submit" name="Finish" value="submit" id="sub">
   		</c:if>

   		</form>
   		<c:if test="${not empty param[\"Finish\"]}">
   			<h1>Your Score is <c:out value="${score}/${counter}"/></h1>
   		</c:if>
    </center>


   </body>
</html>