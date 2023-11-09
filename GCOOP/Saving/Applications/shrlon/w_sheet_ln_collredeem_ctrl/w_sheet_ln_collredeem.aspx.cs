using System;
using CoreSavingLibrary;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataLibrary;

namespace Saving.Applications.shrlon.w_sheet_ln_collredeem_ctrl
{
    public partial class w_sheet_ln_collredeem : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostCollmastNo { get; set; }

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            //this.showExternalLogin = true;
        }

        public void WebSheetLoadBegin()
        {
            if (!IsPostBack)
            {
                dsMain.DATA[0].REDEEM_DATE = state.SsWorkDate;
                //date aa = state.SsWorkDate;
            }
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostCollmastNo)
            {
                //Sta ta = new Sta(state.SsConnectionString);
                try
                {
                    //ta.AddInParameter("AVC_COOPID", state.SsCoopControl);
                    //ta.AddInParameter("AVC_MASTNO", dsMain.DATA[0].COLLMAST_NO);
                    //ta.AddInParameter("ADTM_DEEM", dsMain.DATA[0].REDEEM_DATE, System.Data.OracleClient.OracleType.DateTime);
                    //ta.AddReturnParameter("return_value", System.Data.OracleClient.OracleType.Clob);

                    //ta.ExePlSql("W_SHEET_LN_COLLREDEEM.OF_INIT_REQCOLLMASTREDEEM");

                    //var xmlMain = ta.OutParameter("return_value");

                    //dsMain.ResetRow();
                    //dsMain.ImportData(xmlMain);
                    string collmastno = dsMain.DATA[0].COLLMAST_NO;
                    dsMain.RetrieveMain(collmastno);
                    dsMain.DATA[0].REDEEM_DATE = state.SsWorkDate;

                }
                catch (Exception ex)
                {
                    dsMain.ResetRow();
                    LtServerMessage.Text = WebUtil.ErrorMessage(ex);
                }
                //ta.Close();
            }
        }

        public void SaveWebSheet()
        {
            ExecuteDataSource exed = new ExecuteDataSource(this);
            string coop_id = state.SsCoopId;
            DateTime redeem_date = state.SsWorkDate;
            string member_no = dsMain.DATA[0].MEMBER_NO;
            string collmast_no = dsMain.DATA[0].COLLMAST_NO;
            //string redeemcause_code = dsMain.DATA[0].REDEEM_CAUSE;
            string remark = dsMain.DATA[0].REDEEM_CAUSE;
            string redeem_status = "1";
            decimal mortgage_price = dsMain.DATA[0].MORTGAGE_PRICE;
            string entry_id = state.SsUsername;
            DateTime entry_date = state.SsWorkDate;
            string entry_coop = state.SsCoopId;
            //Sta ta = new Sta(state.SsConnectionString);
            try
            {
                //string redeemNo = "";
                //ta.AddInParameter("ACLOB_XML", dsMain.ExportXml(), System.Data.OracleClient.OracleType.Clob);
                //string xml = dsMain.ExportXml();
                //ta.AddInParameter("AVC_ENTRYID", state.SsUsername, System.Data.OracleClient.OracleType.VarChar);
                //ta.AddInParameter("AVC_ENTRYCOOPID", state.SsCoopId, System.Data.OracleClient.OracleType.VarChar);
                //ta.AddOutParameter("AVC_REDEEMNO", System.Data.OracleClient.OracleType.VarChar);
                //ta.AddInParameter("AVC_COOPCONTROL", state.SsCoopControl, System.Data.OracleClient.OracleType.VarChar);

                //ta.ExePlSql("W_SHEET_LN_COLLREDEEM.OF_SAVE_LCCOLLMASTREDEEM");

                //redeemNo = ta.OutParameter("AVC_REDEEMNO").ToString();
                string redeem_docno = wcf.NCommon.of_getnewdocno(state.SsWsPass,state.SsCoopId, "LNCOLLMASTREDEEMNO"); 
                //การINSERTตาราง LNREQCOLLMASTREDEEM
                string sqlInsert = @"INSERT INTO LNREQCOLLMASTREDEEM 
                                (COOP_ID,           REDEEM_DOCNO,           REDEEM_DATE,        MEMBER_NO,      COLLMAST_NO, 
                                REDEEM_STATUS,      ENTRY_ID,               ENTRY_DATE,         ENTRY_BYCOOPID, REDEEM_CAUSE)
                                VALUES ({0},{1},{2},{3},{4},
                                        {5},{6},{7},{8},{9})";
                object[] argslistInsert = new object[] {
                                coop_id,            redeem_docno,           redeem_date,        member_no,      collmast_no,
                                redeem_status,      entry_id,               entry_date,         entry_coop,     remark};
                sqlInsert = WebUtil.SQLFormat(sqlInsert, argslistInsert);
                exed.SQL.Add(sqlInsert);

                string sql_update = @"update lncollmaster 
                                    set redeem_date = {3},  
                                    redeem_flag = {4},
                                    mortgage_price = {5}                                           
                                    where coop_id = {0}
                                    and member_no = {1}
                                    and collmast_no = {2}";
                object[] argslistUpdate = new object[] { 
                                coop_id,
                                member_no,
                                collmast_no,
                                redeem_date,
                                redeem_status,
                                mortgage_price};
                sql_update = WebUtil.SQLFormat(sql_update, argslistUpdate);
                exed.SQL.Add(sql_update);

                int results = exed.Execute();
                if (results >= 1)
                {
                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกสำเร็จ");
                }
                // 
            dsMain.ResetRow();
            }
            catch (Exception ex)
            {
                LtServerMessage.Text = WebUtil.ErrorMessage(ex);
            }
            //ta.Close();
        }

        public void WebSheetLoadEnd()
        {
        }
    }
}