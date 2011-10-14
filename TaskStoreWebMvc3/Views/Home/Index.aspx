<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    TaskStore
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="taskstore-main">
        <div id="taskstore-info">
            <img src="/Images/taskstore-graphic.png" alt="TaskStore - get it done." />
            <center>Get it done.</center>
        </div>
        <div id="logincontrol">
            <% Html.RenderPartial("LoginControl"); %>
        </div> 
    </div>
</asp:Content>
