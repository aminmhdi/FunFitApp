<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<html>
<%@ include file="head.jsp"%>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="p-3">
			<div class="card">
				<div class="card-header">
              		<h5 class="m-0">Delete participant</h5>
				</div>
				<div class="card-body">
					<form>
						<core:if test="${sessionScope.participant != null}">
							<div class="row">
								<input type="hidden" name="id" value="${sessionScope.participant.getPid()}" />
								  <div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Firstname</label>
									<input type="text" class="form-control" name="fname" value="${sessionScope.participant.getFname()}" disabled="disabled">
								  </div>
								  <div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Lastname</label>
									<input type="text" class="form-control" name="lname" value="${sessionScope.participant.getLname()}" disabled="disabled">
								  </div>
								  <div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Age</label>
									<input type="number" class="form-control" name="age" value="${sessionScope.participant.getAge()}" disabled="disabled">
								  </div>
								  <div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Phone</label>
									<input type="number" class="form-control" name="phonenumber" max="10" value="${sessionScope.participant.getPhonenumber()}" disabled="disabled">
								  </div>
								  <div class="col-md-6 col-lg-3 mb-3">
								  <label class="label">Batch</label>
								  <select class="form-select" name="bid" disabled="disabled">
									<core:forEach var="bid" items="${sessionScope.batches}">
										<option value="<core:out value="${bid.getBid()}"></core:out>"> 
											<core:out value="${bid.getTypeofbatch()}"></core:out> 
											- 
											<core:out value="${bid.getTime()}"></core:out>
										</option>
									</core:forEach>
									</select>
								</div>
								<div class="col-12 mt-4">
								<div class="float-start">
									<a class="btn btn-light" href="/FunFitApp/Participant">
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
									<button class="btn btn-danger" type="submit">
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
				                    </button>
								</div>
								</div>
							</div>
						</core:if>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="scripts.jsp" %>
    <script type="text/javascript">
		$("form").submit(function(e){
			e.preventDefault();
			let data = JSON.stringify($("form").serialize()).replace(/\"/g, ""); 
			$.ajax({
		        type: 'DELETE', 
		        url: 'Participant?'+data,
		        success: function() {
	        	    window.location = "Batch";
		        },
		        error: function() {
		        	alert("Delete error.");
		        }
			});
		});
    </script>
</body>
</html>
