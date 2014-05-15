<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SendPost.aspx.cs" Inherits="SendPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <asp:DropDownList ID="ddlPostTo" runat="server" DataSourceID="SqlDSPostTo" DataTextField="FirstName" DataValueField="Damsel">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPostTo" runat="server" ControlToValidate="ddlPostTo" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:TextBox ID="tbPost" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPost" runat="server" ControlToValidate="tbPost" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="btnCreatePost" runat="server" OnClick="btnCreatePost_Click" Text="Button" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDSPostTo" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" SelectCommand="SELECT c.FirstName, r.Damsel 
FROM Rescue AS r, Character AS c
WHERE @currUser  = r.Hero AND r.Damsel = c.CharacterID AND r.Rescue_Status = 1 
ORDER BY c.FirstName ASC">
            <SelectParameters>
                <asp:SessionParameter Name="currUser" SessionField="LoginCID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

