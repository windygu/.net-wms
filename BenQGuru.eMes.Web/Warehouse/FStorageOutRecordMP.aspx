<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FStorageOutRecordMP.aspx.cs"
    Inherits="BenQGuru.eMES.Web.WarehouseWeb.FStorageOutRecordMP" %>

<%@ Register TagPrefix="cc1" Namespace="BenQGuru.eMES.Web.Helper" Assembly="BenQGuru.eMES.WebUI.Helper" %>
<%@ Register TagPrefix="cc2" Namespace="BenQGuru.eMES.Web.SelectQuery" Assembly="BenQGuru.eMES.Web.SelectQuery" %>
<%@ Register TagPrefix="uc1" TagName="eMESDate" Src="~/UserControl/DateTime/DateTime/eMESDate.ascx" %>
<%@ Register Assembly="Infragistics35.Web.v11.2, Version=11.2.20112.1019, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.Web.UI.GridControls" TagPrefix="ig" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>FStorageOutRecordMP</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="CODE_LANGUAGE" content="C#">
    <meta name="vs_defaultClientScript" content="JavaScript">
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
    <link href="<%=StyleSheet%>" rel="stylesheet">
</head>
<body ms_positioning="GridLayout">
    <form id="Form1" method="post" runat="server">
    <table id="table1" height="100%" width="100%" runat="server">
        <tr class="moduleTitle">
            <td>
                <asp:Label ID="lblTitle" runat="server" CssClass="labeltopic">���������¼����</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table class="query" height="100%" width="100%">
                    <tr>
                        <td class="fieldNameLeft" nowrap>
                            <asp:Label ID="lblPickNoQuery" runat="server">����������</asp:Label>
                        </td>
                        <td class="fieldValue" nowrap>
                            <asp:TextBox ID="txtPickNoQuery" runat="server" CssClass="textbox" Width="130px"></asp:TextBox>
                        </td>
                        <td class="fieldName" nowrap>
                            <asp:Label ID="lblStorageQuery" runat="server">��λ</asp:Label>
                        </td>
                        <td class="fieldValue" nowrap>
                            <asp:DropDownList ID="drpStorageQuery" runat="server" CssClass="textbox" Width="130px"
                                DESIGNTIMEDRAGDROP="94">
                            </asp:DropDownList>
                        </td>
                  
                        <td class="fieldNameLeft" nowrap>
                            <asp:Label ID="lblPickStartDateQuery" runat="server">������ʼ����</asp:Label>
                        </td>
                        <td class="fieldValue">
                            <asp:TextBox type="text" ID="dateInDateFromQuery" class='datepicker' runat="server"
                                Width="100px" />
                        </td>
                        <td class="fieldName" nowrap>
                            <asp:Label ID="lblInDateToQuery" runat="server"> ��</asp:Label>
                        </td>
                        <td class="fieldValue">
                            <asp:TextBox type="text" ID="dateInDateToQuery" class='datepicker' runat="server"
                                Width="100px" />
                        </td>
                        <td nowrap colspan="5" width="100%">
                        </td>
                        <td class="fieldName">
                            <input class="submitImgButton" id="cmdQuery" type="submit" value="�� ѯ" name="btnQuery"
                                runat="server" />
                        </td>
                    </tr>
                    
                    <tr>
                       
                        <td class="fieldNameLeft" nowrap>
                            <asp:Label ID="lblPickTypeQuery" runat="server">��������</asp:Label>
                        </td>
                        <td class="fieldValue" style="width: 159px">
                            <asp:DropDownList ID="drpPickTypeQuery" runat="server" CssClass="textbox" Width="150px"
                                DESIGNTIMEDRAGDROP="94">
                            </asp:DropDownList>
                        </td>
                       <td class="fieldNameLeft" nowrap>
                            <asp:Label ID="lblInvNoQuery" runat="server">SAP���ݺ�</asp:Label>
                        </td>
                        <td class="fieldValue" style="width: 159px">
                            <asp:TextBox ID="txtInvNoQuery" runat="server" Width="150px" DESIGNTIMEDRAGDROP="257"
                                CssClass="textbox"></asp:TextBox>
                        </td>
                        
                         <td class="fieldNameLeft" nowrap>
                          
                        </td>
                        <td class="fieldValue" nowrap>
                         
                        </td>
                        <td class="fieldName" nowrap>
                         
                        </td>
                        <td class="fieldValue" nowrap>
                       
                        </td>
                        
                        <td class="fieldNameLeft" nowrap>
                       
                        </td>
                        <td class="fieldValue">
                          
                        </td>
                        <td class="fieldName" nowrap>
                        
                        </td>
                        <td class="fieldValue">
                          
                        </td>
                        <td nowrap colspan="5" width="100%">
                        </td>
                        <td class="fieldName">
                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr height="100%">
            <td class="fieldGrid">
                <ig:WebDataGrid ID="gridWebGrid" runat="server" Width="100%">
                </ig:WebDataGrid>
            </td>
        </tr>
        <tr class="normal">
            <td>
                <table height="100%" cellpadding="0" width="100%">
                    <tr>
                        <td class="smallImgButton">
                            <input class="gridExportButton" id="cmdGridExport" type="submit" value="  " name="cmdGridExport"
                                runat="server" />
                        </td>
                        <%--  <td class="smallImgButton">
                            <input class="deleteButton" id="cmdDelete" type="submit" value="  " name="cmdDelete"
                                runat="server">
                        </td>--%>
                        <td>
                            <cc1:pagersizeselector id="pagerSizeSelector" runat="server">
                            </cc1:pagersizeselector>
                        </td>
                        <td align="right">
                            <cc1:PagerToolbar id="pagerToolBar" runat="server">
                            </cc1:PagerToolbar>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>