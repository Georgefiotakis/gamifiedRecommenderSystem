<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .headerFont{
        /*font-family: lago;*/
    }

    .headerFontSize12{
        font-size: 10pt;
    }

    .headerFontSize14{
        font-size: 14pt;
    }

    .headerFontSpace{
        letter-spacing: 5px;
    }
</style>

<header class="main-header">
    <nav class="navbar navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <%--<a href="../../index2.html" class="navbar-brand"><b>Admin</b>LTE</a>--%>
                <a href="${pageContext.request.contextPath}/overallView?pilot=${headerInfo}" class="navbar-brand">
                    <%--<!-- mini logo for sidebar mini 50x50 pixels -->--%>
                    <%--<span class="logo-mini"><b>D</b>ome</span>--%>
                        <i class="fa fa-angle-left"></i>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg headerFont headerFontSize14 headerFontSpace" style="padding-left: 15px">OrbEEt</span>
                </a>
            </div>


            <!-- Navbar Right Menu -->
            <%--<div class="navbar-custom-menu">--%>
                <%--<ul class="nav navbar-nav">--%>

                    <%--<!-- User Account Menu -->--%>
                    <%--<li class="dropdown user user-menu">--%>
                        <%--<!-- Menu Toggle Button -->--%>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">--%>
                            <%--<!-- The user image in the navbar-->--%>
                            <%--<img src="${pageContext.request.contextPath}/resources/img/nobelgrid/nobelgrid.png" class="user-image" alt="User Image">--%>
                            <%--<!-- hidden-xs hides the username on small devices so only the image appears. -->--%>
                            <%--<span class="hidden-xs headerFont headerFontSize12" style="padding-right: 10px;">Facility Manager</span>--%>
                        <%--</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <!-- /.navbar-custom-menu -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</header>