<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Trang đăng nhập</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- page jquery/ajax -->

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"
	type="text/javascript"></script>
<style>
	.login-form {
	    width: 340px;
	    margin: 50px auto;
	  	font-size: 15px;
	}
	.login-form form {
	    margin-bottom: 15px;
	    background: #f7f7f7;
	    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	    padding: 30px;
	}
	.login-form h2 {
	    margin: 0 0 15px;
	}
	.form-control, .btn {
	    min-height: 38px;
	    border-radius: 2px;
	}
	.btn {        
	    font-size: 15px;
	    font-weight: bold;
	}
	.error {
		color: red;
	}
	.success{
		color: green;
	}
        .card {
            margin-bottom: 1.5rem;
            box-shadow: 0 1px 15px 1px rgba(52, 40, 104, .08);
        }

        .card {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid #e5e9f2;
            border-radius: .2rem;
        }
</style>
</head>
<body>
<decorator:body />
	
	
</body>
</html>
