<%@ Page language="c#" Codebehind="FWHCountDetail.aspx.cs" AutoEventWireup="True" Inherits="BenQGuru.eMES.Web.WarehouseWeb.FWHCountDetail" %>
<%@ Register TagPrefix="igtbl" Namespace="Infragistics.WebUI.UltraWebGrid" Assembly="Infragistics35.WebUI.UltraWebGrid.v11.1, Version=11.1.20111.1006, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" %>
<%@ Register TagPrefix="cc1" Namespace="BenQGuru.eMES.Web.Helper" Assembly="BenQGuru.eMES.WebUI.Helper" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>FWHCountDetail</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<link href="<%=StyleSheet%>" rel=stylesheet>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<table height="100%" width="100%">
				<TBODY>
					<tr class="moduleTitle">
						<td><asp:label id="lblTitle" runat="server" CssClass="labeltopic"> 库房盘点</asp:label></td>
					</tr>
					<tr>
						<td>
							<table class="query" height="100%" width="100%">
								<TBODY>
									<tr>
										<td class="fieldNameLeft" noWrap><asp:label id="lblFactoryCodeQuery" runat="server"> 工厂代码</asp:label></td>
										<td class="fieldValue" style="WIDTH: 159px"><asp:TextBox id="txtFacCode" runat="server" CssClass="require" Width="130px" ReadOnly="True"></asp:TextBox></td>
										<td class="fieldName" noWrap>
											<asp:label id="lblWarehouseNameQuery" runat="server"> 仓库名称</asp:label></td>
										<td class="fieldValue" style="WIDTH: 159px"><asp:TextBox id="txtWHCode" runat="server" CssClass="require" Width="130px" ReadOnly="True"></asp:TextBox></td>
										<td class="fieldName" noWrap>
											<asp:label id="lblItemIDQuery" runat="server"> 物料代码</asp:label></td>
										<td class="fieldValue" style="WIDTH: 159px"><asp:TextBox id="txtWHItemCode" runat="server" CssClass="require" Width="130px" ReadOnly="True"></asp:TextBox></td>
										<td width="100%"></td>
									</tr>
									<tr>
										<td class="fieldName" noWrap>
											<asp:label id="lblLastQty" runat="server"> 上次盘点离散数量</asp:label></td>
										<td class="fieldValue" style="WIDTH: 159px"><asp:TextBox id="txtQty" runat="server" CssClass="require" Width="130px" ReadOnly="True"></asp:TextBox></td>
										<td class="fieldName" noWrap>
											<asp:label id="lblOpenQty" runat="server"> 目前帐面数</asp:label></td>
										<td class="fieldValue" style="WIDTH: 159px"><asp:TextBox id="txtOpenQty" runat="server" CssClass="require" Width="130px" ReadOnly="True"></asp:TextBox></td>
										<td noWrap width="100%" colspan="3"></td>
									</tr>
								</TBODY>
							</table>
						</td>
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
									<TD class="smallImgButton"><INPUT class="gridExportButton" id="cmdGridExport" type="submit" value="  " name="cmdGridExport"
											runat="server"> |
									</TD>
									<TD><cc1:pagersizeselector id="pagerSizeSelector" runat="server"></cc1:pagersizeselector></TD>
									<td align="right">
										<cc1:PagerToolbar id="pagerToolBar" runat="server"></cc1:PagerToolbar></td>
								</tr>
							</table>
						</td>
					</tr>
				</TBODY>
			</table>
		</form>
		</TR></TBODY></TABLE></TR></TBODY></TABLE></FORM>
	</body>
</HTML>
