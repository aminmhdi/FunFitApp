<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <%@ include file="head.jsp"%>
  <body>
    <%@ include file="navbar.jsp"%>
    <div class="container">
      <div class="p-3">
        <div class="card">
          <div class="card-header">
            <h5 class="m-0">Add new batch</h5>
          </div>
          <div class="card-body">
            <form action="Batch" method="post">
              <div class="row">
                <div class="col-md-6 col-lg-3 mb-3">
                  <label class="label">Type</label>
                  <select class="form-control" name="typeofbatch">
                    <option value="Morning">Morning</option>
                    <option value="Evening">Evening</option>
                  </select>
                </div>
                <div class="col-md-6 col-lg-3 mb-3">
                  <label class="label">Time</label>
                  <select class="form-control" name="time">
                    <% for (int i = 1, j = 2; i <= 12 && j < 13; i++, j++) { %>
                    <option value="<%=i%>-<%=j%>"><%=i%>-<%=j%></option>
                    <% } %>
                  </select>
                </div>
                <div class="col-12 mt-4">
                  <div class="float-start">
                    <a class="btn btn-light" href="/FunFitApp/Batch">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-arrow-left"
                        viewBox="0 0 16 16"
                      >
                        <path
                          fill-rule="evenodd"
                          d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"
                        />
                      </svg>
                    </a>
                  </div>
                  <div class="float-end">
                    <button class="btn btn-primary" type="submit">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-floppy"
                        viewBox="0 0 16 16"
                      >
                        <path d="M11 2H9v3h2z" />
                        <path
                          d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v4.5A1.5 1.5 0 0 1 11.5 7h-7A1.5 1.5 0 0 1 3 5.5V1H1.5a.5.5 0 0 0-.5.5m3 4a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V1H4zM3 15h10v-4.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5z"
                        />
                      </svg>
                    </button>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
