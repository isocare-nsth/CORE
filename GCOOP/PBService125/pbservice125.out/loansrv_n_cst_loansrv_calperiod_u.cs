//**************************************************************************
//
//                        Sybase Inc. 
//
//    THIS IS A TEMPORARY FILE GENERATED BY POWERBUILDER. IF YOU MODIFY 
//    THIS FILE, YOU DO SO AT YOUR OWN RISK. SYBASE DOES NOT PROVIDE 
//    SUPPORT FOR .NET ASSEMBLIES BUILT WITH USER-MODIFIED CS FILES. 
//
//**************************************************************************

#line 1 "c:\\gcoop_all\\core\\gcoop\\pbservice125\\pbsrvbiz\\loansrv.pbl\\loansrv.pblx\\n_cst_loansrv_calperiod.sru"
#line hidden
#line 1 "n_cst_loansrv_calperiod"
#line hidden
[Sybase.PowerBuilder.PBGroupAttribute("n_cst_loansrv_calperiod",Sybase.PowerBuilder.PBGroupType.UserObject,"","c:\\gcoop_all\\core\\gcoop\\pbservice125\\pbsrvbiz\\loansrv.pbl\\loansrv.pblx",null,"pbservice125")]
internal class c__n_cst_loansrv_calperiod : Sybase.PowerBuilder.PBNonVisualObject
{
	#line hidden
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "is_coopcontrol", null, "n_cst_loansrv_calperiod", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public Sybase.PowerBuilder.PBString is_coopcontrol = Sybase.PowerBuilder.PBString.DefaultValue;
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "ii_estinttype", null, "n_cst_loansrv_calperiod", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public Sybase.PowerBuilder.PBInt ii_estinttype = Sybase.PowerBuilder.PBInt.DefaultValue;
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "il_roundpayfactor", null, "n_cst_loansrv_calperiod", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public Sybase.PowerBuilder.PBLong il_roundpayfactor = Sybase.PowerBuilder.PBLong.DefaultValue;
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "itr_sqlca", null, "n_cst_loansrv_calperiod", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public Sybase.PowerBuilder.PBTransaction itr_sqlca = null;
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "ithw_exception", null, "n_cst_loansrv_calperiod", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public Sybase.PowerBuilder.PBException ithw_exception = null;
	[Sybase.PowerBuilder.PBVariableAttribute(Sybase.PowerBuilder.VariableTypeKind.kInstanceVar, "inv_transection", null, "n_cst_loansrv_calperiod", null, null, Sybase.PowerBuilder.PBModifier.Public, "")]
	public c__n_cst_dbconnectservice inv_transection = null;

