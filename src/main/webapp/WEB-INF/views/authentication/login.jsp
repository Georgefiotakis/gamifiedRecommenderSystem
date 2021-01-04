<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%--
  Created by IntelliJ IDEA.
  User: pandriopoulos
  Date: 5/25/15
  Time: 6:57 PM
  To change this template use File | Settings | File Templates.
--%>

<div class="container">
    <div id="login-wrapper">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div id="logo-login">
                    <%--<h3>Login<img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="Logo" class="pull-right"></h3>--%>
                    <h1>NobelGrid</h1>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="account-box">

                    <form:form class="login-wrapper" method="post" action="${pageContext.request.contextPath}/login">
                        <div class="form-group">
                            <label for="userName">User Name</label>
                            <input type="text" class="form-control" id="userName" name="username" placeholder="User Name">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                        </div>

                        <div class="row-block">
                            <div class="row">
                                <div class="col-md-12 row-block">
                                    <button class="btn btn btn-primary pull-right" type="submit">
                                        Login
                                    </button>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form:form>

                </div>
            </div>
        </div>

    </div>
</div>
