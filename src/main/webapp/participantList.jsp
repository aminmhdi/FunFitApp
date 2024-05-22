
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>

<!DOCTYPE html>
<html>
  <%@ include file="head.jsp"%>
  <body>
    <%@ include file="navbar.jsp"%>

    <div class="container">
      <div class="p-3">
        <div class="card">
          <div class="card-header">
            <div class="float-start">
              <h5 class="m-0">Participant</h5>
            </div>
            <div class="float-end">
              <a class="btn btn-sm btn-primary" href="Participant?id=0">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  fill="currentColor"
                  class="bi bi-plus-square-fill"
                  viewBox="0 0 16 16"
                >
                  <path
                    d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0"
                  />
                </svg>
              </a>
            </div>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-12">
                <core:if
                  test="${sessionScope.participants == null || sessionScope.participants.size() == 0}"
                >
                  <div class="alert alert-warning text-center">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle" viewBox="0 0 16 16">
  <path d="M7.938 2.016A.13.13 0 0 1 8.002 2a.13.13 0 0 1 .063.016.15.15 0 0 1 .054.057l6.857 11.667c.036.06.035.124.002.183a.2.2 0 0 1-.054.06.1.1 0 0 1-.066.017H1.146a.1.1 0 0 1-.066-.017.2.2 0 0 1-.054-.06.18.18 0 0 1 .002-.183L7.884 2.073a.15.15 0 0 1 .054-.057m1.044-.45a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767z"/>
  <path d="M7.002 12a1 1 0 1 1 2 0 1 1 0 0 1-2 0M7.1 5.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0z"/>
</svg>
                  No record found</div>
                </core:if>
                <core:if
                  test="${sessionScope.participants != null && sessionScope.participants.size() > 0}"
                >
                  <div class="table-responsive">
                    <table class="table">
                      <tr>
				        <th>Id</th>
				        <th>First Name</th>
				        <th>Age</th>
				        <th>Phone</th>
				        <th>Batch</th>
                        <th class="text-end">Actions</th>
                      </tr>
                      <core:forEach var="batch" items="${sessionScope.batches}">
                        <tr>
                          <td class="align-middle">
                            <core:out value="${batch.getPid()}"></core:out>
                          </td>
                          <td class="align-middle">
                            <core:out
                              value="${batch.getFname()}"
                            ></core:out>
                          </td>
                          <td class="align-middle">
                            <core:out value="${batch.getAge()}"></core:out>
                          </td>
                          <td class="align-middle">
                            <core:out value="${batch.getPhonenumber()}"></core:out>
                          </td>
                          <td class="align-middle">
                            <core:out value="${batch.getBid()}"></core:out>
                          </td>
                          <td class="align-middle text-end">
                            <a
                              class="btn btn-sm btn-success"
                              href="Participant?id=${batch.getBid()}"
                            >
                              <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-pencil-fill"
                                viewBox="0 0 16 16"
                              >
                                <path
                                  d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"
                                />
                              </svg>
                            </a>
                            <a
                              class="btn btn-sm btn-danger"
                              href="Participant?id=${batch.getBid()}&d=1"
                            >
                              <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="16"
                                height="16"
                                fill="currentColor"
                                class="bi bi-trash"
                                viewBox="0 0 16 16"
                              >
                                <path
                                  d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"
                                />
                                <path
                                  d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"
                                />
                              </svg>
                            </a>
                          </td>
                        </tr>
                      </core:forEach>
                    </table>
                  </div>
                </core:if>
              </div>
              <div class="col-12 mt-3">
                <a class="btn btn-light" href="index.jsp">
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
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

