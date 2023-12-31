using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_procdeptupmonth
	{
		internal str_procdeptupmonth(c__str_procdeptupmonth __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_procdeptupmonth __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public System.Int16 ai_year;
		[DataMember] 
		public System.Int16 ai_month;
		[DataMember] 
		public System.DateTime adtm_operatedate;
		[DataMember] 
		public System.DateTime adtm_pmondate;
		[DataMember] 
		public string as_entry_id;
		[DataMember] 
		public string as_terminal_id;
		[DataMember] 
		public System.Int16 group_status;
		[DataMember] 
		public string start_group;
		[DataMember] 
		public string end_group;
		[DataMember] 
		public string as_coopid;
		[DataMember] 
		public System.Int16 ai_status_pension;
		[DataMember] 
		public System.Int16 ai_status_deptacc;
		[DataMember] 
		public string as_sdeptaccount;
		[DataMember] 
		public string as_edeptaccount;
		[DataMember] 
		public string as_memno;
		internal void CopyTo(c__str_procdeptupmonth __x__)
		{
			__x__.ai_year = ai_year;
			__x__.ai_month = ai_month;
			__x__.adtm_operatedate = adtm_operatedate;
			__x__.adtm_pmondate = adtm_pmondate;
			__x__.as_entry_id = as_entry_id;
			__x__.as_terminal_id = as_terminal_id;
			__x__.group_status = group_status;
			__x__.start_group = start_group;
			__x__.end_group = end_group;
			__x__.as_coopid = as_coopid;
			__x__.ai_status_pension = ai_status_pension;
			__x__.ai_status_deptacc = ai_status_deptacc;
			__x__.as_sdeptaccount = as_sdeptaccount;
			__x__.as_edeptaccount = as_edeptaccount;
			__x__.as_memno = as_memno;
		}
		internal static void CopyFrom(out str_procdeptupmonth __this__, c__str_procdeptupmonth __x__)
		{
			__this__.ai_year = __x__.ai_year;
			__this__.ai_month = __x__.ai_month;
			__this__.adtm_operatedate = __x__.adtm_operatedate;
			__this__.adtm_pmondate = __x__.adtm_pmondate;
			__this__.as_entry_id = __x__.as_entry_id;
			__this__.as_terminal_id = __x__.as_terminal_id;
			__this__.group_status = __x__.group_status;
			__this__.start_group = __x__.start_group;
			__this__.end_group = __x__.end_group;
			__this__.as_coopid = __x__.as_coopid;
			__this__.ai_status_pension = __x__.ai_status_pension;
			__this__.ai_status_deptacc = __x__.ai_status_deptacc;
			__this__.as_sdeptaccount = __x__.as_sdeptaccount;
			__this__.as_edeptaccount = __x__.as_edeptaccount;
			__this__.as_memno = __x__.as_memno;
		}
		public static explicit operator object[](str_procdeptupmonth __this__)
		{
			return new object[] {
				__this__.ai_year
				,__this__.ai_month
				,__this__.adtm_operatedate
				,__this__.adtm_pmondate
				,__this__.as_entry_id
				,__this__.as_terminal_id
				,__this__.group_status
				,__this__.start_group
				,__this__.end_group
				,__this__.as_coopid
				,__this__.ai_status_pension
				,__this__.ai_status_deptacc
				,__this__.as_sdeptaccount
				,__this__.as_edeptaccount
				,__this__.as_memno
			};
		}
	}
} 