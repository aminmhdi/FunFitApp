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
              		<h5 class="m-0">Edit batch</h5>
				</div>
				<div class="card-body">
					<form>
						<core:if test="${sessionScope.batch != null}">
							<div class="row">
								<input type="hidden" name="bid" value="${sessionScope.batch.getBid()}" />
								<div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Type</label> <select
										class="form-select" name="typeofbatch">
										<option value="Morning"
											${sessionScope.batch.getTypeofbatch() == "morning" ? "selected" : ""}>Morning</option>
										<option value="Evening"
											${sessionScope.batch.getTypeofbatch() == "evening" ? "selected" : ""}>Evening</option>
									</select>
								</div>
								<div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Time</label> <select class="form-select"
										name="time">
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
			let data = convertFormToJSON(this);
			$.ajax({
		        type: 'PUT', 
		        url: 'Batch',
		        contentType: "application/json",
		        data: JSON.stringify(data),
		        success: function() {
	        	    window.location = "Batch";
		        },
		        error: function() {
		        	alert("Update error.");
		        }
			});
		});
		
		function convertFormToJSON(form) {
			  const array = $(form).serializeArray(); // Encodes the set of form elements as an array of names and values.
			  const json = {};
			  $.each(array, function () {
			    json[this.name] = this.value || "";
			  });
			  return json;
			}
    </script>
</body>
</html>
