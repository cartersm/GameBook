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
WHERE c.CharacterID NOT IN  (SELECT r.Hero FROM Rescue r WHERE r.Damsel = @currUser)  AND c.CharacterID NOT IN  (SELECT Damsel FROM Rescue WHERE Hero = @currUser)
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Name] FROM [Interact_View] WHERE (([Hero] = @Hero) AND ([CharacterID] &lt;&gt; @CharacterID) AND ([Rescue_Status] = @Rescue_Status))">
        <SelectParameters>
            <asp:SessionParameter Name="Hero" SessionField="LoginCID" Type="Int32" />
            <asp:SessionParameter Name="CharacterID" SessionField="LoginCID" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="Rescue_Status" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="ddlHero" runat="server" DataSourceID="SqlDataSource2" DataTextField="FirstName" DataValueField="HeroID">
    </asp:DropDownList>
    <br />

    <asp:Button ID="btnRescued" runat="server" OnClick="btnRescued_Click" Text="Be Rescued" />
    <br />
    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="3">
        <AlternatingItemTemplate>
            <td runat="server" style="">Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="">Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br />
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="">Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">Name:
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" SelectCommand="SELECT [FirstName], [HeroID] FROM [Rescued_View] WHERE (([Rescue_Status] = @Rescue_Status) AND ([UserID] = @UserID))">
        <SelectParameters>
            <asp:Parameter DefaultValue="0" Name="Rescue_Status" Type="Int32" />
            <asp:SessionParameter Name="UserID" SessionField="LoginCID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <asp:Button ID="btnLiveFeed" runat="server" OnClick="btnLiveFeed_Click" Text="Home" />
    <br />
</asp:Content>

