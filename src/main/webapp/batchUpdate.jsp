<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <%@ include file="head.jsp" %>
  <body>
    <%@ include file="navbar.jsp" %>
    <div class="container">
      <div class="p-3">
        <div class="card">
          <div class="card-header">
            <h2 class="m-0">Add new batch</h2>
          </div>
          <div class="card-body">
            <form action="Batch" method="post">
              <div class="row">
                <div class="col-md-6 col-lg-3 mb-3">
                  <label class="label">Type of batch</label>
                  <select class="form-control" name="typeofbatch">
                    <option value="">--Type--</option>
                    <option value="Morning">Morning</option>
                    <option value="Evening">Evening</option>
                  </select>
                </div>
                <div class="col-md-6 col-lg-3 mb-3">
                  <label class="label">Time</label>
                  <select class="form-control" name="time">
                    <option value="">--Time--</option>
                    <% for(int i=1,j=2;i<=12 && j<13;i++,j++){ %>
                    <option value="<%=i%>-<%=j %>"><%=i%>-<%=j%></option>
                    <% } %>
                  </select>
                </div>
                <div class="col-12 mt-4">
                  <button class="btn btn-primary" type="submit">Add</button>
                  <a class="btn btn-light" href="/FunFitApp/Batch"> Back</a>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
