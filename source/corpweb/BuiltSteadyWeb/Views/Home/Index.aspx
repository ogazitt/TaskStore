<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<BuiltSteadyWeb.Models.Email>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    BuiltSteady
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
    <%--<link rel="stylesheet" href="/Content/Index.css"/>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<form runat="server">
    <%--
    <h2><%: ViewBag.Message %></h2>
    <p>
        Coming soon...
    </p>
    --%>
    <center>
    <p>Welcome!  Sign up for news and early access.</p>
    <input type="email" class="subscriber" id="Email" name="EmailAddress" />
    <input type="submit" class="subbutton" value="Subscribe" />
    <p />
    <div id="submitted">
        Thanks! <span id="submitted-email"><%: (string) ViewBag.Email %></span> has been subscribed to updates.
    </div>
    <div id="validationerrors">Hey <span id="invalid-email" class="red"><%: (string) ViewBag.InvalidEmail %></span>, we 
        can only sign you up with a valid e-mail address :)
     <!-- <%: Html.ValidationMessageFor(m => m.EmailAddress) %> -->
     </div>
    </center>
    <script type="text/javascript">
        $(document).ready(function () {
            var email = $("span#submitted-email").html();
            if (email === "")
                $("div#submitted").hide();
            var invalidEmail = $("span#invalid-email").html();
            if (invalidEmail === "")
                $("div#validationerrors").hide();
        });
    </script>
</form>
</asp:Content>
