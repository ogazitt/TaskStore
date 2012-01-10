<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
    <script type="text/javascript" src="/Video/swfobject.js"></script>
    <script type="text/javascript">
        swfobject.registerObject("csSWF", "9.0.115", "expressInstall.swf");
    </script>
    <style type="text/css">
        body 
        {
            background-color: #1a1a1a;
            font: .8em/1.3em verdana,arial,helvetica,sans-serif;
            text-align: center;
        }
        #media
        {
            margin-top: 40px;
        }
        #noUpdate
        {
            margin: 0 auto;
            font-family:Arial, Helvetica, sans-serif;
            font-size: x-small;
            color: #cccccc;
            text-align: left;
            width: 210px; 
            height: 200px;	
            padding: 40px;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <video width="640" height="418" controls preload>
        <source src="/Video/zaplify.mp4" type="video/mp4" />
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="640" height="418" id="csSWF">
            <param name="movie" value="/Video/zaplify_controller.swf" />
            <param name="quality" value="best" />
            <param name="bgcolor" value="#1a1a1a" />
            <param name="allowfullscreen" value="true" />
            <param name="scale" value="showall" />
            <param name="allowscriptaccess" value="always" />
            <param name="flashvars" value="autostart=false&thumb=/Video/FirstFrame.png&thumbscale=45&color=0x000000,0x000000" />
            <!--[if !IE]>-->
            <object type="application/x-shockwave-flash" data="/Video/zaplify_controller.swf" width="640" height="418">
                <param name="quality" value="best" />
                <param name="bgcolor" value="#1a1a1a" />
                <param name="allowfullscreen" value="true" />
                <param name="scale" value="showall" />
                <param name="allowscriptaccess" value="always" />
                <param name="flashvars" value="autostart=false&thumb=/Video/FirstFrame.png&thumbscale=45&color=0x000000,0x000000" />
            <!--<![endif]-->
                <div id="noUpdate">
                    <p>The Camtasia Studio video content presented here requires JavaScript to be enabled and the latest version of the Adobe Flash Player. If you are using a browser with JavaScript disabled please enable it now. Otherwise, please update your version of the free Adobe Flash Player by <a href="http://www.adobe.com/go/getflashplayer">downloading here</a>. </p>
                </div>
            <!--[if !IE]>-->
            </object>
            <!--<![endif]-->
        </object>
    </video>
</asp:Content>


