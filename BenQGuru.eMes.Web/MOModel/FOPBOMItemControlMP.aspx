<%@ Register TagPrefix="cc1" Namespace="BenQGuru.eMES.Web.Helper" Assembly="BenQGuru.eMES.WebUI.Helper" %>
<%@ Register TagPrefix="igtbl" Namespace="Infragistics.WebUI.UltraWebGrid" Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.1006, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>
<%@ Page language="c#" Codebehind="FOPBOMItemControlMP.aspx.cs" AutoEventWireup="True" Inherits="BenQGuru.eMES.Web.MOModel.FOPBOMItemControlMP" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FOPBOMItemControlMP</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="<%=StyleSheet%>" rel=stylesheet>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table height="100%" width="100%">
				<tr class="moduleTitle">
					<td><asp:label id="lblTitle" runat="server" CssClass="labeltopic"> ��Ʒ���Ʒ�Χ�趨</asp:label></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr height="100%">
					<td class="fieldGrid"><igtbl:ultrawebgrid id="gridWebGrid" runat="server" Width="100%" Height="100%">
							<DisplayLayout ColWidthDefault="" StationaryMargins="Header" AllowSortingDefault="Yes" RowHeightDefault="20px"
								Version="2.00" SelectTypeRowDefault="Single" SelectTypeCellDefault="Single" HeaderClickActionDefault="SortSingle"
								BorderCollapseDefault="Separate" AllowColSizingDefault="Free" CellPaddingDefault="4" RowSelectorsDefault="No"
								Name="webGrid" TableLayout="Fixed">
								<AddNewBox>
									<Style BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">

<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White">
</BorderDetails>

									</Style>
								</AddNewBox>
								<Pager>
									<Style BorderWidth="1px" BorderStyle="Solid" BackColor="LightGray">

