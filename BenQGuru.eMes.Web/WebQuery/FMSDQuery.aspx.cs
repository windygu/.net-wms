﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using Infragistics.Web.UI.GridControls;
using Infragistics.Web.UI.LayoutControls;

using BenQGuru.eMES.Web.Helper;
using BenQGuru.eMES.WebQuery;
using BenQGuru.eMES.DataCollect;
using BenQGuru.eMES.Domain.MOModel;
using BenQGuru.eMES.Common;
using BenQGuru.eMES.Common.MutiLanguage;
using BenQGuru.eMES.Common.DomainDataProvider;
using BenQGuru.eMES.BaseSetting;
using BenQGuru.eMES.Domain.DataCollect;
using BenQGuru.eMES.Domain.Warehouse;
using BenQGuru.eMES.Material;

namespace BenQGuru.eMES.Web.WebQuery
{
    public partial class FMSDQUERY : BaseQPageNew
    {
        //protected ControlLibrary.Web.Language.LanguageComponent languageComponent1;
        //private System.ComponentModel.IContainer components;

        protected ExcelExporter excelExporter = null;
        protected WebQueryHelperNew _helper = null;

        protected GridHelperNew _gridHelper = null;
        private InventoryFacade _InventoryFacade = null;

        protected void Page_Load(object sender, System.EventArgs e)
        {
            this.gridHelper = new GridHelperNew(this.gridWebGrid, this.DtSource);
            this._gridHelper = new GridHelperNew(this.gridWebGrid,this.DtSource);

            if (!this.IsPostBack)
            {
                // 初始化页面语言
                this.InitPageLanguage(this.languageComponent1, false);

                this._initialWebGrid();

                this.drpMSDStatusQuery_Load();
            }

            this._helper = new WebQueryHelperNew(this.cmdQuery, this.cmdGridExport, this.gridWebGrid, this.pagerSizeSelector, this.pagerToolBar, this.languageComponent1,this.DtSource);
            this._helper.LoadGridDataSource += new EventHandler(_helper_LoadGridDataSource);
            this._helper.DomainObjectToGridRow += new EventHandler(_helper_DomainObjectToGridRow);
            this._helper.DomainObjectToExportRow += new EventHandler(_helper_DomainObjectToExportRow);
            this._helper.GetExportHeadText += new EventHandler(_helper_GetExportHeadText);
        }

        private void _initialWebGrid()
        {
            base.InitWebGrid();
            this._gridHelper.AddColumn("LotNO", "物料批号", null);
            this._gridHelper.AddColumn("MCode", "物料代码", null);
            this._gridHelper.AddColumn("Mname", "物料名称", null);
            this._gridHelper.AddColumn("MDesc", "物料描述", null);
            this._gridHelper.AddColumn("Status", "状态", null);
            this._gridHelper.AddColumn("FloorLife", "有效车间寿命", null);
            this._gridHelper.AddColumn("OverFloorlife", "剩余车间寿命", null);
            this._gridHelper.AddColumn("MaintainUser", "维护用户", null);
            this._gridHelper.AddColumn("MaintainDate", "维护日期", null);
            this._gridHelper.AddColumn("MaintainTime", "维护时间", null);

            //多语言
            this._gridHelper.ApplyLanguage(this.languageComponent1);
        }

        #region Web 窗体设计器生成的代码
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: 该调用是 ASP.NET Web 窗体设计器所必需的。
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// 设计器支持所需的方法 - 不要使用代码编辑器修改
        /// 此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.languageComponent1 = new ControlLibrary.Web.Language.LanguageComponent(this.components);
            //this.gridWebGrid.ClickCellButton += new Infragistics.WebUI.UltraWebGrid.ClickCellButtonEventHandler(this.gridWebGrid_ClickCellButton);
            // 
            // languageComponent1
            // 
            this.languageComponent1.Language = "CHS";
            this.languageComponent1.LanguagePackageDir = "\\\\grd2-build\\language pack\\";
            this.languageComponent1.RuntimePage = null;
            this.languageComponent1.RuntimeUserControl = null;
            this.languageComponent1.UserControlName = "";

        }
        #endregion

