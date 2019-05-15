<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="internationalization.messages"/>

<html lang="${language}" style="background-color: #000000;">
<head>
    <meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="icon" type="image/ico" href="assets/img/LibLogo.jpg" />
    <title><fmt:message key="contacts_page.title"/></title>
    <style>
        #map {
            height: 30%;
            width: 30%;
        }
    </style>
</head>
<body style="background-color: rgba(255,255,255,0);">
<div style="height: 10vh;"><jsp:include page="menuBar.jsp"></jsp:include></div>
<div class="d-flex" style="min-height: 70vh; background-image: url(assets/img/1348229547604-e1432042866949.jpg);background-repeat: round;background-size: cover;">
    <div style="min-width: 60vw; margin:0 auto;">
        <div class="container-fluid" >
            <div class="row" style="background-color: #ffffff;">
                <div style="font-size: 0.85rem;">
                    <div >
                        <h4><fmt:message key="contacts_page.map_header"/></h4>
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
                        <h6><fmt:message key="contacts_page.address"/></h6>
                        <p><fmt:message key="contacts_page.address_value"/></p>
                        <h6><fmt:message key="contacts_page.phone"/></h6>
                        <p><fmt:message key="contacts_page.phone_value"/></p>
                        <h6><fmt:message key="contacts_page.email"/></h6>
                        <p><a href="<fmt:message key="contacts_page.email_link"/>"><fmt:message key="contacts_page.email_value"/></a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="height: 20vh;"><jsp:include page="footer.jsp"></jsp:include></div>
</body>
</html>
