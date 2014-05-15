<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Rescue.aspx.cs" Inherits="Rescue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DropDownList ID="ddlDamsel" runat="server" DataSourceID="SqlDataSourceRescue" DataTextField="FirstName" DataValueField="CharacterID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRescue" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" SelectCommand="SELECT c.FirstName, c.CharacterID
FROM Character AS c, (SELECT Hero AS h FROM Rescue WHERE @currUser = Damsel) AS r
WHERE c.CharacterID &lt;&gt; r.h
ORDER BY c.FirstName ASC
">
        <SelectParameters>
            <asp:SessionParameter Name="currUser" SessionField="LoginCID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnRescueCharacter" runat="server" OnClick="btnRescueCharacter_Click" Text="Begin Rescue" />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCompleteMission">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Hero" HeaderText="Hero" SortExpression="Hero" Visible="False" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCompleteMission" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT c.FirstName AS Name, r.Hero
FROM Character AS c, Rescue AS r
WHERE @currUser = r.Damsel AND r.Rescue_Status = 0" UpdateCommand="UPDATE Rescue 
SET Rescue_Status = 1
WHERE Damsel = @currUser;
INSERT INTO Rescue (Hero, Damsel, Rescue_Status)
VALUES (@currUser, @Hero, 1)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="currUser" SessionField="LoginCID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="currUser" />
            <asp:Parameter Name="Hero" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

