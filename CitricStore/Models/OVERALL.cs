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
    
    public partial class OVERALL
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OVERALL()
        {
            this.ORDER_PRODUCT = new HashSet<ORDER_PRODUCT>();
        }
    
        public int Ma { get; set; }
        public string Ten { get; set; }
        public string GioiThieu { get; set; }
        public string DungLuong { get; set; }
        public Nullable<int> MaNPH { get; set; }
        public Nullable<int> MaHDH { get; set; }
        public Nullable<int> MaNgonNgu { get; set; }
        public Nullable<int> MaTheLoai { get; set; }
        public Nullable<System.DateTime> NgayCapNhat { get; set; }
        public string DanhGia { get; set; }
        public Nullable<decimal> DonGia { get; set; }
        public string HinhNen { get; set; }
        public string HinhCT1 { get; set; }
        public string HinhCT2 { get; set; }
        public string HinhCT3 { get; set; }
        public string HinhCT4 { get; set; }
        public string LinkTai { get; set; }
        public string AppOrGame { get; set; }
    
        public virtual HEDIEUHANH HEDIEUHANH { get; set; }
        public virtual NGONNGU NGONNGU { get; set; }
        public virtual NHAPHATHANH NHAPHATHANH { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ORDER_PRODUCT> ORDER_PRODUCT { get; set; }
        public virtual THELOAI THELOAI { get; set; }
    }
}
