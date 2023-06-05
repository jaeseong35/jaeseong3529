<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Ledger</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	integrity="sha512-1K/UJGcrrz0+Jt0p3qIVeIJWbkYT+LnlSNy/4X3+Vvy8J1WjKFLsZuI2Q/+1aZuJjpSWzaVKB9yGbXgJmE8rcQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="container mt-5">
	<form method="post" action="updateLedger.do">
		<input type="hidden" name="id"
			value="${ledger.id}">
		<div class="form-group">
			<label for="category_id">Category:</label>
			<select class="form-control" name="category_id" required>
				<option value="">Choose category</option>
				<option value="203" ${ledger.category_id == 203 ? 'selected' : ''}>Salary</option>
				<option value="204" ${ledger.category_id == 204 ? 'selected' : ''}>Rent</option>
				<option value="205" ${ledger.category_id == 205 ? 'selected' : ''}>Groceries</option>
				<option value="206" ${ledger.category_id == 206 ? 'selected' : ''}>Utilities</option>
				<option value="207" ${ledger.category_id == 207 ? 'selected' : ''}>Transportation</option>
				<option value="208" ${ledger.category_id == 208 ? 'selected' : ''}>Dining out</option>
				<option value="209" ${ledger.category_id == 209 ? 'selected' : ''}>Entertainment</option>
				<option value="210" ${ledger.category_id == 210 ? 'selected' : ''}>Clothing</option>
				<option value="211" ${ledger.category_id == 211 ? 'selected' : ''}>Medical</option>
				<option value="212" ${ledger.category_id == 212 ? 'selected' : ''}>Insurance</option>
			</select>
		</div>
		<div class="form-group">
			<label for="date">Date:</label>
			<input type="date" class="form-control" name="date"
				value="${ledger.date}" required>
		</div>
		<div class="form-group">
			<label for="content">Content:</label>
			<input type="text" class="form-control" name="content"
				value="${ledger.content}" required>
		</div>
		<div class="form-group">
			<label for="amount">Amount:</label>
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"><i
						class="fas fa-dollar-sign"></i></span>
				</div>
				<input type="number" step="0.01" class="form-control"
					name="amount" value="${ledger.amount}" required>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Update</button>
		<a href="deleteLedger.do?id=${ledger.getId()}"
							class="btn btn-dark my-5 mx-2">내역삭제</a> 
	</form>
</div>
</body>
</html>

