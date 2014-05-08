<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="background-color: #F7F6F3">
    <table class="style1">
        <tr>
            <td bgcolor="#5D7B9D" colspan="4" 
                style="font-size: x-large; color: #3333CC; text-align: center;">
                <strong style="color: #FFFFFF; ">Administrator Log In</strong></td>
        </tr>
        <tr>
            <td bgcolor="#F7F6F3" colspan="4" 
                style="font-size: x-large; color: #3333CC; text-align: center; height: 8px;">
                </td>
        </tr>
        <tr>
            <td bgcolor="#F7F6F3" rowspan="3" width="270">
                &nbsp;</td>
            <td bgcolor="#F7F6F3" style="width: 63px; color: #000000">
                Username:</td>
            <td bgcolor="#F7F6F3" style="width: 170px">
                <asp:TextBox ID="tbUser" runat="server" Width="130px" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="tbUser" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td bgcolor="#F7F6F3">
    <asp:Label ID="lbName" runat="server" Text="Username does not exist" 
        Visible="False" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#F7F6F3" style="width: 63px; color: #000000">
                Password:</td>
            <td bgcolor="#F7F6F3" style="width: 170px">
                <asp:TextBox ID="tbPass" runat="server" EnableTheming="True" 
                    TextMode="Password" Width="130px" MaxLength="16"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="tbPass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td bgcolor="#F7F6F3">
                <asp:Label ID="lbPass" runat="server" ForeColor="Red" Text="Incorrect password"></asp:Label>
            </td>
        </tr>
        <tr>
            <td bgcolor="#F7F6F3" style="width: 63px">
                &nbsp;</td>
            <td bgcolor="#F7F6F3" style="width: 170px; text-align: center">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Log In" />
            </td>
            <td bgcolor="#F7F6F3">
                &nbsp;</td>
        </tr>
    </table>
</div>
</asp:Content>

