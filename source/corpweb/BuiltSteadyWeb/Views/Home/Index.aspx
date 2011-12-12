<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<BuiltSteadyWeb.Models.Email>" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title>BuiltSteady</title>

    <script type="text/javascript">
        // document ready handler
        $(function () {
            $(".tagline").fadeIn(1500);
        });
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="main-content">

    <div class="tagline">
        <img runat="server" src="~/content/images/simplify.png" alt="simplify your life" />
    </div>
    <form runat="server" id="form">
        <p>Please enter your email to receive news and early access.</p>
        <input type="text" id="Email" name="EmailAddress" />
        <div class="control-button" onclick="form.submit()">Register</div>
    </form>

<%  if (!string.IsNullOrEmpty((string)ViewBag.Email)) { %>
    <div>
        Thank you! 
        "<span><%: (string)ViewBag.Email%></span>" has been registered for news and updates.
    </div>
<%  } %>

<%  if (!string.IsNullOrEmpty((string)ViewBag.InvalidEmail)) { %>
    <div>
        "<span class="error"><%: (string)ViewBag.InvalidEmail %></span>" is not a valid email address.<br /> 
        Please enter a valid email address to register.
    </div>
<%  } %>

</div>
</asp:Content>