        private bool _checkRequireFields()
        {
            //查询条件-时间范围，是否输入完整
          //  bool isDateComplete = (this.dateStartDateQuery.Text.Trim() == string.Empty) || (this.dateEndDateQuery.Text.Trim() == string.Empty);

            //查询条件-生产工单范围，是否输入完整
          //  bool isMoComplete = (this.txtStartMoQuery.Text.Trim() == string.Empty) || (this.txtEndMoQuery.Text.Trim() == string.Empty);

            //查询条件-销售订单范围，是否输入完整
            //bool isSoComplete = (this.txtStartSoQuery.Text.Trim() == string.Empty) || (this.txtEndSoQuery.Text.Trim() == string.Empty);

            //if (isDateComplete && isMoComplete)
            //{
            //    //时间、生产工单、销售订单，都不完整（至少有一组要是完整的）
            //    WebInfoPublish.PublishInfo(this, "$At_Least_OneGroup_Condition", this.languageComponent1);
            //    return false;
            //}
            PageCheckManager manager = new PageCheckManager();
          //  manager.Add(new DateRangeCheck(this.lblStartDateQuery, this.dateStartDateQuery.Text, this.lblEndDateQuery, this.dateEndDateQuery.Text, true));

            if (!manager.Check())
            {
                WebInfoPublish.Publish(this, manager.CheckMessage, this.languageComponent1);
                return true;
            }
            return true;
        }


        private void _helper_LoadGridDataSource(object sender, EventArgs e)
        {

            string lotno = FormatHelper.CleanString(this.txtMaterialLotQuery.Text.Trim().ToUpper());
            string mcode = FormatHelper.CleanString(this.txtConditionItem.Text.Trim().ToUpper());
            string status = FormatHelper.CleanString(this.drpMSDStatusQuery.SelectedValue.Trim().ToUpper());

            
             if (_InventoryFacade == null)
            {
                _InventoryFacade = new InventoryFacade(base.DataProvider);
            }

            if (_checkRequireFields())
            {
                (e as WebQueryEventArgsNew).GridDataSource = this._InventoryFacade.QueryMSDInfo(
                    lotno,
                    mcode,
                    status,
                    (e as WebQueryEventArgsNew).StartRow,
                    (e as WebQueryEventArgsNew).EndRow);

                (e as WebQueryEventArgsNew).RowCount = this._InventoryFacade.QueryMSDInfoCount(
                    lotno,
                    mcode,
                    status);
            }
        }

        private void _helper_DomainObjectToGridRow(object sender, EventArgs e)
        {
            MSDLOTLExc obj = (e as DomainObjectToGridRowEventArgsNew).DomainObject as MSDLOTLExc;

            DataRow row = this.DtSource.NewRow();
            row["LotNO"] = obj.LotNo;
            row["MCode"] = obj.MCODE;
            row["Mname"] = obj.MNAME;
            row["MDesc"] = obj.MDESC;
            row["Status"] = ChgMSDStatus(obj.Status);
            row["FloorLife"] = obj.Floorlife.ToString();
            row["OverFloorlife"] = obj.OverFloorlife.ToString();
            row["MaintainUser"] = obj.GetDisplayText("MaintainUser");
            row["MaintainDate"] = FormatHelper.ToDateString((obj).MaintainDate);
            row["MaintainTime"] = FormatHelper.ToTimeString((obj).MaintainTime);

            (e as DomainObjectToGridRowEventArgsNew).GridRow = row;
            //    new UltraGridRow(new object[]{
            //                                        obj.LotNo,
            //                                        obj.MCODE,
            //                                        obj.MNAME,
            //                                        obj.MDESC,												    
            //                                        ChgMSDStatus(obj.Status),
            //                                        obj.Floorlife.ToString(), 
            //                                        obj.OverFloorlife.ToString(), 
            //                                        obj.GetDisplayText("MaintainUser"),
            //                                         FormatHelper.ToDateString((obj).MaintainDate),
            //                                         FormatHelper.ToTimeString((obj).MaintainTime)
            //                                  }
            //    );
        }

