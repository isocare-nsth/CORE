using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_divsrv_oper
	{
		internal str_divsrv_oper(c__str_divsrv_oper __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_divsrv_oper __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string xml_option;
		[DataMember] 
		public string xml_list;
		[DataMember] 
		public string xml_report;
		[DataMember] 
		public string xml_main;
		[DataMember] 
		public string xml_detail;
		[DataMember] 
		public string sql_select_list;
		[DataMember] 
		public string sql_select_report;
		[DataMember] 
		public string entry_id;
		[DataMember] 
		public string payoutslip_no;
		internal void CopyTo(c__str_divsrv_oper __x__)
		{
			__x__.xml_option = xml_option;
			__x__.xml_list = xml_list;
			__x__.xml_report = xml_report;
			__x__.xml_main = xml_main;
			__x__.xml_detail = xml_detail;
			__x__.sql_select_list = sql_select_list;
			__x__.sql_select_report = sql_select_report;
			__x__.entry_id = entry_id;
			__x__.payoutslip_no = payoutslip_no;
		}
		internal static void CopyFrom(out str_divsrv_oper __this__, c__str_divsrv_oper __x__)
		{
			__this__.xml_option = __x__.xml_option;
			__this__.xml_list = __x__.xml_list;
			__this__.xml_report = __x__.xml_report;
			__this__.xml_main = __x__.xml_main;
			__this__.xml_detail = __x__.xml_detail;
			__this__.sql_select_list = __x__.sql_select_list;
			__this__.sql_select_report = __x__.sql_select_report;
			__this__.entry_id = __x__.entry_id;
			__this__.payoutslip_no = __x__.payoutslip_no;
		}
		public static explicit operator object[](str_divsrv_oper __this__)
		{
			return new object[] {
				__this__.xml_option
				,__this__.xml_list
				,__this__.xml_report
				,__this__.xml_main
				,__this__.xml_detail
				,__this__.sql_select_list
				,__this__.sql_select_report
				,__this__.entry_id
				,__this__.payoutslip_no
			};
		}
	}
} 