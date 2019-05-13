<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #ffffff;">
<head>
    <title><fmt:message key="contacts_page.title"/></title>
    <style>
        #map {
            height: 40%;
            width:  40%;
        }
    </style>
</head>

<h3><fmt:message key="contacts_page.map_header"/></h3>
<div id="map"></div>
<script>
    function initMap() {
        var library = {lat: 59.9859198, lng: 30.3079472};
        var map = new google.maps.Map(
            document.getElementById('map'), {zoom: 15, center: library});
        var marker = new google.maps.Marker({position: library, map: map});
    }
</script>
<script async defer src="http://maps.google.com/maps/api/js?key=AIzaSyDX9lhmpZWpSoV7JRCW8jWhyu1W_6vTVkE&callback=initMap">
</script>
<h3><fmt:message key="contacts_page.address"/></h3>
<p><fmt:message key="contacts_page.address_value"/></p>
<h3><fmt:message key="contacts_page.phone"/></h3>
<p><fmt:message key="contacts_page.phone_value"/></p>
<h3><fmt:message key="contacts_page.email"/></h3>
<p><a href="<fmt:message key="contacts_page.email_link"/>"><fmt:message key="contacts_page.email_value"/></a></p>
</body>
</html>
