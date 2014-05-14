<%@ Page Title="Live Feed" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Live Feed.aspx.cs" Inherits="Live_Feed" %>

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
				<asp:DataList runat="server">
					
					
				</asp:DataList>
			</td>
		</tr>
	</Table>
	
</asp:Content>