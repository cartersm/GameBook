<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <fieldset >
        <legend >Registration Form</legend>
        <ol >
            <li >
                <asp:Label runat="server" ID="Label1">User name</asp:Label>
                <asp:TextBox runat="server" ID="UserName" CausesValidation="True" MaxLength="30" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                    CssClass="field-validation-error" ErrorMessage="The user name field is required." ID="RequiredFieldValidator1" />
    <asp:Label ID="lbName" runat="server" Text="Username is already taken" 
        Visible="False" ForeColor=#E80C4D Font-Bold="True" CssClass="field-validation-error"></asp:Label>
            </li>
            <li _>
                <asp:Label runat="server"  ID="Label2">Password</asp:Label>
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CausesValidation="True" MaxLength="16" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    CssClass="field-validation-error" ErrorMessage="The password field is required." ID="RequiredFieldValidator2" />
            </li>
            <li >
                <asp:Label runat="server" ID="Label3">Confirm password</asp:Label>
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CausesValidation="True" MaxLength="16" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required." ID="RequiredFieldValidator3" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." ID="CompareValidator1" />
            </li>
        </ol>
        <asp:Button runat="server" CommandName="MoveNext" Text="Register" OnClick="btnRegister_Click" ID="btnRegister" />
    </fieldset>
</asp:Content>

