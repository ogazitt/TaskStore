<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<BuiltSteadyWeb.Models.Email>" %>

<asp:Content ContentPlaceHolderID="Header" runat="server">
    <title>BuiltSteady</title>

    <script type="text/javascript">
        // document ready handler
        $(function () {
        });
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="main-content">
    <h2>Welcome!</h2>
    <div class="content-text">
        <p>
            BuiltSteady is an early-stage, self-funded startup out of the Seattle area.
            We are currently developing personal productivity software that integrates
            with and enriches the existing digital products consumers use today.
        </p>    
        <p>
            In the coming months we will be describing product scenarios and providing early
            previews of the software in order to solicit user feedback. If interested in
            participating in our early-adopter program, please provide an email address.
        </p>
    </div>

    <form runat="server" id="form">
        <p>Enter your email address to receive news and early access.</p>
        <input type="text" id="Email" name="EmailAddress" />
        <div class="control-button" onclick="form.submit()">Register</div>
    </form>

<%  if (!string.IsNullOrEmpty((string)ViewBag.Email)) { %>
    <div>
        Thank you! 
        <span><%: (string)ViewBag.Email%></span> has been registered for news and updates.
    </div>
<%  } %>

<%  if (!string.IsNullOrEmpty((string)ViewBag.InvalidEmail)) { %>
    <div>
        <span class="error"><%: (string)ViewBag.InvalidEmail %></span> is not a valid email address.<br /> 
        Please enter a valid email address to register.
    </div>
<%  } %>
</div>
</asp:Content>
