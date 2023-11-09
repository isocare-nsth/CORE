using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CoreSavingLibrary;
using DataLibrary;

namespace Saving.Applications.assist.ws_wheet_as_request_collect_ctrl
{
    public partial class ws_wheet_as_request_collect : PageWebSheet, WebSheet
    {
        [JsPostBack]
        public string PostRetrivememno { get; set; }  

        public void InitJsPostBack()
        {
            dsMain.InitDsMain(this);
            dsDetail.InitDsDetail(this);
            dsSequence.InitDsSequence(this);
        }

        public void WebSheetLoadBegin()
        {
            throw new NotImplementedException();
        }

        public void CheckJsPostBack(string eventArg)
        {
            if (eventArg == PostRetrivememno)
            {
                string ls_memno = WebUtil.MemberNoFormat(dsMain.DATA[0].member_no.Trim());
                dsDetail.ResetRow();
                dsSequence.ResetRow();
                dsMain.RetrieveMain(ls_memno);
                if (dsMain.RowCount > 0)
                {
                    if (dsMain.DATA[0].resign_status == 1)
                    {
                        dsDetail.RetrieveData(ls_memno);
                        dsSequence.RetrieveData(ls_memno);
                        /*
                        dsDetail.DATA[0].sum_sharespm = dsSequence.DATA[0].s_sharespm;
                        dsDetail.DATA[0].sum_sharespx = dsSequence.DATA[0].s_sharespx;
                         */
                        CalSequence();
                    }
                    else { LtServerMessage.Text = WebUtil.ErrorMessage("ใบคำขอสวัสดิการเงินสะสม ทำรายการได้กับสมาชิกที่ลาออกเท่านั้น"); }
                }
                else { LtServerMessage.Text = WebUtil.ErrorMessage("ไม่มีข้อมูลสมาชิกดังกล่าว"); }
            }
        }
        public void CalSequence()
        {
            int ln_monthcollect = 0;
            //int ln_lastperiod = 0;
            decimal ld_calamount = 0, ld_sharespm = 0, ld_amount=0 ;
            decimal ld_sequenceone = 0, ld_sequencetwo = 0, ld_sequencethree = 0, ld_sequencefour = 0, ld_sequencefive = 0;

            ln_monthcollect = dsDetail.DATA[0].monthcollect;
            //ln_lastperiod = dsDetail.DATA[0].last_period;
            //ld_sharestkamt = dsDetail.DATA[0].sharestk_amt;
            ld_sharespm = dsDetail.DATA[0].sharestk_amt;
            //คำนวนยอดคิดเปอร์เซนต์
            ld_calamount = ld_sharespm * 60 / ln_monthcollect;

            if (ln_monthcollect >= 24)
            {
                ld_sequenceone = ld_calamount * 5 / 100;
            }
            if (ln_monthcollect >= 61)
            {
                ld_sequencetwo = ld_calamount * 10 / 100;
            }
            if (ln_monthcollect >= 121)
            {
                ld_sequencethree = ld_calamount * 15 / 100;
            }
            if (ln_monthcollect >= 181)
            {
                ld_sequencefour = ld_calamount * 20 / 100;
            }
            if (ln_monthcollect >= 241)
            {
                ld_sequencefive = ld_calamount * 25 / 100;
            }
            ld_amount = ld_sequenceone + ld_sequencetwo + ld_sequencethree + ld_sequencefour + ld_sequencefive;
            dsSequence.DATA[0].sequence_one = ld_sequenceone;
            dsSequence.DATA[0].sequence_two = ld_sequencetwo;
            dsSequence.DATA[0].sequence_three = ld_sequencethree;
            dsSequence.DATA[0].sequence_four = ld_sequencefour;
            dsSequence.DATA[0].sequence_five = ld_sequencefive;
            dsSequence.DATA[0].assist_collect = ld_amount;
            /*
            decimal cal_amount = dsSequence.DATA[0].principal_balance - dsSequence.DATA[0].assist_collect;
            cal_amount = Math.Abs(cal_amount);
            dsSequence.DATA[0].prnc_amt = cal_amount;
             */
            decimal cal_amount = ld_amount;
            dsSequence.DATA[0].prnc_amt = cal_amount;

        }
        public void SaveWebSheet()
        {
            int process_year = 0;
            DateTime req_date = dsDetail.DATA[0].req_date;
            string sql = @"select max(ass_year) as ass_year from assucfyear where 
                    start_year < {0}
                    and end_year > {0} ";
            sql = WebUtil.SQLFormat(sql, req_date);
            Sdt dt = WebUtil.QuerySdt(sql);
            if (dt.Next()) { 
                process_year = dt.GetInt32("ass_year") + 543;
            }
            string ls_memno = dsMain.DATA[0].member_no;
            decimal ld_prnc_amt = dsSequence.DATA[0].prnc_amt;
            ld_prnc_amt = Math.Round(ld_prnc_amt, 2);
            try
            {
                if (dsDetail.DATA[0].assist_docno=="Auto")
                {
                    string ls_assno = wcf.NCommon.of_getnewdocno(state.SsWsPass, state.SsCoopId, "ASSISTDOCNO");               
                    string sqlStr = @"insert into assreqmaster
                            (coop_id                    , coop_control              , assist_docno          , assist_year           , member_no 
                            , assisttype_code           , assistpay_code            , approve_amt           , assist_amt            , req_status
                            , req_date                  , approve_date              , entry_id              , moneytype_code        ,  withdrawable_amt)
                            values
                            ({0}                        , {1}                       , {2}                   , {3}                   , {4}
                            , {5}                       , {6}                       , {7}                   , {8}                   , {9}
                            , {10}                      , {11}                      , {12}                  , {13}                  , {14})";
                    sqlStr = WebUtil.SQLFormat(sqlStr,
                        state.SsCoopId, state.SsCoopControl, ls_assno, process_year, ls_memno
                        , "70", "12" , ld_prnc_amt, ld_prnc_amt, "8"
                        , req_date , req_date, state.SsUsername, "CSH", ld_prnc_amt);
                    WebUtil.ExeSQL(sqlStr);

                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกใบคำขอ " + ls_assno + " สำเร็จ");
                }else{
                    string sqlStr_update = "UPDATE assreqmaster SET" +
                        " approve_amt 		    = " + ld_prnc_amt + "	, assist_amt 		    = " + ld_prnc_amt + "		    , withdrawable_amt 	        = " + ld_prnc_amt + "	"+
                        " where ASSIST_DOCNO = '" + dsDetail.DATA[0].assist_docno.Trim() + "' and coop_id = '" + state.SsCoopId + "'";
                    Sdt sql_update = WebUtil.QuerySdt(sqlStr_update);
                    LtServerMessage.Text = WebUtil.CompleteMessage("บันทึกใบคำขอ " + dsDetail.DATA[0].assist_docno.Trim() + " สำเร็จ");
                }
                dsMain.ResetRow();
                dsDetail.ResetRow();
                dsSequence.ResetRow();
            }
            catch
            {
                LtServerMessage.Text = WebUtil.ErrorMessage("บันทึกผิดพลาด เลขสมาชิก " + ls_memno); return;
            }
           
        }

        public void WebSheetLoadEnd()
        {
            throw new NotImplementedException();
        }
    }
}