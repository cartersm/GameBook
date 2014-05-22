<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SendPost.aspx.cs" Inherits="SendPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <asp:DropDownList ID="ddlPostTo" runat="server" DataSourceID="SqlDSPostTo" DataTextField="Name" DataValueField="CharacterID">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPostTo" runat="server" ControlToValidate="ddlPostTo" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="tbPost" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPost" runat="server" ControlToValidate="tbPost" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="btnCreatePost" runat="server" OnClick="btnCreatePost_Click" Text="Post" />
        <asp:Button ID="btnLiveFeed" runat="server" CausesValidation="False" OnClick="btnLiveFeed_Click" Text="Home" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDSPostTo" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" SelectCommand="SELECT [Name], [CharacterID] FROM [Interact_View] WHERE (([Rescue_Status] = @Rescue_Status) AND ([Hero] = @Hero))">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="Rescue_Status" Type="Int32" />
                <asp:SessionParameter Name="Hero" SessionField="LoginCID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