	#line 1 "n_cst_loansrv_calperiod.of_initservice(ICn_cst_dbconnectservice.)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_initservice", new string[]{"n_cst_dbconnectservice"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_initservice(c__n_cst_dbconnectservice anv_dbtrans)
	{
		#line hidden
		#line 2
		if ((Sybase.PowerBuilder.PBBoolean)(Sybase.PowerBuilder.WPF.PBSystemFunctions.IsNull((Sybase.PowerBuilder.PBAny)((new Sybase.PowerBuilder.PBAny(((c__n_cst_dbconnectservice)(Sybase.PowerBuilder.PBSystemFunctions.PBCheckNull(inv_transection)))))))| !(Sybase.PowerBuilder.WPF.PBSystemFunctions.IsValid((Sybase.PowerBuilder.PBPowerObject)(inv_transection)))))
		#line hidden
		{
			#line 3
			inv_transection = (c__n_cst_dbconnectservice)this.CreateInstance(typeof(c__n_cst_dbconnectservice), 0);
			#line hidden
			#line 4
			inv_transection = anv_dbtrans;
			#line hidden
		}
		#line 7
		itr_sqlca = inv_transection.itr_dbconnection;
		#line hidden
		#line 8
		is_coopcontrol = inv_transection.is_coopcontrol;
		#line hidden
		#line 10
		this.of_loadconfigdefault();
		#line hidden
		#line 12
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_loadconfigdefault(I)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_loadconfigdefault", new string[]{}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_loadconfigdefault()
	{
		#line hidden

		Sybase.PowerBuilder.IPBValue[] __PB_TEMP_DB__OutputVars0 = new Sybase.PowerBuilder.IPBValue[1];
		__PB_TEMP_DB__OutputVars0[0] = ii_estinttype;
		Sybase.PowerBuilder.DSI.PBSQL.DSISQLFunc.Select(Sybase.PowerBuilder.WPF.PBSession.CurrentSession,
			new Sybase.PowerBuilder.DB.DBStatement(
				new Sybase.PowerBuilder.DB.DBStatement(
					new System.String[2] {
						"select fixpaycal_type     from lnloanconstant    where (coop_id = ",
						")   "
					},
					new Sybase.PowerBuilder.IPBValue[1] {
						is_coopcontrol
					}
				),
				new Sybase.PowerBuilder.DB.DBOutputVarInfo[1] {
					new Sybase.PowerBuilder.DB.DBOutputVarInfo(false)
				}
			),
			new Sybase.PowerBuilder.IPBValue[1] {
				is_coopcontrol
			},
			__PB_TEMP_DB__OutputVars0,
			new Sybase.PowerBuilder.PBDataType[1] {
				Sybase.PowerBuilder.PBDataType.Int
			},
			itr_sqlca
		);

		#line 1
		ii_estinttype = (Sybase.PowerBuilder.PBInt) __PB_TEMP_DB__OutputVars0[0];
		#line hidden
		#line 7
		if (Sybase.PowerBuilder.WPF.PBSystemFunctions.IsNull((Sybase.PowerBuilder.PBAny)(((Sybase.PowerBuilder.PBAny)(ii_estinttype)))))
		#line hidden
		{
			#line 8
			ii_estinttype = new Sybase.PowerBuilder.PBInt(1);
			#line hidden
		}
		#line 11
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_getmaxperiodpay(ISSM)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_getmaxperiodpay", new string[]{"string", "string", "decimal"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_getmaxperiodpay(Sybase.PowerBuilder.PBString as_coopid, Sybase.PowerBuilder.PBString as_loantype, Sybase.PowerBuilder.PBDecimal adc_prnamt)
	{
		#line hidden
		Sybase.PowerBuilder.PBInt li_maxperiod = Sybase.PowerBuilder.PBInt.DefaultValue;

		Sybase.PowerBuilder.IPBValue[] __PB_TEMP_DB__OutputVars0 = new Sybase.PowerBuilder.IPBValue[1];
		__PB_TEMP_DB__OutputVars0[0] = li_maxperiod;
		Sybase.PowerBuilder.DSI.PBSQL.DSISQLFunc.Select(Sybase.PowerBuilder.WPF.PBSession.CurrentSession,
			new Sybase.PowerBuilder.DB.DBStatement(
				new Sybase.PowerBuilder.DB.DBStatement(
					new System.String[4] {
						"select max_period     from lnloantypeperiod    where (coop_id = ",
						")and    (loantype_code = ",
						")and    (",
						" between money_from and money_to)   "
					},
					new Sybase.PowerBuilder.IPBValue[3] {
						as_coopid,
						as_loantype,
						adc_prnamt
					}
				),
				new Sybase.PowerBuilder.DB.DBOutputVarInfo[1] {
					new Sybase.PowerBuilder.DB.DBOutputVarInfo(false)
				}
			),
			new Sybase.PowerBuilder.IPBValue[3] {
				as_coopid,
				as_loantype,
				adc_prnamt
			},
			__PB_TEMP_DB__OutputVars0,
			new Sybase.PowerBuilder.PBDataType[1] {
				Sybase.PowerBuilder.PBDataType.Int
			},
			itr_sqlca
		);

		#line 3
		li_maxperiod = (Sybase.PowerBuilder.PBInt) __PB_TEMP_DB__OutputVars0[0];
		#line hidden
		#line 11
		if ((Sybase.PowerBuilder.PBBoolean)(itr_sqlca.SQLCode != (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0))))
		#line hidden
		{
			#line 12
			ithw_exception.Text = (((new Sybase.PowerBuilder.PBString("ไม่พบงวดการชำระเงินของเงินกู้ประเภท ")+ as_loantype)+ new Sybase.PowerBuilder.PBString(" ยอดเงิน "))+ Sybase.PowerBuilder.WPF.PBSystemFunctions.String((Sybase.PowerBuilder.PBAny)(((Sybase.PowerBuilder.PBAny)(adc_prnamt)))))+ new Sybase.PowerBuilder.PBString(" กรุณาตรวจสอบ");
			#line hidden
			#line 13
			throw new Sybase.PowerBuilder.PBExceptionE(ithw_exception);
			#line hidden
		}
		#line 16
		return li_maxperiod;
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_initinstallment(IRCstr_lncalperiod.)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_initinstallment", new string[]{"ref str_lncalperiod"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_initinstallment_1_2047806875<T0>(ref T0 astr_lncalperiod) where T0 : c__str_lncalperiod
	{
		#line hidden
		Sybase.PowerBuilder.PBInt li_paytype = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBInt li_maxperiod = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBInt li_installment = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBDecimal ldc_prncalamt = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_periodpay = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_periodlast = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_intrate = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_interest = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_prnpay = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_fr = (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m));
		#line 6
		li_paytype = astr_lncalperiod.loanpayment_type;
		#line hidden
		#line 8
		li_maxperiod = astr_lncalperiod.calperiod_maxinstallment;
		#line hidden
		#line 9
		ldc_prncalamt.AssignFrom(astr_lncalperiod.calperiod_prnamt);
		#line hidden
		#line 10
		ldc_intrate.AssignFrom(astr_lncalperiod.calperiod_intrate);
		#line hidden
		#line 12
		if ((Sybase.PowerBuilder.PBBoolean)(Sybase.PowerBuilder.WPF.PBSystemFunctions.IsNull((Sybase.PowerBuilder.PBAny)(((Sybase.PowerBuilder.PBAny)(li_maxperiod))))| (li_maxperiod == new Sybase.PowerBuilder.PBInt(0))))
		#line hidden
		{
			#line 13
			ithw_exception.Text = new Sybase.PowerBuilder.PBString("ไม่มีจำนวนงวดที่ต้องส่ง กรุณาตรวจสอบ");
			#line hidden
			#line 14
			throw new Sybase.PowerBuilder.PBExceptionE(ithw_exception);
			#line hidden
		}
		#line 17
		Sybase.PowerBuilder.PBInt __PB_TEMP______switchTmpVar0 = li_paytype;
		#line hidden
		#line 18
		if (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBInt(0) )
		#line hidden
		{
			#line 19
			li_installment = li_maxperiod;
			#line hidden
			#line 20
			ldc_periodpay.AssignFrom((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m)));
			#line hidden
			#line 21
			ldc_periodlast.AssignFrom(ldc_prncalamt);
			#line hidden
		}
		#line 23
		else if (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBInt(1) )
		#line hidden
		{
			#line 24
			ldc_periodpay.AssignFrom(ldc_prncalamt/ (Sybase.PowerBuilder.PBDecimal)(li_maxperiod));
			#line hidden
			#line 25
			ldc_periodpay.AssignFrom(this.of_roundpayment((ldc_periodpay).ToPBDecimal(-1)));
			#line hidden
			#line 28
			li_installment = (Sybase.PowerBuilder.PBInt)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Ceiling((Sybase.PowerBuilder.PBDouble)(ldc_prncalamt/ ldc_periodpay)));
			#line hidden
			#line 29
			ldc_periodlast.AssignFrom(ldc_prncalamt- (ldc_periodpay* (Sybase.PowerBuilder.PBDecimal)(((Sybase.PowerBuilder.PBDecimal)(li_installment)- (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(1m))))));
			#line hidden
		}
		#line 31
		else if (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBInt(2) )
		#line hidden
		{
			#line 33
			ldc_intrate.AssignFrom(ldc_intrate/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(100m)));
			#line hidden
			#line 36
			if ((Sybase.PowerBuilder.PBBoolean)(ii_estinttype == new Sybase.PowerBuilder.PBInt(1)))
			#line hidden
			{
				#line 37
				ldc_fr.AssignFrom((Sybase.PowerBuilder.PBDecimal)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Exp((Sybase.PowerBuilder.PBDouble)((-(li_maxperiod)))* Sybase.PowerBuilder.WPF.PBSystemFunctions.Log((Sybase.PowerBuilder.PBDouble)((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(1m))+ (ldc_intrate/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(12m))))))));
				#line hidden
				#line 38
				ldc_periodpay.AssignFrom((ldc_prncalamt* (ldc_intrate/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(12m))))/ ((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(1m))- ldc_fr));
				#line hidden
			}
			else
			{
				#line 40
				ldc_fr.AssignFrom((Sybase.PowerBuilder.PBDecimal)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Exp((Sybase.PowerBuilder.PBDouble)((-(li_maxperiod)))* Sybase.PowerBuilder.WPF.PBSystemFunctions.Log((Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(1))+ ((Sybase.PowerBuilder.PBDouble)(ldc_intrate)* ((Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(30))/ (Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(365))))))));
				#line hidden
				#line 41
				ldc_periodpay.AssignFrom((Sybase.PowerBuilder.PBDecimal)(((Sybase.PowerBuilder.PBDouble)(ldc_prncalamt)* ((Sybase.PowerBuilder.PBDouble)(ldc_intrate)* ((Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(30))/ (Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(365)))))/ (Sybase.PowerBuilder.PBDouble)(((Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(1))- (Sybase.PowerBuilder.PBDouble)(ldc_fr)))));
				#line hidden
			}
			#line 44
			ldc_periodpay.AssignFrom(this.of_roundpayment((ldc_periodpay).ToPBDecimal(-1)));
			#line hidden
			#line 47
			this.of_calfixpayinstallment((ldc_prncalamt).ToPBDecimal(-1), (ldc_periodpay).ToPBDecimal(-1), (ldc_intrate).ToPBDecimal(-1), li_maxperiod, ref li_installment, ref ldc_periodlast);
			#line hidden
		}
		#line 49
		else if (__PB_TEMP______switchTmpVar0 == new Sybase.PowerBuilder.PBInt(3) )
		#line hidden
		{
			#line 51
			li_installment = li_maxperiod;
			#line hidden
			#line 52
			ldc_periodpay.AssignFrom((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m)));
			#line hidden
			#line 53
			ldc_periodlast.AssignFrom(ldc_prncalamt);
			#line hidden
		}

		#line 56
		astr_lncalperiod.period_installment = li_installment;
		#line hidden
		#line 57
		astr_lncalperiod.period_payment.AssignFrom(ldc_periodpay);
		#line hidden
		#line 58
		astr_lncalperiod.period_lastpayment.AssignFrom(ldc_periodlast);
		#line hidden
		#line 60
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_calperiodpay(IRCstr_lncalperiod.)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_calperiodpay", new string[]{"ref str_lncalperiod"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_calperiodpay_1_2047806875<T0>(ref T0 astr_lncalperiod) where T0 : c__str_lncalperiod
	{
		#line hidden
		Sybase.PowerBuilder.PBString ls_loantype = Sybase.PowerBuilder.PBString.DefaultValue;
		Sybase.PowerBuilder.PBInt li_paytype = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBInt li_installment = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBInt li_insttemp = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBDecimal ldc_prncalamt = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_intrate = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_periodpay = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_periodlast = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_fr = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_fixperc = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_fixamtl = new Sybase.PowerBuilder.PBDecimal(0m);
		#line 10
		li_paytype = astr_lncalperiod.loanpayment_type;
		#line hidden
		#line 12
		ldc_prncalamt.AssignFrom(astr_lncalperiod.calperiod_prnamt);
		#line hidden
		#line 13
		ldc_intrate.AssignFrom(astr_lncalperiod.calperiod_intrate);
		#line hidden
		#line 14
		li_installment = astr_lncalperiod.period_installment;
		#line hidden
		#line 16
		if ((Sybase.PowerBuilder.PBBoolean)(ldc_prncalamt == (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m))))
		#line hidden
		{
			#line 17
			return new Sybase.PowerBuilder.PBInt(0);
			#line hidden
		}
		#line 20
		Sybase.PowerBuilder.PBInt __PB_TEMP______switchTmpVar1 = li_paytype;
		#line hidden
		#line 21
		if (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBInt(0) )
		#line hidden
		{
			#line 22
			li_installment = li_installment;
			#line hidden
			#line 23
			ldc_periodpay.AssignFrom((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m)));
			#line hidden
			#line 24
			ldc_periodlast.AssignFrom(ldc_prncalamt);
			#line hidden
		}
		#line 26
		else if (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBInt(1) )
		#line hidden
		{
			#line 27
			ldc_periodpay.AssignFrom(ldc_prncalamt/ (Sybase.PowerBuilder.PBDecimal)(li_installment));
			#line hidden
			#line 28
			ldc_periodpay.AssignFrom(this.of_roundpayment((ldc_periodpay).ToPBDecimal(-1)));
			#line hidden
			#line 31
			li_installment = (Sybase.PowerBuilder.PBInt)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Ceiling((Sybase.PowerBuilder.PBDouble)(ldc_prncalamt/ ldc_periodpay)));
			#line hidden
			#line 34
			ldc_periodlast.AssignFrom(ldc_prncalamt- (ldc_periodpay* (Sybase.PowerBuilder.PBDecimal)(((Sybase.PowerBuilder.PBDecimal)(li_installment)- (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(1m))))));
			#line hidden
		}
		#line 36
		else if (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBInt(2) )
		#line hidden
		{
			#line 38
			ldc_intrate.AssignFrom(ldc_intrate/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(100m)));
			#line hidden
			#line 41
			if ((Sybase.PowerBuilder.PBBoolean)(ii_estinttype == new Sybase.PowerBuilder.PBInt(1)))
			#line hidden
			{
				#line 42
				ldc_fr.AssignFrom((Sybase.PowerBuilder.PBDecimal)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Exp((Sybase.PowerBuilder.PBDouble)((-(li_installment)))* Sybase.PowerBuilder.WPF.PBSystemFunctions.Log((Sybase.PowerBuilder.PBDouble)((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(1m))+ (ldc_intrate/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(12m))))))));
				#line hidden
				#line 43
				ldc_periodpay.AssignFrom((ldc_prncalamt* (ldc_intrate/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(12m))))/ ((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(1m))- ldc_fr));
				#line hidden
			}
			else
			{
				#line 45
				ldc_fr.AssignFrom((Sybase.PowerBuilder.PBDecimal)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Exp((Sybase.PowerBuilder.PBDouble)((-(li_installment)))* Sybase.PowerBuilder.WPF.PBSystemFunctions.Log((Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(1))+ ((Sybase.PowerBuilder.PBDouble)(ldc_intrate)* ((Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(30))/ (Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(365))))))));
				#line hidden
				#line 46
				ldc_periodpay.AssignFrom((Sybase.PowerBuilder.PBDecimal)(((Sybase.PowerBuilder.PBDouble)(ldc_prncalamt)* ((Sybase.PowerBuilder.PBDouble)(ldc_intrate)* ((Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(30))/ (Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(365)))))/ (Sybase.PowerBuilder.PBDouble)(((Sybase.PowerBuilder.PBDouble)(new Sybase.PowerBuilder.PBInt(1))- (Sybase.PowerBuilder.PBDouble)(ldc_fr)))));
				#line hidden
			}
			#line 49
			ldc_periodpay.AssignFrom(this.of_roundpayment((ldc_periodpay).ToPBDecimal(-1)));
			#line hidden
			#line 52
			this.of_calfixpayinstallment((ldc_prncalamt).ToPBDecimal(-1), (ldc_periodpay).ToPBDecimal(-1), (ldc_intrate).ToPBDecimal(-1), li_installment, ref li_installment, ref ldc_periodlast);
			#line hidden
		}
		#line 54
		else if (__PB_TEMP______switchTmpVar1 == new Sybase.PowerBuilder.PBInt(3) )
		#line hidden
		{
			#line 55
			li_installment = li_installment;
			#line hidden
			#line 56
			ldc_periodpay.AssignFrom((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m)));
			#line hidden
			#line 57
			ldc_periodlast.AssignFrom(ldc_prncalamt);
			#line hidden
		}

		#line 60
		astr_lncalperiod.period_installment = li_installment;
		#line hidden
		#line 61
		astr_lncalperiod.period_payment.AssignFrom(ldc_periodpay);
		#line hidden
		#line 62
		astr_lncalperiod.period_lastpayment.AssignFrom(ldc_periodlast);
		#line hidden
		#line 64
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_calfixpayinstallment(IMMMIRIRM)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_calfixpayinstallment", new string[]{"decimal", "decimal", "decimal", "integer", "ref integer", "ref decimal"}, Sybase.PowerBuilder.PBModifier.Private, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	private Sybase.PowerBuilder.PBInt of_calfixpayinstallment(Sybase.PowerBuilder.PBDecimal adc_prncalamt, Sybase.PowerBuilder.PBDecimal adc_periodpay, Sybase.PowerBuilder.PBDecimal adc_intrate, Sybase.PowerBuilder.PBInt ai_maxinstallment, ref Sybase.PowerBuilder.PBInt ai_installment, ref Sybase.PowerBuilder.PBDecimal adc_lastperiodpay)
	{
		#line hidden
		Sybase.PowerBuilder.PBDecimal ldc_interest = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_prnpay = new Sybase.PowerBuilder.PBDecimal(0m);
		#line 3
		if ((Sybase.PowerBuilder.PBBoolean)((ai_maxinstallment == new Sybase.PowerBuilder.PBInt(0))| Sybase.PowerBuilder.WPF.PBSystemFunctions.IsNull((Sybase.PowerBuilder.PBAny)(((Sybase.PowerBuilder.PBAny)(ai_maxinstallment))))))
		#line hidden
		{
			#line 4
			ai_maxinstallment = new Sybase.PowerBuilder.PBInt(999);
			#line hidden
		}
		#line 7
		ai_installment = new Sybase.PowerBuilder.PBInt(0);
		#line hidden
		#line 8
		adc_lastperiodpay.AssignFrom((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m)));
		#line hidden
		#line 9
		ii_estinttype = new Sybase.PowerBuilder.PBInt(1);
		#line hidden
		#line 11
		while ( adc_prncalamt> (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m)) )
		#line hidden
		{
				#line 13
				if ((Sybase.PowerBuilder.PBBoolean)(ii_estinttype == new Sybase.PowerBuilder.PBInt(1)))
				#line hidden
				{
					#line 14
					ldc_interest.AssignFrom((adc_prncalamt/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(12m)))* adc_intrate);
					#line hidden
				}
				else
				{
					#line 16
					ldc_interest.AssignFrom(((adc_prncalamt* (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(30m)))/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(365m)))* adc_intrate);
					#line hidden
				}
				#line 19
				ldc_interest.AssignFrom(Sybase.PowerBuilder.WPF.PBSystemFunctions.Round((ldc_interest).ToPBDecimal(-1), new Sybase.PowerBuilder.PBInt(2)));
				#line hidden
				#line 21
				ldc_prnpay.AssignFrom(adc_periodpay- ldc_interest);
				#line hidden
				#line 24
				if ((Sybase.PowerBuilder.PBBoolean)(ldc_prnpay> adc_prncalamt))
				#line hidden
				{
					#line 25
					ldc_prnpay.AssignFrom(adc_prncalamt);
					#line hidden
				}
				#line 28
				ai_installment++;
				#line hidden
				#line 31
				adc_prncalamt.AssignFrom(adc_prncalamt- ldc_prnpay);
				#line hidden
				#line 33
				if ((Sybase.PowerBuilder.PBBoolean)((Sybase.PowerBuilder.PBLong)(ai_installment)>= (Sybase.PowerBuilder.PBLong)(ai_maxinstallment)))
				#line hidden
				{
					#line 35
					adc_lastperiodpay.AssignFrom((ldc_prnpay+ ldc_interest)+ adc_prncalamt);
					#line hidden
					#line 36
					break;
					#line hidden
				}
		}

		#line 40
		if ((Sybase.PowerBuilder.PBBoolean)(adc_lastperiodpay == (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m))))
		#line hidden
		{
			#line 41
			adc_lastperiodpay.AssignFrom(ldc_prnpay+ ldc_interest);
			#line hidden
		}
		#line 44
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_calinstallment(IRCstr_lncalperiod.)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_calinstallment", new string[]{"ref str_lncalperiod"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_calinstallment_1_2047806875<T0>(ref T0 astr_lncalperiod) where T0 : c__str_lncalperiod
	{
		#line hidden
		Sybase.PowerBuilder.PBInt li_paytype = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBInt li_maxperiod = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBInt li_installment = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBDecimal ldc_prncalamt = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_intrate = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_periodpay = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_periodlast = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_fixamt = new Sybase.PowerBuilder.PBDecimal(0m);
		#line 11
		li_paytype = astr_lncalperiod.loanpayment_type;
		#line hidden
		#line 13
		li_maxperiod = astr_lncalperiod.calperiod_maxinstallment;
		#line hidden
		#line 14
		ldc_prncalamt.AssignFrom(astr_lncalperiod.calperiod_prnamt);
		#line hidden
		#line 15
		ldc_intrate.AssignFrom(astr_lncalperiod.calperiod_intrate);
		#line hidden
		#line 16
		ldc_periodpay.AssignFrom(astr_lncalperiod.period_payment);
		#line hidden
		#line 18
		if ((Sybase.PowerBuilder.PBBoolean)(ldc_prncalamt == (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m))))
		#line hidden
		{
			#line 19
			return new Sybase.PowerBuilder.PBInt(0);
			#line hidden
		}
		#line 22
		Sybase.PowerBuilder.PBInt __PB_TEMP______switchTmpVar2 = li_paytype;
		#line hidden
		#line 23
		if (__PB_TEMP______switchTmpVar2 == new Sybase.PowerBuilder.PBInt(0) )
		#line hidden
		{
			#line 24
			li_installment = li_maxperiod;
			#line hidden
			#line 25
			ldc_periodlast.AssignFrom(ldc_prncalamt);
			#line hidden
		}
		#line 27
		else if (__PB_TEMP______switchTmpVar2 == new Sybase.PowerBuilder.PBInt(1) )
		#line hidden
		{
			#line 28
			li_installment = (Sybase.PowerBuilder.PBInt)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Ceiling((Sybase.PowerBuilder.PBDouble)(ldc_prncalamt/ ldc_periodpay)));
			#line hidden
			#line 30
			if ((Sybase.PowerBuilder.PBBoolean)(((Sybase.PowerBuilder.PBLong)(li_installment)> (Sybase.PowerBuilder.PBLong)(li_maxperiod))& ((Sybase.PowerBuilder.PBLong)(li_maxperiod)> (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0)))))
			#line hidden
			{
				#line 31
				li_installment = li_maxperiod;
				#line hidden
			}
			#line 35
			ldc_periodlast.AssignFrom(ldc_prncalamt- (ldc_periodpay* (Sybase.PowerBuilder.PBDecimal)(((Sybase.PowerBuilder.PBDecimal)(li_installment)- (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(1m))))));
			#line hidden
		}
		#line 37
		else if (__PB_TEMP______switchTmpVar2 == new Sybase.PowerBuilder.PBInt(2) )
		#line hidden
		{
			#line 39
			ldc_intrate.AssignFrom(ldc_intrate/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(100m)));
			#line hidden
			#line 42
			this.of_calfixpayinstallment((ldc_prncalamt).ToPBDecimal(-1), (ldc_periodpay).ToPBDecimal(-1), (ldc_intrate).ToPBDecimal(-1), li_maxperiod, ref li_installment, ref ldc_periodlast);
			#line hidden
		}
		#line 44
		else if (__PB_TEMP______switchTmpVar2 == new Sybase.PowerBuilder.PBInt(3) )
		#line hidden
		{
			#line 45
			li_installment = li_maxperiod;
			#line hidden
			#line 46
			ldc_periodlast.AssignFrom(ldc_prncalamt);
			#line hidden
		}

		#line 50
		astr_lncalperiod.period_installment = li_installment;
		#line hidden
		#line 51
		astr_lncalperiod.period_payment.AssignFrom(ldc_periodpay);
		#line hidden
		#line 52
		astr_lncalperiod.period_lastpayment.AssignFrom(ldc_periodlast);
		#line hidden
		#line 54
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_roundpayment(MM)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_roundpayment", new string[]{"decimal"}, Sybase.PowerBuilder.PBModifier.Private, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	private Sybase.PowerBuilder.PBDecimal of_roundpayment(Sybase.PowerBuilder.PBDecimal adc_payment)
	{
		#line hidden
		Sybase.PowerBuilder.PBDecimal ldc_mod = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBLong ll_absfac = Sybase.PowerBuilder.PBLong.DefaultValue;
		#line 5
		if ((Sybase.PowerBuilder.PBBoolean)(il_roundpayfactor == (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0))))
		#line hidden
		{
			#line 6
			return adc_payment;
			#line hidden
		}
		#line 9
		ll_absfac = (Sybase.PowerBuilder.PBLong)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Abs((Sybase.PowerBuilder.PBDouble)(il_roundpayfactor)));
		#line hidden
		#line 12
		if ((Sybase.PowerBuilder.PBBoolean)((Sybase.PowerBuilder.PBDecimal)(ll_absfac)> adc_payment))
		#line hidden
		{
			#line 13
			adc_payment.AssignFrom((Sybase.PowerBuilder.PBDecimal)(ll_absfac));
			#line hidden
			#line 14
			return adc_payment;
			#line hidden
		}
		#line 18
		ldc_mod.AssignFrom((Sybase.PowerBuilder.PBDecimal)(Sybase.PowerBuilder.WPF.PBSystemFunctions.Mod((Sybase.PowerBuilder.PBDouble)(adc_payment), (Sybase.PowerBuilder.PBDouble)(ll_absfac))));
		#line hidden
		#line 21
		if ((Sybase.PowerBuilder.PBBoolean)((ldc_mod == (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m)))& (adc_payment> (Sybase.PowerBuilder.PBDecimal)(il_roundpayfactor))))
		#line hidden
		{
			#line 22
			return adc_payment;
			#line hidden
		}
		#line 26
		adc_payment.AssignFrom(adc_payment- ldc_mod);
		#line hidden
		#line 28
		if ((Sybase.PowerBuilder.PBBoolean)(il_roundpayfactor> (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0))))
		#line hidden
		{
			#line 29
			adc_payment.AssignFrom(adc_payment+ (Sybase.PowerBuilder.PBDecimal)(il_roundpayfactor));
			#line hidden
		}
		#line 32
		return adc_payment;
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_loadpayroundconfig(IS)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_loadpayroundconfig", new string[]{"string"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_loadpayroundconfig(Sybase.PowerBuilder.PBString as_loantype)
	{
		#line hidden
		Sybase.PowerBuilder.PBInt li_roundtype = Sybase.PowerBuilder.PBInt.DefaultValue;
		Sybase.PowerBuilder.PBLong ll_roundfactor = Sybase.PowerBuilder.PBLong.DefaultValue;
		Sybase.PowerBuilder.PBDecimal ldc_mod = new Sybase.PowerBuilder.PBDecimal(0m);

		Sybase.PowerBuilder.IPBValue[] __PB_TEMP_DB__OutputVars0 = new Sybase.PowerBuilder.IPBValue[1];
		__PB_TEMP_DB__OutputVars0[0] = il_roundpayfactor;
		Sybase.PowerBuilder.DSI.PBSQL.DSISQLFunc.Select(Sybase.PowerBuilder.WPF.PBSession.CurrentSession,
			new Sybase.PowerBuilder.DB.DBStatement(
				new Sybase.PowerBuilder.DB.DBStatement(
					new System.String[3] {
						"select payround_factor     from lnloantype    where (coop_id = ",
						")and    (loantype_code = ",
						")   "
					},
					new Sybase.PowerBuilder.IPBValue[2] {
						is_coopcontrol,
						as_loantype
					}
				),
				new Sybase.PowerBuilder.DB.DBOutputVarInfo[1] {
					new Sybase.PowerBuilder.DB.DBOutputVarInfo(false)
				}
			),
			new Sybase.PowerBuilder.IPBValue[2] {
				is_coopcontrol,
				as_loantype
			},
			__PB_TEMP_DB__OutputVars0,
			new Sybase.PowerBuilder.PBDataType[1] {
				Sybase.PowerBuilder.PBDataType.Long
			},
			itr_sqlca
		);

		#line 5
		il_roundpayfactor = (Sybase.PowerBuilder.PBLong) __PB_TEMP_DB__OutputVars0[0];
		#line hidden
		#line 12
		if (Sybase.PowerBuilder.WPF.PBSystemFunctions.IsNull((Sybase.PowerBuilder.PBAny)(((Sybase.PowerBuilder.PBAny)(il_roundpayfactor)))))
		#line hidden
		{
			#line 12
			il_roundpayfactor = (Sybase.PowerBuilder.PBLong)(new Sybase.PowerBuilder.PBInt(0));
			#line hidden
		}
		#line 14
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_setpayroundattrib(QIL)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_setpayroundattrib", new string[]{"integer", "long"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual void of_setpayroundattrib(Sybase.PowerBuilder.PBInt ai_roundtype, Sybase.PowerBuilder.PBLong al_factor)
	{
		#line hidden
		#line 1
		il_roundpayfactor = al_factor;
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.of_calprnbalatperiod(IMMMIRM)"
	#line hidden
	[Sybase.PowerBuilder.PBFunctionAttribute("of_calprnbalatperiod", new string[]{"decimal", "decimal", "decimal", "integer", "ref decimal"}, Sybase.PowerBuilder.PBModifier.Public, Sybase.PowerBuilder.PBFunctionType.kPowerscriptFunction)]
	public virtual Sybase.PowerBuilder.PBInt of_calprnbalatperiod(Sybase.PowerBuilder.PBDecimal adc_prncalamt, Sybase.PowerBuilder.PBDecimal adc_periodpay, Sybase.PowerBuilder.PBDecimal adc_intrate, Sybase.PowerBuilder.PBInt ai_chktime, ref Sybase.PowerBuilder.PBDecimal adc_prnbal)
	{
		#line hidden
		Sybase.PowerBuilder.PBDecimal ldc_interest = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBDecimal ldc_prnpay = new Sybase.PowerBuilder.PBDecimal(0m);
		Sybase.PowerBuilder.PBInt li_installment = Sybase.PowerBuilder.PBInt.DefaultValue;
		#line 4
		li_installment = new Sybase.PowerBuilder.PBInt(0);
		#line hidden
		#line 5
		adc_prnbal.AssignFrom((Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m)));
		#line hidden
		#line 7
		while ( adc_prncalamt> (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(0m)) )
		#line hidden
		{
				#line 9
				if ((Sybase.PowerBuilder.PBBoolean)(ii_estinttype == new Sybase.PowerBuilder.PBInt(1)))
				#line hidden
				{
					#line 10
					ldc_interest.AssignFrom((adc_prncalamt/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(12m)))* (adc_intrate/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(100m))));
					#line hidden
				}
				else
				{
					#line 12
					ldc_interest.AssignFrom(((adc_prncalamt* (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(30m)))/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(365m)))* (adc_intrate/ (Sybase.PowerBuilder.PBDecimal)(new Sybase.PowerBuilder.PBDecimal(100m))));
					#line hidden
				}
				#line 15
				ldc_interest.AssignFrom(Sybase.PowerBuilder.WPF.PBSystemFunctions.Round((ldc_interest).ToPBDecimal(-1), new Sybase.PowerBuilder.PBInt(2)));
				#line hidden
				#line 17
				ldc_prnpay.AssignFrom(adc_periodpay- ldc_interest);
				#line hidden
				#line 20
				if ((Sybase.PowerBuilder.PBBoolean)(ldc_prnpay> adc_prncalamt))
				#line hidden
				{
					#line 21
					ldc_prnpay.AssignFrom(adc_prncalamt);
					#line hidden
				}
				#line 24
				li_installment++;
				#line hidden
				#line 27
				adc_prncalamt.AssignFrom(adc_prncalamt- ldc_prnpay);
				#line hidden
				#line 29
				if ((Sybase.PowerBuilder.PBBoolean)((Sybase.PowerBuilder.PBLong)(li_installment)>= (Sybase.PowerBuilder.PBLong)(ai_chktime)))
				#line hidden
				{
					#line 30
					break;
					#line hidden
				}
		}

		#line 35
		adc_prnbal.AssignFrom(adc_prncalamt);
		#line hidden
		#line 37
		return new Sybase.PowerBuilder.PBInt(1);
		#line hidden
	}

	#line hidden
	[Sybase.PowerBuilder.PBEventAttribute("create")]
	public override void create()
	{
		#line hidden
		#line hidden
		base.create();
		#line hidden
		#line hidden
		;
		#line hidden
	}

	#line hidden
	[Sybase.PowerBuilder.PBEventAttribute("destroy")]
	public override void destroy()
	{
		#line hidden
		#line hidden
		this.TriggerEvent(new Sybase.PowerBuilder.PBString("destructor"));
		#line hidden
		#line hidden
		base.destroy();
		#line hidden
	}

	#line 1 "n_cst_loansrv_calperiod.constructor"
	#line hidden
	[Sybase.PowerBuilder.PBEventAttribute("constructor")]
	[Sybase.PowerBuilder.PBEventToken(Sybase.PowerBuilder.PBEventTokens.pbm_constructor)]
	public override Sybase.PowerBuilder.PBLong constructor()
	{
		#line hidden
		Sybase.PowerBuilder.PBLong ancestorreturnvalue = Sybase.PowerBuilder.PBLong.DefaultValue;
		#line 2
		ithw_exception = (Sybase.PowerBuilder.PBException)this.CreateInstance(typeof(Sybase.PowerBuilder.PBException), 0);
		#line hidden
		return new Sybase.PowerBuilder.PBLong(0);
	}

	#line 1 "n_cst_loansrv_calperiod.destructor"
	#line hidden
	[Sybase.PowerBuilder.PBEventAttribute("destructor")]
	[Sybase.PowerBuilder.PBEventToken(Sybase.PowerBuilder.PBEventTokens.pbm_destructor)]
	public override Sybase.PowerBuilder.PBLong destructor()
	{
		#line hidden
		Sybase.PowerBuilder.PBLong ancestorreturnvalue = Sybase.PowerBuilder.PBLong.DefaultValue;
		#line 2
		if (Sybase.PowerBuilder.WPF.PBSystemFunctions.IsValid((Sybase.PowerBuilder.PBPowerObject)(ithw_exception)))
		#line hidden
		{
			#line 2
			Sybase.PowerBuilder.WPF.PBSession.CurrentSession.DestroyObject(ithw_exception);
			#line hidden
		}
		return new Sybase.PowerBuilder.PBLong(0);
	}

	void _init()
	{
		this.CreateEvent += new Sybase.PowerBuilder.PBEventHandler(this.create);
		this.DestroyEvent += new Sybase.PowerBuilder.PBEventHandler(this.destroy);
		this.ConstructorEvent += new Sybase.PowerBuilder.PBM_EventHandler(this.constructor);
		this.DestructorEvent += new Sybase.PowerBuilder.PBM_EventHandler(this.destructor);

		if (System.ComponentModel.LicenseManager.UsageMode != System.ComponentModel.LicenseUsageMode.Designtime)
		{
		}
	}

	public c__n_cst_loansrv_calperiod()
	{
		_init();
	}


	public static explicit operator c__n_cst_loansrv_calperiod(Sybase.PowerBuilder.PBAny v)
	{
		if (v.Value is Sybase.PowerBuilder.PBUnboundedAnyArray)
		{
			Sybase.PowerBuilder.PBUnboundedAnyArray a = (Sybase.PowerBuilder.PBUnboundedAnyArray)v.Value;
			c__n_cst_loansrv_calperiod vv = new c__n_cst_loansrv_calperiod();
			if (vv.FromUnboundedAnyArray(a) > 0)
			{
				return vv;
			}
			else
			{
				return null;
			}
		}
		else
		{
			return (c__n_cst_loansrv_calperiod) v.Value;
		}
	}
}
 