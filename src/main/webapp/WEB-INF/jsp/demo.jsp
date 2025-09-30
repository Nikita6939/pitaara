<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="saveData" method="post" enctype="multipart/form-data">
 
    
    <label for="imageInput">Upload Images</label>
    <input type="file" id="imageInput" name="profile" multiple required>
    
    <button type="submit">Submit</button>
</form>

</body>
</html>