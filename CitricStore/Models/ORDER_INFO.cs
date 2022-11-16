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
    
    public partial class ORDER_INFO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ORDER_INFO()
        {
            this.ORDER_PRODUCT = new HashSet<ORDER_PRODUCT>();
        }
    
        public int MaOrder { get; set; }
        public Nullable<System.DateTime> NgayOrder { get; set; }
        public Nullable<int> MaKH { get; set; }
        public string TenOrder { get; set; }
        public string SDTOrder { get; set; }
        public string EmailOrder { get; set; }
        public Nullable<int> MaNganHang { get; set; }
        public string MaTaiKhoan { get; set; }
        public string TenTaiKhoan { get; set; }
        public Nullable<decimal> TongTien { get; set; }
    
        public virtual BANK BANK { get; set; }
        public virtual KHACHHANG KHACHHANG { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ORDER_PRODUCT> ORDER_PRODUCT { get; set; }
    }
}
