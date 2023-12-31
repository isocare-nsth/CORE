using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_lntrnrespons
	{
		internal str_lntrnrespons(c__str_lntrnrespons __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_lntrnrespons __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string concoop_id;
		[DataMember] 
		public string loancontract_no;
		[DataMember] 
		public string trnreq_code;
		[DataMember] 
		public System.DateTime trnreq_date;
		[DataMember] 
		public string xml_trnmast;
		[DataMember] 
		public string xml_trndetail;
		[DataMember] 
		public string entry_id;
		internal void CopyTo(c__str_lntrnrespons __x__)
		{
			__x__.concoop_id = concoop_id;
			__x__.loancontract_no = loancontract_no;
			__x__.trnreq_code = trnreq_code;
			__x__.trnreq_date = trnreq_date;
			__x__.xml_trnmast = xml_trnmast;
			__x__.xml_trndetail = xml_trndetail;
			__x__.entry_id = entry_id;
		}
		internal static void CopyFrom(out str_lntrnrespons __this__, c__str_lntrnrespons __x__)
		{
			__this__.concoop_id = __x__.concoop_id;
			__this__.loancontract_no = __x__.loancontract_no;
			__this__.trnreq_code = __x__.trnreq_code;
			__this__.trnreq_date = __x__.trnreq_date;
			__this__.xml_trnmast = __x__.xml_trnmast;
			__this__.xml_trndetail = __x__.xml_trndetail;
			__this__.entry_id = __x__.entry_id;
		}
		public static explicit operator object[](str_lntrnrespons __this__)
		{
			return new object[] {
				__this__.concoop_id
				,__this__.loancontract_no
				,__this__.trnreq_code
				,__this__.trnreq_date
				,__this__.xml_trnmast
				,__this__.xml_trndetail
				,__this__.entry_id
			};
		}
	}
} 