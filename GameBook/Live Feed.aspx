<%@ Page Title="Live Feed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Live Feed.aspx.cs" Inherits="Live_Feed" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <!-- <h1><%: Title %>.</h1> -->
                <h2><strong>Live Feed</strong><br /><i>See what your friends are up to right now.</i></h2>
            </hgroup>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Most recent posts</h3>
	<Table style="margin:0 auto">
		<tr>
			<td>
				<!-- TODO: add posts here -->
				<asp:GridView ID="gvPosts" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                        <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                        <asp:BoundField DataField="NoteID" HeaderText="NoteID" InsertVisible="False" ReadOnly="True" SortExpression="NoteID" Visible="False" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GameBookConnectionString2 %>" SelectCommand="SELECT TOP 30 c.FirstName AS Name, n.PostTime AS Time, n.Message, n.NoteID 
FROM Character AS c, (SELECT * FROM Note, (SELECT PostID AS Post FROM PostToCharacter WHERE CharacterID = @currUser) AS pc WHERE NoteID =pc.Post) AS n
WHERE  n.PosterID = c.CharacterID
ORDER BY Time DESC" DeleteCommand="DELETE FROM PostToCharacter
WHERE (PostToCharacter.CharacterID = @currUser) AND (PostToCharacter.PostID = @NoteID);
DELETE FROM Note
WHERE Note.NoteID = @NoteID">
                    <DeleteParameters>
                        <asp:Parameter Name="currUser" />
                        <asp:Parameter Name="NoteID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="currUser" SessionField="LoginCID" />
                    </SelectParameters>
                </asp:SqlDataSource>
			    <br />
                <asp:Button ID="btnCreatePost" runat="server" OnClick="btnCreatePost_Click" Text="Create Post" />
			    <br />
                <br />
                <asp:Button ID="btnRescue" runat="server" OnClick="btnRescue_Click" Text="Rescue" />
			</td>
		</tr>
	</Table>
	
</asp:Content>