        private void _helper_DomainObjectToExportRow(object sender, EventArgs e)
        {
            MSDLOTLExc obj = (e as DomainObjectToExportRowEventArgsNew).DomainObject as MSDLOTLExc;
            (e as DomainObjectToExportRowEventArgsNew).ExportRow =
                new string[]{
                                                    obj.LotNo,
                                                    obj.MCODE,
                                                    obj.MNAME,
                                                    obj.MDESC,												    
                                                    ChgMSDStatus(obj.Status),
                                                    obj.Floorlife.ToString(), 
                                                    obj.OverFloorlife.ToString(), 
                                                    obj.GetDisplayText("MaintainUser"),
                                                     FormatHelper.ToDateString((obj).MaintainDate),
                                                     FormatHelper.ToTimeString((obj).MaintainTime)
                            };
        }
                    
 
        private void _helper_GetExportHeadText(object sender, EventArgs e)
        {
            (e as ExportHeadEventArgsNew).Heads =
                new string[]{
	                         "LotNO", 
                             "MCode",
                             "MaterialName", 
                             "MaterialDesc", 
                             "Status", 
                             "FloorLife", 
                             "OverFloorlife", 
                             "MaintainUser",
                             "MaintainDate", 
                             "MaintainTime"
							};

        }


        protected void drpMSDStatusQuery_Load()
        {
            if (!Page.IsPostBack)
            {
                this.drpMSDStatusQuery.Items.Clear();
                this.drpMSDStatusQuery.Items.Add(new ListItem("", ""));
                this.drpMSDStatusQuery.Items.Add(new ListItem(languageComponent1.GetString(MSDStatus.MSDStatus_MSD_PACKAGE), MSDStatus.MSDStatus_MSD_PACKAGE));
                this.drpMSDStatusQuery.Items.Add(new ListItem(languageComponent1.GetString(MSDStatus.MSDStatus_MSD_OPENED), MSDStatus.MSDStatus_MSD_OPENED));
                //this.drpMSDStatusQuery.Items.Add(new ListItem(languageComponent1.GetString(MSDStatus.MSDStatus_MSD_USING), MSDStatus.MSDStatus_MSD_USING));
                this.drpMSDStatusQuery.Items.Add(new ListItem(languageComponent1.GetString(MSDStatus.MSDStatus_MSD_DRYING), MSDStatus.MSDStatus_MSD_DRYING));
                this.drpMSDStatusQuery.Items.Add(new ListItem(languageComponent1.GetString(MSDStatus.MSDStatus_MSD_BAKING), MSDStatus.MSDStatus_MSD_BAKING));
                this.drpMSDStatusQuery.Items.Add(new ListItem(languageComponent1.GetString(MSDStatus.MSDStatus_MSD_OVERTIME), MSDStatus.MSDStatus_MSD_OVERTIME));
                this.drpMSDStatusQuery.Items.Add(new ListItem(languageComponent1.GetString(MSDStatus.MSDStatus_MSD_ALLUSED), MSDStatus.MSDStatus_MSD_ALLUSED));
            }
        }

        private string ChgMSDStatus(string status)
        {
            if (status == "MSD_PACKAGE")
            {
                return "封装";
            }
            else if (status == "MSD_OPENED")
            {
                return "拆封";
            }
            //else if (status == "MSD_USING")
            //{
            //    return "使用";
            //}
            else if (status == "MSD_ALLUSED")
            {
                return "全部使用";
            }
            else if (status == "MSD_DRYING")
            {
                return "干燥箱干燥";
            }
            else if (status == "MSD_BAKING")
            {
                return "烘烤箱烘烤";
            }
            else
            {
                return "超时";
            }
        }
    }
}
