using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_mbreqnew
	{
		internal str_mbreqnew(c__str_mbreqnew __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_mbreqnew __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string xml_mbdetail;
		[DataMember] 
		public string xml_mbmoneytr;
		[DataMember] 
		public string xml_mbgain;
		[DataMember] 
		public string req_no;
		[DataMember] 
		public string entry_id;
		[DataMember] 
		public string entry_bycoopid;
		[DataMember] 
		public string xml_reqopt;
		[DataMember] 
		public string xml_reqlist;
		internal void CopyTo(c__str_mbreqnew __x__)
		{
			__x__.xml_mbdetail = xml_mbdetail;
			__x__.xml_mbmoneytr = xml_mbmoneytr;
			__x__.xml_mbgain = xml_mbgain;
			__x__.req_no = req_no;
			__x__.entry_id = entry_id;
			__x__.entry_bycoopid = entry_bycoopid;
			__x__.xml_reqopt = xml_reqopt;
			__x__.xml_reqlist = xml_reqlist;
		}
		internal static void CopyFrom(out str_mbreqnew __this__, c__str_mbreqnew __x__)
		{
			__this__.xml_mbdetail = __x__.xml_mbdetail;
			__this__.xml_mbmoneytr = __x__.xml_mbmoneytr;
			__this__.xml_mbgain = __x__.xml_mbgain;
			__this__.req_no = __x__.req_no;
			__this__.entry_id = __x__.entry_id;
			__this__.entry_bycoopid = __x__.entry_bycoopid;
			__this__.xml_reqopt = __x__.xml_reqopt;
			__this__.xml_reqlist = __x__.xml_reqlist;
		}
		public static explicit operator object[](str_mbreqnew __this__)
		{
			return new object[] {
				__this__.xml_mbdetail
				,__this__.xml_mbmoneytr
				,__this__.xml_mbgain
				,__this__.req_no
				,__this__.entry_id
				,__this__.entry_bycoopid
				,__this__.xml_reqopt
				,__this__.xml_reqlist
			};
		}
	}
} 