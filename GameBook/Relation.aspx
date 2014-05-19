<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Relation.aspx.cs" Inherits="Relation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <br />
                            <asp:GridView ID="gvRelationships" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceRelationships">
                                <Columns>
                                    <asp:BoundField DataField="Name" HeaderText="Name" ShowHeader="False" SortExpression="Name" />
                                    <asp:BoundField DataField="Relation" HeaderText="Relation" ShowHeader="False" SortExpression="Relation" />
                                </Columns>
                            </asp:GridView>
                            </p>
                            <asp:SqlDataSource ID="SqlDataSourceRelationships" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionString2 %>" SelectCommand="SELECT c.FirstName AS Name, r.RelationshipName AS Relation
FROM Character AS c, Relations AS r
WHERE r.UserCID =@currUser AND c.CharacterID = r.RescuedCID
ORDER BY Name ASC
">
                                <SelectParameters>
                                    <asp:SessionParameter Name="currUser" SessionField="LoginCID" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        <br />
    <br />
    <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" />
</asp:Content>

