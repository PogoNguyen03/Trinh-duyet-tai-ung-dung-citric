//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CitricStore.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ORDER_PRODUCT
    {
        public int ID { get; set; }
        public Nullable<int> MaUngDung { get; set; }
        public Nullable<int> MaOrder { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public Nullable<decimal> DonGia { get; set; }
    
        public virtual ORDER_INFO ORDER_INFO { get; set; }
        public virtual OVERALL OVERALL { get; set; }
    }
}
