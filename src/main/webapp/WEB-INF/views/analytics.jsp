<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath}/resources/js/analytics.js"></script>
<style>

    @import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css");
    @import url("https://fonts.googleapis.com/css?family=Nunito:300,400,700");

    body {
        overflow-y: hidden;
    }

    html {
        scroll-behavior: smooth;
    }

    body {
        font-family: helvetica, arial, sans-serif;
        background-color: #2e2e31;
    }

</style>

<div class="pcoded-main-container">
    <div class="pcoded-wrapper">
        <div class="pcoded-content">
            <div class="pcoded-inner-content">
                <div class="main-body">
                    <div class="page-wrapper">
                        <div class="page-body">
                            <div class="col-lg-12">
                                <div class="row">
                                    <div class="col-lg-12">

                                    </div>
                                    <div class="currentUserId" id="currentUserId"style="display: none"><c:out value="${currentUserId}"/></div>
                                    <div class="currentSurveyId" id="currentSurveyId" style="display: none"><c:out value="${currentSurveyId}"/></div>
<%--                                    <div class="col-lg-6">--%>
<%--                                        --%>
<%--                                    </div>--%>
<%--                                    <div class="col-lg-3">--%>
<%--                                        --%>
<%--                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // function startingTheJourney() {
    //     location.replace("./userProfile");
    // }
    // function analyticsPage() {
    //     location.replace("./analytics");
    // }
</script>