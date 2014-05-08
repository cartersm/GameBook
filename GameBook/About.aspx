<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2><i>Learn more about GameBook.</i></h2>
    </hgroup>

    <article>
        <p>        
            <strong>
                GameBook is for video game characters from all genres.
            </strong><br />
            <i>
                GameBook has never discriminated against characters by genre, series, game, or affiliation. <br />
                We welcome everyone who wants to join. Just don't cause trouble!
            </i>
        </p>

        <p>        
            <strong>
                GameBook is totally free.
            </strong><br />
            <i>
                We have never charged for our services, nor do we have any special services for paying members.
            </i>
        </p>

        <p>        
            <!-- TODO? -->
        </p>
    </article>

    <aside>
        <h3>Quick Links</h3>
        <p>        
            <!--Use this area to provide additional information.-->
        </p>
        <ul>
            <li><a runat="server" href="~/">Home</a></li>
            <li><a runat="server" href="~/About">About</a></li>
            <li><a runat="server" href="~/Contact">Contact</a></li>
        </ul>
    </aside>
</asp:Content>