<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White">
</BorderDetails>

									</Style>
								</Pager>
								<HeaderStyleDefault BorderWidth="1px" Font-Size="12px" Font-Bold="True" BorderColor="White" BorderStyle="Dashed"
									HorizontalAlign="Left" BackColor="#ABABAB">
									<BorderDetails ColorTop="White" WidthLeft="1px" ColorBottom="White" WidthTop="1px" ColorRight="White"
										ColorLeft="White"></BorderDetails>
								</HeaderStyleDefault>
								<RowSelectorStyleDefault BackColor="#EBEBEB"></RowSelectorStyleDefault>
								<FrameStyle Width="100%" BorderWidth="0px" Font-Size="12px" Font-Names="Verdana" BorderColor="#ABABAB"
									BorderStyle="Groove" Height="100%"></FrameStyle>
								<FooterStyleDefault BorderWidth="0px" BorderStyle="Groove" BackColor="LightGray">
									<BorderDetails ColorTop="White" WidthLeft="1px" WidthTop="1px" ColorLeft="White"></BorderDetails>
								</FooterStyleDefault>
								<ActivationObject BorderStyle="Dotted"></ActivationObject>
								<EditCellStyleDefault VerticalAlign="Middle" BorderWidth="1px" BorderColor="Black" BorderStyle="None">
									<Padding Bottom="1px"></Padding>
								</EditCellStyleDefault>
								<RowAlternateStyleDefault BackColor="White"></RowAlternateStyleDefault>
								<RowStyleDefault VerticalAlign="Middle" BorderWidth="1px" BorderColor="#D7D8D9" BorderStyle="Solid"
									HorizontalAlign="Left">
									<Padding Left="3px"></Padding>
									<BorderDetails WidthLeft="0px" WidthTop="0px"></BorderDetails>
								</RowStyleDefault>
								<ImageUrls ImageDirectory="/ig_common/WebGrid3/"></ImageUrls>
							</DisplayLayout>
							<Bands>
								<igtbl:UltraGridBand></igtbl:UltraGridBand>
							</Bands>
						</igtbl:ultrawebgrid></td>
				</tr>
				<tr class="normal">
					<td>
						<table height="100%" cellPadding="0" width="100%">
							<tr>
								<td><asp:checkbox id="chbSelectAll" runat="server" Width="124px" AutoPostBack="True" Text="ȫѡ" oncheckedchanged="chbSelectAll_CheckedChanged"></asp:checkbox></td>
								<TD class="smallImgButton"><INPUT class="gridExportButton" id="cmdGridExport" type="submit" value="  " name="cmdCancel"
										runat="server" onserverclick="cmdGridExport_ServerClick"> |
								</TD>
								<TD class="smallImgButton"><INPUT class="deleteButton" id="cmdDelete" type="submit" value="  " name="cmdDelete" runat="server" onserverclick="cmdDelete_ServerClick">
									|
								</TD>
								<TD><cc1:pagersizeselector id="pagerSizeSelector" runat="server"></cc1:pagersizeselector></TD>
								<td align="right"><cc1:pagertoolbar id="pagerToolBar" runat="server" PageSize="20"></cc1:pagertoolbar></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="normal">
					<td>
						<table class="edit" height="100%" cellPadding="0" width="100%">
							<tr>
								<TD class="fieldNameLeft"><asp:label id="lblSupplierCodeEdit" runat="server">���̴���</asp:label></TD>
								<td class="fieldValue"><asp:textbox id="txtSupplierCodeEdit" runat="server" Width="130px"></asp:textbox></td>
								<td class="fieldName"><asp:label id="lblSupplierItemEdit" runat="server">�����Ϻ�</asp:label></td>
								<td class="fieldValue"><asp:textbox id="txtSupplierItemEdit" runat="server" Width="130px"></asp:textbox></td>
								<TD class="fieldNameLeft" noWrap><asp:label id="lblItemVersion" runat="server">���</asp:label></TD>
								<td class="fieldValue"><asp:textbox id="txtItemVersion" runat="server" Width="130px"></asp:textbox></td>
							</tr>
							<tr>
								<TD class="fieldNameLeft" noWrap><asp:label id="lblCardStartEdit" runat="server">���̿���Χ��ʼ</asp:label></TD>
								<td class="fieldValue"><asp:textbox id="txtCardStartEdit" runat="server" Width="130px"></asp:textbox></td>
								<td class="fieldName" noWrap><asp:label id="lblCardEndEdit" runat="server">���̿���Χ����</asp:label></td>
								<td class="fieldValue"><asp:textbox id="txtCardEndEdit" runat="server" Width="130px"></asp:textbox></td>
								<TD class="fieldName" noWrap><asp:label id="lblMemoEdit" runat="server">��ע</asp:label></TD>
								<td class="fieldValue"><asp:textbox id="txtMemoEdit" runat="server" Width="130px"></asp:textbox></td>
							</tr>
							<tr>
								<TD class="fieldNameLeft" noWrap><asp:label id="lblDataCodeStartEdit" runat="server">����������ʼ</asp:label></TD>
								<td class="fieldValue"><asp:textbox id="txtDataCodeStartEdit" runat="server" Width="130px"></asp:textbox></td>
								<td class="fieldName" noWrap><asp:label id="lblDateCodeEndEdit" runat="server">�������ڽ���</asp:label></td>
								<td class="fieldValue"><asp:textbox id="txtDateCodeEndEdit" runat="server" Width="130px"></asp:textbox></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<TD class="fieldName" noWrap><asp:label id="lblPCBAVersionEdit" runat="server">PCBA�汾</asp:label></TD>
								<td class="fieldValue"><asp:textbox id="txtPCBAVersionEdit" runat="server" Width="130px"></asp:textbox></td>
								<td colSpan="2" noWrap><asp:label id="lblPCBAVersionDescriptionEdit" runat="server">����ж������"��"�ֿ�</asp:label></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="fieldName" style="HEIGHT: 26px" noWrap><asp:label id="lblBIOSVersionEdit" runat="server">BIOS�汾</asp:label></td>
								<td class="fieldValue" style="HEIGHT: 26px"><asp:textbox id="txtBIOSVersionEdit" runat="server" Width="130px"></asp:textbox></td>
								<td colSpan="2" noWrap><asp:label id="lblBIOSVersionDescriptionEdit" runat="server">����ж������"��"�ֿ�</asp:label></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr class="toolBar">
					<td>
						<table class="toolBar">
							<tr>
								<td class="toolBar"><INPUT class="submitImgButton" id="cmdAdd" type="submit" value="�� ��" name="cmdAdd" runat="server" onserverclick="cmdAdd_ServerClick"></td>
								<td class="toolBar"><INPUT class="submitImgButton" id="cmdSave" type="submit" value="�� ��" name="cmdSave" runat="server" onserverclick="cmdSave_ServerClick"></td>
								<td class="toolBar"><INPUT class="submitImgButton" id="cmdCancel" type="submit" value="ȡ ��" name="cmdCancel"
										runat="server" onserverclick="cmdCancel_ServerClick"></td>
								<td><INPUT class="submitImgButton" id="cmdReturn" type="submit" value="�� ��" name="cmdReturn"
										runat="server" onserverclick="cmdReturn_ServerClick"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>