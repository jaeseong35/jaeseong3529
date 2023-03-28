<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Ledger</title>
<!-- Load Bootstrap JS and jQuery -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JK"
	crossorigin="anonymous">
<!-- Load jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha384-/dXQOV1LfDzQJQHXvZftSGTqZldp5MNUoKQHr3fpyRgR/FFO8aqFV1EjKwCt5/eb"
	crossorigin="anonymous"></script>
<!-- Custom CSS -->
<style>
.form-group .input-group-text {
	background-color: #fff;
	border: none;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<form method="post" action="insertLedger.do">
			<input type="hidden" name="user_id"
				value="${ sessionScope.user.getId() }">
			<div class="form-group">
    <label for="category_id">Category:</label>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-caret-down"></i></span>
        </div>
        <select class="form-control" name="category_id" required>
            <option value="">Choose category</option>
            <option value="203">Salary</option>
            <option value="204">Rent</option>
            <option value="205">Groceries</option>
            <option value="206">Utilities</option>
            <option value="207">Transportation</option>
            <option value="208">Dining out</option>
            <option value="209">Entertainment</option>
            <option value="210">Clothing</option>
            <option value="211">Medical</option>
            <option value="212">Insurance</option>
        </select>
    </div>
</div>

	<div class="form-group">
    <label for="date">Date:</label>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
        </div>
        <input type="date" class="form-control" name="date" required>
    </div>
</div>


			<div class="form-group">
				<label for="content">Content:</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-pencil-alt"></i></span>
					</div>
					<input type="text" class="form-control" name="content" required>
				</div>
			</div>

			<div class="form-group">
				<label for="amount">Amount:</label>
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i
							class="fas fa-dollar-sign"></i></span>
					</div>
					<input type="number" step="0.01" class="form-control" name="amount"
						required>
				</div>
			</div>
<div class="form-group text-center mt-3">
    <button type="submit" class="btn btn-primary btn-lg">Submit</button>
</div>

		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js">
	$(function() {
  $('form').on('submit', function(e) {
    e.preventDefault(); // 기본 동작인 form submit을 막습니다.

    // form 데이터를 서버로 전송하는 Ajax 요청을 보냅니다.
    $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      success: function() {
        // 성공적으로 요청이 완료되면 메시지를 표시합니다.
        alert('작성이 성공적으로 완료되었습니다!');
      }
    });
  });
});
	</script>
</body>
</html>
