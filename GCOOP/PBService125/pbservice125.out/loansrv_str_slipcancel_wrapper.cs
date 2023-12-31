using System.ServiceModel; 
using System.Runtime.Serialization; 
namespace Sybase.PowerBuilder.WCFNVO
{
	[DataContract]
	public struct str_slipcancel
	{
		internal str_slipcancel(c__str_slipcancel __x__)
		{
			CopyFrom(out this, __x__);
		}
		internal void CopyFrom(c__str_slipcancel __x__)
		{
			CopyFrom(out this, __x__);
		}
		[DataMember] 
		public string member_no;
		[DataMember] 
		public string memcoop_id;
		[DataMember] 
		public string xml_memdet;
		[DataMember] 
		public string xml_sliplist;
		[DataMember] 
		public string slip_no;
		[DataMember] 
		public string slipcoop_id;
		[DataMember] 
		public System.Int16 cancel_type;
		[DataMember] 
		public System.DateTime cancel_date;
		[DataMember] 
		public string xml_sliphead;
		[DataMember] 
		public string xml_slipdetail;
		[DataMember] 
		public string xml_slipetc;
		[DataMember] 
		public string cancel_id;
		[DataMember] 
		public string cancel_coopid;
		[DataMember] 
		public string coop_id;
		[DataMember] 
		public System.DateTime operateccl_date;
		internal void CopyTo(c__str_slipcancel __x__)
		{
			__x__.member_no = member_no;
			__x__.memcoop_id = memcoop_id;
			__x__.xml_memdet = xml_memdet;
			__x__.xml_sliplist = xml_sliplist;
			__x__.slip_no = slip_no;
			__x__.slipcoop_id = slipcoop_id;
			__x__.cancel_type = cancel_type;
			__x__.cancel_date = cancel_date;
			__x__.xml_sliphead = xml_sliphead;
			__x__.xml_slipdetail = xml_slipdetail;
			__x__.xml_slipetc = xml_slipetc;
			__x__.cancel_id = cancel_id;
			__x__.cancel_coopid = cancel_coopid;
			__x__.coop_id = coop_id;
			__x__.operateccl_date = operateccl_date;
		}
		internal static void CopyFrom(out str_slipcancel __this__, c__str_slipcancel __x__)
		{
			__this__.member_no = __x__.member_no;
			__this__.memcoop_id = __x__.memcoop_id;
			__this__.xml_memdet = __x__.xml_memdet;
			__this__.xml_sliplist = __x__.xml_sliplist;
			__this__.slip_no = __x__.slip_no;
			__this__.slipcoop_id = __x__.slipcoop_id;
			__this__.cancel_type = __x__.cancel_type;
			__this__.cancel_date = __x__.cancel_date;
			__this__.xml_sliphead = __x__.xml_sliphead;
			__this__.xml_slipdetail = __x__.xml_slipdetail;
			__this__.xml_slipetc = __x__.xml_slipetc;
			__this__.cancel_id = __x__.cancel_id;
			__this__.cancel_coopid = __x__.cancel_coopid;
			__this__.coop_id = __x__.coop_id;
			__this__.operateccl_date = __x__.operateccl_date;
		}
		public static explicit operator object[](str_slipcancel __this__)
		{
			return new object[] {
				__this__.member_no
				,__this__.memcoop_id
				,__this__.xml_memdet
				,__this__.xml_sliplist
				,__this__.slip_no
				,__this__.slipcoop_id
				,__this__.cancel_type
				,__this__.cancel_date
				,__this__.xml_sliphead
				,__this__.xml_slipdetail
				,__this__.xml_slipetc
				,__this__.cancel_id
				,__this__.cancel_coopid
				,__this__.coop_id
				,__this__.operateccl_date
			};
		}
	}
} 