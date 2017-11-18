<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 11/16/2017
  Time: 12:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <style>
        @import url(https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css);
        @import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

        body {
            font-family: 'Lato', sans-serif;
            background: #353535;
            color: #FFF;
        }

        .jumbotron h1 {
            color: #353535;
        }

        footer {
            margin-bottom: 0 !important;
            margin-top: 80px;
        }

        footer p {
            margin: 0;
            padding: 0;
        }

        span.icon {
            margin: 0 5px;
            color: #D64541;
        }

        h2 {
            color: #BDC3C7;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .mrng-60-top {
            margin-top: 60px;
        }

        /* Global Button Styles */
        a.animated-button:link, a.animated-button:visited {
            position: relative;
            display: block;
            margin: 30px auto 0;
            padding: 14px 15px;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            letter-spacing: .08em;
            border-radius: 0;
            text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            transition: all 1s ease;
        }

        a.animated-button:link:after, a.animated-button:visited:after {
            content: "";
            position: absolute;
            height: 0%;
            left: 50%;
            top: 50%;
            width: 150%;
            z-index: -1;
            -webkit-transition: all 0.75s ease 0s;
            -moz-transition: all 0.75s ease 0s;
            -o-transition: all 0.75s ease 0s;
            transition: all 0.75s ease 0s;
        }

        a.animated-button:link:hover, a.animated-button:visited:hover {
            color: #FFF;
            text-shadow: none;
        }

        a.animated-button:link:hover:after, a.animated-button:visited:hover:after {
            height: 450%;
        }

        a.animated-button:link, a.animated-button:visited {
            position: relative;
            display: block;
            margin: 30px auto 0;
            padding: 14px 15px;
            color: #fff;
            font-size: 14px;
            border-radius: 0;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            letter-spacing: .08em;
            text-shadow: 0 0 1px rgba(0, 0, 0, 0.2), 0 1px 0 rgba(0, 0, 0, 0.2);
            -webkit-transition: all 1s ease;
            -moz-transition: all 1s ease;
            -o-transition: all 1s ease;
            transition: all 1s ease;
        }

        /* Victoria Buttons */

        input, a.animated-button.victoria-one {
            border: 2px solid #D24D57;
        }

        a.animated-button.victoria-one:after {
            background: #D24D57;
            -moz-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
            -ms-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
            -webkit-transform: translateX(-50%) translateY(-50%) rotate(-25deg);
            transform: translateX(-50%) translateY(-50%) rotate(-25deg);
        }

        a.animated-button.victoria-two {
            border: 2px solid #D24D57;
        }

        a.animated-button.victoria-two:after {
            background: #D24D57;
            -moz-transform: translateX(-50%) translateY(-50%) rotate(25deg);
            -ms-transform: translateX(-50%) translateY(-50%) rotate(25deg);
            -webkit-transform: translateX(-50%) translateY(-50%) rotate(25deg);
            transform: translateX(-50%) translateY(-50%) rotate(25deg);
        }

        a.animated-button.victoria-three {
            border: 2px solid #D24D57;
        }

        a.animated-button.victoria-three:after {
            background: #D24D57;
            opacity: .5;
            -moz-transform: translateX(-50%) translateY(-50%);
            -ms-transform: translateX(-50%) translateY(-50%);
            -webkit-transform: translateX(-50%) translateY(-50%);
            transform: translateX(-50%) translateY(-50%);
        }

        a.animated-button.victoria-three:hover:after {
            height: 140%;
            opacity: 1;
        }

        a.animated-button.victoria-four {
            border: 2px solid #D24D57;
        }

        a.animated-button.victoria-four:after {
            background: #D24D57;
            opacity: .5;
            -moz-transform: translateY(-50%) translateX(-50%) rotate(90deg);
            -ms-transform: translateY(-50%) translateX(-50%) rotate(90deg);
            -webkit-transform: translateY(-50%) translateX(-50%) rotate(90deg);
            transform: translateY(-50%) translateX(-50%) rotate(90deg);
        }

        a.animated-button.victoria-four:hover:after {
            opacity: 1;
            height: 600% !important;
        }

        input[type=text] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 2px solid #D24D57;
            color: black;
            font-size: 24px;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            border: 2px solid #D24D57;
            color: white;
            font-size: 24px;
            border-radius: 4px;
            box-sizing: border-box;
            background: #353535;
            font-size: 14px;
            border-radius: 0;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            text-transform: uppercase;
        }

    </style>
</head>
<div class="jumbotron text-center">
    <div class="container">

        <h1>Airport Management Application</h1>
        <p style="color:#888;">Assessment Application</p>

    </div>
</div>
<div class="container">
    <!-- Example row of columns -->

    <div class="row">
        <div class="col-md-12 text-center">
            <h2>Menu</h2>
        </div>
    </div>

    <div class="row">
        <FORM name="query" ACTION="query" METHOD="POST">
            Please enter the name or code of the country
            <INPUT TYPE="TEXT" NAME="text1">
            <BR>
            <INPUT TYPE="SUBMIT" value="Submit">
        </FORM>
    </div>


</div>
<footer class="jumbotron text-center">
    <div class="container">
        <p style="color:#888">Designed by Alexandru Bucur</p>
    </div>
</footer>
</html>