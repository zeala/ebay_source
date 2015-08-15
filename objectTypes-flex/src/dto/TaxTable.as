
package dto
{

	public class TaxTable
	{
		[ArrayElementType("TaxJurisdiction")]
		public var taxJurisdiction:Array;


		public function TaxTable()
		{
			this.taxJurisdiction = new Array();
		}  // TaxTable
	}  // class declaration
}  // package