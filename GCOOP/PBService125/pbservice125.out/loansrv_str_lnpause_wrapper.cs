using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_lnpause
	{
		internal str_lnpause(c__str_lnpause __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_lnpause __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string member_no;
		[DataMember] 
		public string memcoop_id;
		[DataMember] 
		public System.DateTime loanpause_date;
		[DataMember] 
		public string xml_pause;
		[DataMember] 
		public string xml_pausedet;
		[DataMember] 
		public string entry_id;
		[DataMember] 
		public string coop_id;
		internal void CopyTo(c__str_lnpause __x__)
		{
			__x__.member_no = member_no;
			__x__.memcoop_id = memcoop_id;
			__x__.loanpause_date = loanpause_date;
			__x__.xml_pause = xml_pause;
			__x__.xml_pausedet = xml_pausedet;
			__x__.entry_id = entry_id;
			__x__.coop_id = coop_id;
		}
		internal static void CopyFrom(out str_lnpause __this__, c__str_lnpause __x__)
		{
			__this__.member_no = __x__.member_no;
			__this__.memcoop_id = __x__.memcoop_id;
			__this__.loanpause_date = __x__.loanpause_date;
			__this__.xml_pause = __x__.xml_pause;
			__this__.xml_pausedet = __x__.xml_pausedet;
			__this__.entry_id = __x__.entry_id;
			__this__.coop_id = __x__.coop_id;
		}
		public static explicit operator object[](str_lnpause __this__)
		{
			return new object[] {
				__this__.member_no
				,__this__.memcoop_id
				,__this__.loanpause_date
				,__this__.xml_pause
				,__this__.xml_pausedet
				,__this__.entry_id
				,__this__.coop_id
			};
		}
	}
} 