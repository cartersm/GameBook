<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateForm.aspx.cs" Inherits="CreateForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 230px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">

    <table style="margin-left:30px">
        <tr>
            <td colspan="3">
                <asp:Label ID="lblPageTitle" runat="server" CssClass="label" Font-Bold="True" Text="Create Your Character Profile" style="width:auto;" Font-Size="XX-Large"></asp:Label></td>
        </tr>
        <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblTitle" runat="server" Text="Title:" text-align="right"   style="width:auto; text-align:center;"></asp:Label>
                    <asp:TextBox ID="tbTitle" runat="server" MaxLength="30" Wrap="False"  style="width:auto; margin-bottom: 0px; margin-top: 0px"></asp:TextBox>
                </td>
                
                <td class="auto-style1">
                    <asp:Label ID="lblFName" runat="server" Text="First Name:" style="width:auto"></asp:Label>
                    <asp:TextBox ID="tbFName" runat="server" CausesValidation="True" MaxLength="30" style="width:auto; margin-bottom: 0px; margin-top: 0px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbFName" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="lblLName" runat="server" Text="Last Name:"></asp:Label>
                    <asp:TextBox ID="tbLName" runat="server" MaxLength="30" style="width:auto; margin-bottom: 0px; margin-top: 0px"></asp:TextBox>
                </td>
            

        </tr>
        <tr>
            <td colspan="1" class="auto-style1">
                <asp:Label ID="lblGender" runat="server" Text="Gender:"></asp:Label>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Size="Smaller" RepeatDirection="Horizontal">
                    <asp:ListItem Value="M" Text="Male"></asp:ListItem>
                    <asp:ListItem Value="F" Text="Female"></asp:ListItem>
                    <asp:ListItem Selected="True" Text="Unselected"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td  colspan="1">
                <asp:Label ID="lblDOB" runat="server" Text="DOB:" style="width:auto"></asp:Label>
                <asp:TextBox ID="tbDOB" runat="server" TextMode="Date" CausesValidation="True"  style="margin-bottom: 0px; margin-top: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbDOB" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            <td  colspan="1">
                <asp:Label ID="lblAbout" runat="server" Text="About:" style="width:auto;"></asp:Label>
                <asp:TextBox ID="tbAbout" runat="server" TextMode="MultiLine"  style="margin-bottom: 0px; margin-top: 0px" Height="75" Width="300"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <td  colspan="3"> <asp:Label ID="lblImage" runat="server" Text="Upload a Picture for your character" Font-Bold="True" Font-Size="Large"  style="width:auto;"></asp:Label>
                            <br />
                            <asp:FileUpload ID="fulImgUpload" runat="server" />

            </td>
        </tr>
         <tr >
            <td colspan="6" align="center">
                <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />
               </td>
        </tr>
        
    </table>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    
</asp:Content>



