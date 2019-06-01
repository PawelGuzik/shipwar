<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-04-22
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
    <title>Title</title>
</head>
<body class="main_body">
<table width="100%" border="0" cellpadding="8" cellspacing="4" class="tableMenuBg" bgcolor="transparent">
    <tr>
        <td  align="right" width="1500">
            <sec:authorize access="isAuthenticated()">
                <a class="btn btn-primary mb1 bg-olive" role="button" href="${pageContext.request.contextPath}/logout"><s:message code="menu.logout"/></a>&nbsp;&nbsp;
            </sec:authorize>
        </td>
    </tr>
</table>
<div class="setshipgrid">
    <h1 class="header">Rozmieść swoje statki: 3 jdnomasztowce, 3 dwumasztowce, 2 trójmasztowce, 1 czteromasztowiec<br>
        Uwaga! Statki muszą być ustawione w poziomie, w taki sposób, aby nie stykały się ze sobą.
    </h1>
    <div class="wrapper mybattle">

        <button type="button" class="box r" disabled></button>
        <button type="button" class="box r" disabled>1</button>
        <button type="button" class="box r" disabled>2</button>
        <button type="button" class="box r" disabled>3</button>
        <button type="button" class="box r" disabled>4</button>
        <button type="button" class="box r" disabled>5</button>
        <button type="button" class="box r" disabled>6</button>
        <button type="button" class="box r" disabled>7</button>
        <button type="button" class="box r" disabled>8</button>

        <button type="button" class="box r" disabled>A</button>

        <script>
            function sendPos(s, btn) {
                document.getElementById(btn.id).disabled = true;
                var xhttp;
                if (window.XMLHttpRequest) {
                    // code for modern browsers
                    xhttp = new XMLHttpRequest();
                } else {
                    // code for IE6, IE5
                    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }

                xhttp.open("GET", s);
                xhttp.send();



            }
        </script>

        <button type="button" class="box a" id="A1"
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=A1',this)";>
        </button>
        <button type="button" class="box a" id="A2"
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=A2',this)";>
        </button>
        <button type="button" class="box a" id="A3"
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=A3',this)";>
        </button>
        <button type="button" class="box a" id="A4"
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=A4',this)";>
        </button>
        <button type="button" class="box a" id="A5"
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=A5',this)";>
        </button>
        <button type="button" class="box a" id="A6"
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=A6',this)";>
        </button>
        <button type="button" class="box a" id="A7"
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=A7',this)";>
        </button>
        <button type="button" class="box a" id="A8"
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=A8',this)";>
        </button>

        <!-- ROW B ############################################-->

        <button type="button" class="box r" disabled>B</button>

        <button type="button" class="box a" id="B1"
                <c:choose><c:when test="${shipPos8=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=B1',this)";>
        </button>
        <button type="button" class="box a" id="B2"
                <c:choose><c:when test="${shipPos9=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=B2',this)";>
        </button>
        <button type="button" class="box a" id="B3"
                <c:choose><c:when test="${shipPos10=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=B3',this)";>
        </button>
        <button type="button" class="box a" id="B4"
                <c:choose><c:when test="${shipPos11=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=B4',this)";>
        </button>
        <button type="button" class="box a" id="B5"
                <c:choose><c:when test="${shipPos12=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=B5',this)";>
        </button>
        <button type="button" class="box a" id="B6"
                <c:choose><c:when test="${shipPos13=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=B6',this)";>
        </button>
        <button type="button" class="box a" id="B7"
                <c:choose><c:when test="${shipPos14=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=B7',this)";>
        </button>
        <button type="button" class="box a" id="B8"
                <c:choose><c:when test="${shipPos15=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=B8',this)";>
        </button>

        <!--ROW C #############################################-->

        <button type="button" class="box r" disabled>C</button>

        <button type="button" class="box a" id="C1"
                <c:choose><c:when test="${shipPos16=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=C1',this)";>
        </button>
        <button type="button" class="box a" id="C2"
                <c:choose><c:when test="${shipPos17=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=C2',this)";>
        </button>
        <button type="button" class="box a" id="C3"
                <c:choose><c:when test="${shipPos18=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=C3',this)";>
        </button>
        <button type="button" class="box a" id="C4"
                <c:choose><c:when test="${shipPos19=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=C4',this)";>
        </button>
        <button type="button" class="box a" id="C5"
                <c:choose><c:when test="${shipPos20=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=C5',this)";>
        </button>
        <button type="button" class="box a" id="C6"
                <c:choose><c:when test="${shipPos21=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=C6',this)";>
        </button>
        <button type="button" class="box a" id="C7"
                <c:choose><c:when test="${shipPos22=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=C7',this)";>
        </button>
        <button type="button" class="box a" id="C8"
                <c:choose><c:when test="${shipPos23=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=C8',this)";>
        </button>

        <!--ROW D #############################################-->

        <button type="button" class="box r" disabled>D</button>

        <button type="button" class="box a" id="D1"
                <c:choose><c:when test="${shipPos24=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=D1',this)";>
        </button>
        <button type="button" class="box a" id="D2"
                <c:choose><c:when test="${shipPos25=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=D2',this)";>
        </button>
        <button type="button" class="box a" id="D3"
                <c:choose><c:when test="${shipPos26=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=D3',this)";>
        </button>
        <button type="button" class="box a" id="D4"
                <c:choose><c:when test="${shipPos27=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=D4',this)";>
        </button>
        <button type="button" class="box a" id="D5"
                <c:choose><c:when test="${shipPos28=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=D5',this)";>
        </button>
        <button type="button" class="box a" id="D6"
                <c:choose><c:when test="${shipPos29=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=D6',this)";>
        </button>
        <button type="button" class="box a" id="D7"
                <c:choose><c:when test="${shipPos30=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=D7',this)";>
        </button>
        <button type="button" class="box a" id="D8"
                <c:choose><c:when test="${shipPos31=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=D8',this)";>
        </button>

        <!-- ROW E #############################################-->

        <button type="button" class="box r" disabled>E</button>

        <button type="button" class="box a" id="E1"
                <c:choose><c:when test="${shipPos32=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=E1',this)";>
        </button>
        <button type="button" class="box a" id="E2"
                <c:choose><c:when test="${shipPos33=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=E2',this)";>
        </button>
        <button type="button" class="box a" id="E3"
                <c:choose><c:when test="${shipPos34=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=E3',this)";>
        </button>
        <button type="button" class="box a" id="E4"
                <c:choose><c:when test="${shipPos35=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=E4',this)";>
        </button>
        <button type="button" class="box a" id="E5"
                <c:choose><c:when test="${shipPos36=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=E5',this)";>
        </button>
        <button type="button" class="box a" id="E6"
                <c:choose><c:when test="${shipPos37=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=E6',this)";>
        </button>
        <button type="button" class="box a" id="E7"
                <c:choose><c:when test="${shipPos38=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=E7',this)";>
        </button>
        <button type="button" class="box a" id="E8"
                <c:choose><c:when test="${shipPos39=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=E8',this)";>
        </button>

        <!-- ROW F ###########################################-->

        <button type="button" class="box r" disabled>F</button>

        <button type="button" class="box a" id="F1"
                <c:choose><c:when test="${shipPos40=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=F1',this)";>
        </button>
        <button type="button" class="box a" id="F2"
                <c:choose><c:when test="${shipPos41=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=F2',this)";>
        </button>
        <button type="button" class="box a" id="F3"
                <c:choose><c:when test="${shipPos42=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=F3',this)";>
        </button>
        <button type="button" class="box a" id="F4"
                <c:choose><c:when test="${shipPos43=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=F4',this)";>
        </button>
        <button type="button" class="box a" id="F5"
                <c:choose><c:when test="${shipPos44=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=F5',this)";>
        </button>
        <button type="button" class="box a" id="F6"
                <c:choose><c:when test="${shipPos45=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=F6',this)";>
        </button>
        <button type="button" class="box a" id="F7"
                <c:choose><c:when test="${shipPos46=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=F7',this)";>
        </button>
        <button type="button" class="box a" id="F8"
                <c:choose><c:when test="${shipPos47=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=F8',this)";>
        </button>

        <!-- ROW G ############################################-->

        <button type="button" class="box r" disabled>G</button>

        <button type="button" class="box a" id="G1"
                <c:choose><c:when test="${shipPos48=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=G1',this)";>
        </button>
        <button type="button" class="box a" id="G2"
                <c:choose><c:when test="${shipPos49=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=G2',this)";>
        </button>
        <button type="button" class="box a" id="G3"
                <c:choose><c:when test="${shipPos50=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=G3',this)";>
        </button>
        <button type="button" class="box a" id="G4"
                <c:choose><c:when test="${shipPos51=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=G4',this)";>
        </button>
        <button type="button" class="box a" id="G5"
                <c:choose><c:when test="${shipPos52=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=G5',this)";>
        </button>
        <button type="button" class="box a" id="G6"
                <c:choose><c:when test="${shipPos53=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=G6',this)";>
        </button>
        <button type="button" class="box a" id="G7"
                <c:choose><c:when test="${shipPos54=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=G7',this)";>
        </button>
        <button type="button" class="box a" id="G8"
                <c:choose><c:when test="${shipPos55=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=G8',this)";>
        </button>

        <!-- ROW H ############################################-->

        <button type="button" class="box r" disabled>H</button>

        <button type="button" class="box a" id="H1"
                <c:choose><c:when test="${shipPos56=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=H1',this)";>
        </button>
        <button type="button" class="box a" id="H2"
                <c:choose><c:when test="${shipPos57=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=H2',this)";>
        </button>
        <button type="button" class="box a" id="H3"
                <c:choose><c:when test="${shipPos58=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=H3',this)";>
        </button>
        <button type="button" class="box a" id="H4"
                <c:choose><c:when test="${shipPos59=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=H4',this)";>
        </button>
        <button type="button" class="box a" id="H5"
                <c:choose><c:when test="${shipPos60=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=H5',this)";>
        </button>
        <button type="button" class="box a" id="H6"
                <c:choose><c:when test="${shipPos61=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=H6',this)";>
        </button>
        <button type="button" class="box a" id="H7"
                <c:choose><c:when test="${shipPos62=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=H7',this)";>
        </button>
        <button type="button" class="box a" id="H8"
                <c:choose><c:when test="${shipPos63=='1'}">disabled</c:when></c:choose>
                onclick="disabled=true; sendPos('${pageContext.request.contextPath}/updateShip?id=H8',this)";>
        </button>

    </div>

    <input type="button" id="confirm" value="Gotowy do gry" class="confirm confirm-button"
           onclick="window.location.href='${pageContext.request.contextPath}/play'" />

</div>
<h1 style="color: crimson; text-align: center; font-size: 15px"> </h1>
</body>
</html>