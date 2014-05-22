<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Relation.aspx.cs" Inherits="Relation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="j" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <br />
                            <asp:GridView ID="gvRelationships" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRelationships" DataKeyNames="CharacterID">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:BoundField DataField="CharacterID" HeaderText="CharacterID" SortExpression="CharacterID" ReadOnly="True" Visible="False" />
                                    <asp:BoundField DataField="RelationshipName" HeaderText="RelationshipName" SortExpression="RelationshipName" />
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" ReadOnly="True" />
                                </Columns>
                            </asp:GridView>
                            </p>
                            <asp:SqlDataSource ID="SqlDataSourceRelationships" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionString2 %>" SelectCommand="SELECT [CharacterID], [RelationshipName], [FirstName] FROM [Relations_View] WHERE ([UserCID] = @UserCID)" DeleteCommand="DELETE FROM Relations WHERE (UserCID = @currUser) AND (RescuedCID = @RescuedCID)" UpdateCommand="UPDATE Relations SET RelationshipName = @RelationshipName WHERE (UserCID = @currUser) AND (RescuedCID = @RescuedCID)">
                                <DeleteParameters>
                                    <asp:SessionParameter Name="currUser" SessionField="LoginCID" />
                                    <asp:ControlParameter ControlID="gvRelationships" Name="RescuedCID" PropertyName="SelectedDataKey" Type="Object" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="UserCID" SessionField="LoginCID" Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="RelationshipName" Type="String" />
                                    <asp:SessionParameter Name="currUser" SessionField="LoginCID" />
                                    <asp:ControlParameter ControlID="gvRelationships" Name="RescuedCID" PropertyName="SelectedValue" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        <br />
    <asp:DropDownList ID="ddlRescued" runat="server" DataSourceID="SqlDSPostTo" DataTextField="Name" DataValueField="CharacterID">
    </asp:DropDownList>
    <br />
    <asp:TextBox ID="tbRelationName" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="bttnNewRelation" runat="server" OnClick="bttnNewRelation_Click" Text="Create Relation" />
    <br />
        <asp:SqlDataSource ID="SqlDSPostTo" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" SelectCommand="SELECT [Name], [CharacterID] FROM [Interact_View] WHERE (([Rescue_Status] = @Rescue_Status) AND ([CharacterID] &lt;&gt; @CharacterID) AND ([Hero] = @Hero))">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="Rescue_Status" Type="Int32" />
                <asp:SessionParameter Name="CharacterID" SessionField="LoginCID" Type="Int32" />
                <asp:SessionParameter Name="Hero" SessionField="LoginCID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
    <br />
    <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" />
</asp:Content>

