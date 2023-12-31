using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_lninsure
	{
		internal str_lninsure(c__str_lninsure __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_lninsure __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string member_no;
		[DataMember] 
		public string instype_code;
		[DataMember] 
		public string lncont_clr;
		[DataMember] 
		public decimal loanrequest_amt;
		[DataMember] 
		public System.DateTime loanrcv_date;
		[DataMember] 
		public decimal insprotect_amt;
		[DataMember] 
		public decimal ins_amt;
		internal void CopyTo(c__str_lninsure __x__)
		{
			__x__.member_no = member_no;
			__x__.instype_code = instype_code;
			__x__.lncont_clr = lncont_clr;
			__x__.loanrequest_amt = loanrequest_amt;
			__x__.loanrcv_date = loanrcv_date;
			__x__.insprotect_amt = insprotect_amt;
			__x__.ins_amt = ins_amt;
		}
		internal static void CopyFrom(out str_lninsure __this__, c__str_lninsure __x__)
		{
			__this__.member_no = __x__.member_no;
			__this__.instype_code = __x__.instype_code;
			__this__.lncont_clr = __x__.lncont_clr;
			__this__.loanrequest_amt = __x__.loanrequest_amt;
			__this__.loanrcv_date = __x__.loanrcv_date;
			__this__.insprotect_amt = __x__.insprotect_amt;
			__this__.ins_amt = __x__.ins_amt;
		}
		public static explicit operator object[](str_lninsure __this__)
		{
			return new object[] {
				__this__.member_no
				,__this__.instype_code
				,__this__.lncont_clr
				,__this__.loanrequest_amt
				,__this__.loanrcv_date
				,__this__.insprotect_amt
				,__this__.ins_amt
			};
		}
	}
} 