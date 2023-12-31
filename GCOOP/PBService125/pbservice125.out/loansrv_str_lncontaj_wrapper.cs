using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_lncontaj
	{
		internal str_lncontaj(c__str_lncontaj __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_lncontaj __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string loancontract_no;
		[DataMember] 
		public string contaj_docno;
		[DataMember] 
		public System.DateTime contaj_date;
		[DataMember] 
		public string xml_contdetail;
		[DataMember] 
		public string xml_contpayment;
		[DataMember] 
		public string xml_contloanpay;
		[DataMember] 
		public string xml_contcoll;
		[DataMember] 
		public string xml_contint;
		[DataMember] 
		public string xml_contintspc;
		[DataMember] 
		public string xml_oldcontintspc;
		[DataMember] 
		public string xml_oldcontcoll;
		[DataMember] 
		public string entry_id;
		internal void CopyTo(c__str_lncontaj __x__)
		{
			__x__.loancontract_no = loancontract_no;
			__x__.contaj_docno = contaj_docno;
			__x__.contaj_date = contaj_date;
			__x__.xml_contdetail = xml_contdetail;
			__x__.xml_contpayment = xml_contpayment;
			__x__.xml_contloanpay = xml_contloanpay;
			__x__.xml_contcoll = xml_contcoll;
			__x__.xml_contint = xml_contint;
			__x__.xml_contintspc = xml_contintspc;
			__x__.xml_oldcontintspc = xml_oldcontintspc;
			__x__.xml_oldcontcoll = xml_oldcontcoll;
			__x__.entry_id = entry_id;
		}
		internal static void CopyFrom(out str_lncontaj __this__, c__str_lncontaj __x__)
		{
			__this__.loancontract_no = __x__.loancontract_no;
			__this__.contaj_docno = __x__.contaj_docno;
			__this__.contaj_date = __x__.contaj_date;
			__this__.xml_contdetail = __x__.xml_contdetail;
			__this__.xml_contpayment = __x__.xml_contpayment;
			__this__.xml_contloanpay = __x__.xml_contloanpay;
			__this__.xml_contcoll = __x__.xml_contcoll;
			__this__.xml_contint = __x__.xml_contint;
			__this__.xml_contintspc = __x__.xml_contintspc;
			__this__.xml_oldcontintspc = __x__.xml_oldcontintspc;
			__this__.xml_oldcontcoll = __x__.xml_oldcontcoll;
			__this__.entry_id = __x__.entry_id;
		}
		public static explicit operator object[](str_lncontaj __this__)
		{
			return new object[] {
				__this__.loancontract_no
				,__this__.contaj_docno
				,__this__.contaj_date
				,__this__.xml_contdetail
				,__this__.xml_contpayment
				,__this__.xml_contloanpay
				,__this__.xml_contcoll
				,__this__.xml_contint
				,__this__.xml_contintspc
				,__this__.xml_oldcontintspc
				,__this__.xml_oldcontcoll
				,__this__.entry_id
			};
		}
	}
} 