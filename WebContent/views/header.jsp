<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<%= IMG_PATH %>Logo.png">
<link rel="stylesheet" href="<%= ROOT_PATH %>assets/style/bootstrap.min.css">
<link rel="stylesheet" href="<%= ROOT_PATH %>assets/style/mystyle.css">
<%-- Ini untuk Hai dan Jumlah User yang Online --%>
<div class="row">
    <div class="col-md-4">
        <img src="<%= IMG_PATH %>Logo.png" alt="Aperture_Logo" width="50" height="50" style="padding: 3px; margin: 10px 3px 10px; float: left;">
        <p style="font-size: 16px; font-weight: bold; margin-top: 8px; margin-bottom: 0;">Aperture Shop <span style="font-size: 10px; font-weight: none; color: rgba(190, 190, 190, 1);">Capture Every Moment</span></p>
        <p>Hi,<%= UserFullName.equalsIgnoreCase("") ? " Guest" : UserFullName %>!</p>        
    </div>
    <div class="col-md-4 pull-right" style="margin: 40px 10px 0;">
        <p class="text-right">User Online : 0</p>
    </div>
</div>