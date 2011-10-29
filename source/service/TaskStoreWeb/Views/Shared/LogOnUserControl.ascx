<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        <div>Welcome <strong><%: Page.User.Identity.Name %></strong>!</div>
        <div><%: Html.ActionLink("Sign out", "LogOff", "Account") %></div>

<%
    }
    else {
%> 
        <div><%: Html.ActionLink("Log In", "LogOn", "Account") %></div>
<%
    }
%>
