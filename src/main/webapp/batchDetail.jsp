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
              		<h5 class="m-0">Batch</h5>
				</div>
				<div class="card-body">
					<form action="Batch" method="post">
						<core:if test="${sessionScope.batch != null}">
							<div class="row">
								<input type="hidden" name="id" value="${sessionScope.batch.getBid()}" />
								<input type="hidden" name="_method" value="PUT">
								<div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Type of batch</label> <select
										class="form-control" name="typeofbatch">
										<option value="Morning"
											${sessionScope.batch.getTypeofbatch() == "morning" ? "selected" : ""}>Morning</option>
										<option value="Evening"
											${sessionScope.batch.getTypeofbatch() == "evening" ? "selected" : ""}>Evening</option>
									</select>
								</div>
								<div class="col-md-6 col-lg-3 mb-3">
									<label class="label">Time</label> <select class="form-control"
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
									<button class="btn btn-success" type="submit">Edit</button>
									<button class="btn btn-danger" type="submit">Delete</button>
									<a class="btn btn-light" href="/FunFitApp/Batch"> Back</a>
								</div>
							</div>
						</core:if>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
