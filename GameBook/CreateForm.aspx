<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="CreateForm.aspx.cs" Inherits="CreateForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: auto;
            text-align: left;
            align-items: center;
            
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
    
    <table  >
        <tr >
            <td colspan="6">
                <asp:Label ID="lblPageTitle" runat="server" CssClass="label" Font-Bold="True" Font-Size="XX-Large" Text="Create Your Character Profile" style="width:auto;"></asp:Label></td>
        </tr>
        <tr >
                <td class="auto-style1">
                    <asp:Label ID="lblTitle" runat="server" Text="Title:" text-align="right"   style="width:auto; text-align:center; font-weight:700; position:" Font-Size="Large"></asp:Label>
                    </td>
                
                <td class="auto-style1"><asp:TextBox ID="tbTitle" runat="server" MaxLength="30" Width="306px" Wrap="False"  style="margin-bottom: 0px; margin-top: 0px"></asp:TextBox></td>
                
                <td class="auto-style1">
                    <asp:Label ID="lblFName" runat="server" Text="First Name:"  style="width:auto;"></asp:Label>
                        </td>
            <td class="auto-style1"><asp:TextBox ID="tbFName" runat="server" CausesValidation="True" style="margin-bottom: 0px; margin-top: 0px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbFName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style1"   >
                    <asp:Label ID="lblLName" runat="server" Text="Last Name:"  style="width:auto;"></asp:Label></td>
                    <td class="auto-style1"  ><asp:TextBox ID="tbLName" runat="server"  style="margin-bottom: 0px; margin-top: 0px"></asp:TextBox></td>

        </tr>
        <tr  >
            <td  colspan="3">
                <asp:Label ID="lblGender" runat="server" Text="Gender:" style="width:auto;"></asp:Label>
                <br/>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="200px" Font-Size="Smaller" RepeatDirection="Horizontal">
                    <asp:ListItem Value="M" Text="Male"></asp:ListItem>
                    <asp:ListItem Value="F" Text="Female"></asp:ListItem>
                    <asp:ListItem Selected="True" Text="Unselected"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
            </td>
           <td  colspan="3">
                <asp:Label ID="lblDOB" runat="server" Text="DOB:"  style="width:auto;"></asp:Label>
                <asp:TextBox ID="tbDOB" runat="server" TextMode="Date" CausesValidation="True"  style="margin-bottom: 0px; margin-top: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbDOB" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
           </td>
        </tr>
        <tr  >
            <td  colspan="3"> <asp:Label ID="lblImage" runat="server" Text="Upload a Picture for your character" Font-Bold="True" Font-Size="Large"  style="width:auto;"></asp:Label>
                            <br />
                            <asp:FileUpload ID="fulImgUpload" runat="server" />

            </td>
            <td  colspan="3">
                <asp:Label ID="lblAbout" runat="server" Text="About:" style="width:auto;"></asp:Label>
                <asp:TextBox ID="tbAbout" runat="server" TextMode="MultiLine"  style="margin-bottom: 0px; margin-top: 0px"></asp:TextBox>
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

