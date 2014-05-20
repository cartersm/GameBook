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
  <!--  <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Hero">
    </asp:CheckBoxList>
    <br /> -->
    <asp:Button ID="btnRescued" runat="server" OnClick="btnRescued_Click" Text="Be Rescued" />
    <br />
    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2" GroupItemCount="3">
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
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" SelectCommand="SELECT c.FirstName AS Name
FROM Character AS c
WHERE c.CharacterID  IN  (SELECT Hero FROM Rescue WHERE Rescue_Status = 1 AND Damsel = @currUser)
ORDER BY Name ASC">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="currUser" SessionField="LoginCID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <asp:Button ID="btnLiveFeed" runat="server" OnClick="btnLiveFeed_Click" Text="Home" />
    <br />
</asp:Content>

