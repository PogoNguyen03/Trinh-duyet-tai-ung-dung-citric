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
    
    public partial class UNGDUNG
    {
        public int MaUngDung { get; set; }
        public string TenUngDung { get; set; }
        public string GioiThieu { get; set; }
        public string KichThuocRam { get; set; }
        public string NgonNgu { get; set; }
        public string HeDieuHanh { get; set; }
        public string LinkTai { get; set; }
        public Nullable<int> MaTheLoai { get; set; }
        public string HinhMinhHoa { get; set; }
        public Nullable<int> MaNPH { get; set; }
        public Nullable<System.DateTime> NgayCapNhat { get; set; }
    
        public virtual NHAPHATHANH NHAPHATHANH { get; set; }
        public virtual THELOAI THELOAI { get; set; }
    }
}