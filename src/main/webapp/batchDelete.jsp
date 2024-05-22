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
              		<h5 class="m-0">Delete batch</h5>
				</div>
				<div class="card-body">
					<form>
						<core:if test="${sessionScope.batch != null}">
							<div class="row">
								<input type="hidden" name="id" value="${sessionScope.batch.getBid()}" />
								<div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Type</label> <select
										class="form-select" disabled="disabled">
										<option value="Morning"
											${sessionScope.batch.getTypeofbatch() == "morning" ? "selected" : ""}>Morning</option>
										<option value="Evening"
											${sessionScope.batch.getTypeofbatch() == "evening" ? "selected" : ""}>Evening</option>
									</select>
								</div>
								<div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Time</label> <select class="form-select" disabled="disabled">
										<option value="1-2" ${sessionScope.batch.getTime() == "1-2" ? "selected" : ""}>1-2</option>
										<option value="2-3" ${sessionScope.batch.getTime() == "2-3" ? "selected" : ""}>2-3</option>
										<option value="3-4" ${sessionScope.batch.getTime() == "3-4" ? "selected" : ""}>3-4</option>
										<option value="4-5" ${sessionScope.batch.getTime() == "4-5" ? "selected" : ""}>4-5</option>
										<option value="5-6" ${sessionScope.batch.getTime() == "5-6" ? "selected" : ""}>5-6</option>
										<option value="6-7" ${sessionScope.batch.getTime() == "6-7" ? "selected" : ""}>6-7</option>
										<option value="7-8" ${sessionScope.batch.getTime() == "7-8" ? "selected" : ""}>7-8</option>
										<option value="8-9" ${sessionScope.batch.getTime() == "8-9" ? "selected" : ""}>8-9</option>
										<option value="9-10" ${sessionScope.batch.getTime() == "9-10" ? "selected" : ""}>9-10</option>
										<option value="10-11" ${sessionScope.batch.getTime() == "10-11" ? "selected" : ""}>10-11</option>
										<option value="11-12" ${sessionScope.batch.getTime() == "11-12" ? "selected" : ""}>11-12</option>
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
		        url: 'Batch?'+data,
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
