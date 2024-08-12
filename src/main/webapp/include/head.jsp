<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.transaction.xa.XAResource"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<!DOCTYPE html>
<html lang="en">

<% 
ProjectService project_head_ser = new ProjectService();
ProjectDto project_head_dto = project_head_ser.getProjectInfoById(1, config, request);
    %>


<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title><%=project_head_dto.getNAME() %></title>
<link href="ProjectImage/<%=project_head_dto.getId()%>.jpg" rel="icon" />
<meta content="" name="description">
<meta content="" name="keywords">

<!-- ======= css ======= -->
<%@include file="../include/css.jsp"%>
<!-- ======= css end======= -->

<style type="text/css">
	.info-table{
	border: 1px solid #f03c02;
	min-width: 830px;
	}
	.info-table tr td{
		text-align: left;
		text-overflow: clip;
		 border:1px solid  #d11414; 
			}
	.info-table tr th{
 text-align: right;
		  border:1px solid  #f03c02;
		}
	.info-table tr{
		margin-left: 10px;
		}
	.info-table th{
		background-color: #f2f2f2;
		color: #f03c02;
		}
		.info-table{
		padding: 2px;
			}
		.align_right{
		text-align: right! important;
		}
.refresh_add{
left: 0;
 margin-left: 5px; 
 width: 3%;
}
.btn-primary {
	color: #fff;
	background-color: #ff3f00;
	border-color: #ff3f00;
}

.btn-primary:hover {
	color: #ff3f00 !important;
	background-color: #fff !important;
	border-color: #ff3f00 !important;
}

.form-check-input {
	width: 0.7em;
	height: 0.7em;
	margin-top: .5em;
	vertical-align: top;
	background-color: #fff;
	background-repeat: no-repeat;
	background-position: center;
	background-size: contain;
	border: 1px solid rgba(0, 0, 0, .25);
	border-top-color: rgba(0, 0, 0, 0.25);
	border-right-color: rgba(0, 0, 0, 0.25);
	border-bottom-color: rgba(0, 0, 0, 0.25);
	border-left-color: rgba(0, 0, 0, 0.25);
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	-webkit-print-color-adjust: exact;
	color-adjust: exact;
	print-color-adjust: exact;
}

.form-check-label {
	font-size: 15px;
	margin-right: 5%;
}

.justify-content-around {
	justify-content: center !important;
}

.form-check {
	display: block;
	min-height: 1.5rem;
	padding-left: 2.5em;
	margin-bottom: .125rem;
}
.item{
font-size: inherit;
margin-top: 5px;
}




</style>
