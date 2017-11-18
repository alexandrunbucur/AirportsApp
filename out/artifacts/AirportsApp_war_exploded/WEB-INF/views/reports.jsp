<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 11/16/2017
  Time: 1:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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

        a.animated-button.victoria-one {
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

    </style>
</head>
<body>

<div class="jumbotron text-center">
    <div class="container">

        <h1>Reports</h1>
        <p style="color:#888;">Assessment Application</p>

    </div>
</div>
<div class="container">

    <div class="col-xs-6">
        <div class="table-responsive">
            <H3>Top 10 countries with the most airports</H3>
            <table class="table table-sm table-dark">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Runway ID</th>
                    <th scope="col">Number of appearances</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listTop}" var="reportTop">
                    <tr>
                        <td>${reportTop.countryName}</td>
                        <td>${reportTop.count}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-xs-6">
        <div class="table-responsive">
            <H3>Top 10 countries with the least airports</H3>
            <table class="table table-sm table-dark">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Runway ID</th>
                    <th scope="col">Number of appearances</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listBottom}" var="reportTop">
                    <tr>
                        <td>${reportTop.countryName}</td>
                        <td>${reportTop.count}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-xs-12">
        <div class="table-responsive">
            <H3>Types of runways by country</H3>
            <table class="table table-dark">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Country</th>
                    <th scope="col">Types of runways</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${countryRunwayTypes}" var="countryRunwayTypes">
                    <tr>
                        <td>${countryRunwayTypes.countryName}</td>
                        <td>${countryRunwayTypes.runwayTypes}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-xs-12">
        <div class="table-responsive">
            <H3>Top 10 most common runway identification</H3>
            <table class="table table-sm table-dark">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Runway ID</th>
                    <th scope="col">Number of appearances</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${commonRunwayIds}" var="commonRunwayIds">
                    <tr>
                        <td>${commonRunwayIds.runwayId}</td>
                        <td>${commonRunwayIds.count}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>


</body>
<footer class="jumbotron text-center">
    <div class="container">
        <p style="color:#888">Designed by Alexandru Bucur</p>
    </div>
</footer>
</html>
