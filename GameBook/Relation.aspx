<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Relation.aspx.cs" Inherits="Relation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="j" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <br />
                            <asp:GridView ID="gvRelationships" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRelationships">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField DataField="Relation" HeaderText="Relation" SortExpression="Relation" />
                                    <asp:BoundField DataField="RescuedCID" Visible="False" HeaderText="RescuedCID" SortExpression="RescuedCID" />
                                </Columns>
                            </asp:GridView>
                            </p>
                            <asp:SqlDataSource ID="SqlDataSourceRelationships" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionString2 %>" SelectCommand="SELECT c.FirstName AS Name, r.RelationshipName AS Relation, r.RescuedCID
FROM Character AS c, Relations AS r
WHERE r.UserCID =@currUser AND c.CharacterID = r.RescuedCID
ORDER BY Name ASC
" DeleteCommand="DELETE FROM Relations WHERE (UserCID = @currUser) AND (RescuedCID = @RescuedCID)">
                                <DeleteParameters>
                                    <asp:SessionParameter Name="currUser" SessionField="LoginCID" />
                                    <asp:Parameter Name="RescuedCID" />
                                    <asp:Parameter Name="RelationshipName" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="currUser" SessionField="LoginCID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        <br />
    <asp:DropDownList ID="ddlRescued" runat="server" DataSourceID="SqlDSPostTo" DataTextField="FirstName" DataValueField="Damsel">
    </asp:DropDownList>
    <br />
    <asp:TextBox ID="tbRelationName" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="bttnNewRelation" runat="server" OnClick="bttnNewRelation_Click" Text="Create Relation" />
    <br />
        <asp:SqlDataSource ID="SqlDSPostTo" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionStringPost %>" SelectCommand="SELECT c.FirstName, r.Damsel 
FROM Rescue AS r, Character AS c
WHERE @currUser  = r.Hero AND r.Damsel = c.CharacterID AND r.Rescue_Status = 1 
ORDER BY c.FirstName ASC">
            <SelectParameters>
                <asp:SessionParameter Name="currUser" SessionField="LoginCID" />
            </SelectParameters>
        </asp:SqlDataSource>
    <br />
    <br />
    <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" />
</asp:Content>

