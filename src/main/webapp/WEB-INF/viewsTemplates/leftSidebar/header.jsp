<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<header>
    <nav class="navbar header-navbar pcoded-header">
        <div class="navbar-wrapper">
            <div class="navbar-logo">
<%--                <a href="${pageContext.request.contextPath}"><img class="img-fluid" alt="Theme-Logo"></a>--%>
            </div>
            <div class="navbar-container container-fluid">
                <ul class="nav-right">
<%--                    <li class="header-notification">--%>
<%--                        <div class="dropdown-primary dropdown">--%>
<%--                            <div class="dropdown-toggle" onclick="redirectionToMap()">--%>
<%--                                <i class="feather icon-home"></i>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </li>--%>
                    <li class="header-notification">
                        <div class="dropdown-primary dropdown">
                            <div class="dropdown-toggle" onclick="usersProfile()">
                                <i class="fa fa-user"></i><a><c:out value="${studentUserName}"/></a>
                            </div>
                        </div>
                    </li>
                    <li class="header-notification">
                        <div class="dropdown-primary dropdown">
                            <div class="dropdown-toggle" onclick="logout()">
                                <a>Logout</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>


<script>
    function redirectionToMap() {
        location.replace("./userProfile");
    }
    function logout() {
        location.replace("./logout");
    }
    function usersProfile() {
        location.replace("./userProfile");
    }
</script>