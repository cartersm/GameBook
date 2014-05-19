<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Rescue.aspx.cs" Inherits="Rescue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:DropDownList ID="ddlDamsel" runat="server" DataSourceID="SqlDataSourceRescue" DataTextField="FirstName" DataValueField="CharacterID">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceRescue" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" SelectCommand="SELECT c.FirstName, c.CharacterID
FROM Character AS c
WHERE c.CharacterID NOT IN  (SELECT Hero FROM Rescue WHERE Damsel = @currUser)
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="Hero" HeaderText="Hero" ReadOnly="True" SortExpression="Hero" Visible="False" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCompleteMission" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT c.FirstName AS Name, r.Hero
FROM Character AS c, Rescue AS r
WHERE @currUser = r.Damsel AND r.Rescue_Status = 0 AND r.Hero = c.CharacterID" UpdateCommand="UPDATE Rescue SET Rescue_Status = 1 WHERE (Damsel = @currUserD) AND (Hero = @original_Hero)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="currUser" SessionField="LoginCID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="currUserD" SessionField="LoginCID" />  
            <asp:Parameter Name="original_Hero" Type ="Int32"/>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" DeleteCommand="DELETE FROM [Rescue] WHERE [Hero] = @original_Hero AND [Damsel] = @original_Damsel" InsertCommand="INSERT INTO [Rescue] ([Hero], [Damsel], [Rescue_Status]) VALUES (@Hero, @Damsel, @Rescue_Status)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT c.FirstName AS Name, r.Hero
FROM Character AS c, Rescue AS r
WHERE @currUser = r.Damsel AND r.Rescue_Status = 0 AND r.Hero = c.CharacterID" UpdateCommand="UPDATE [Rescue] SET [Rescue_Status] = 1 WHERE [Hero] = @original_Hero AND [Damsel] = @original_Damsel AND [Damsel] = @currUserD">
        <DeleteParameters>
            <asp:Parameter Name="original_Hero" Type="Int32" />
            <asp:Parameter Name="original_Damsel" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Hero" Type="Int32" />
            <asp:Parameter Name="Damsel" Type="Int32" />
            <asp:Parameter Name="Rescue_Status" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="currUser" SessionField="LoginCID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="original_Hero" Type="Int32" />
            <asp:Parameter Name="original_Damsel" Type="Int32" />
            <asp:SessionParameter Name="currUserD" SessionField="LoginCID" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="ddlHero" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Hero">
    </asp:DropDownList>
    <br />
    <br />
    <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Hero">
    </asp:CheckBoxList>
    <br />
    <asp:Button ID="btnRescued" runat="server" OnClick="btnRescued_Click" Text="Be Rescued" />
    <br />
    <asp:Button ID="btnLiveFeed" runat="server" OnClick="btnLiveFeed_Click" Text="Home" />
    <br />
</asp:Content>

