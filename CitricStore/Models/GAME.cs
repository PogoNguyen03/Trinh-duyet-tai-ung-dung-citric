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
    
    public partial class GAME
    {
        public int MaGame { get; set; }
        public string TenGame { get; set; }
        public string GioiThieu { get; set; }
        public string DungLuong { get; set; }
        public string NgonNgu { get; set; }
        public string HeDieuHanh { get; set; }
        public Nullable<int> MaTheLoaiGame { get; set; }
        public Nullable<int> MaNPH { get; set; }
        public Nullable<int> MaHDH { get; set; }
        public Nullable<int> MaNgonNgu { get; set; }
        public Nullable<System.DateTime> NgayCapNhat { get; set; }
        public string DanhGia { get; set; }
        public Nullable<decimal> DonGia { get; set; }
        public string HinhNen { get; set; }
        public string HinhCT1 { get; set; }
        public string HinhCT2 { get; set; }
        public string HinhCT3 { get; set; }
        public string HinhCT4 { get; set; }
        public string LinkTai { get; set; }
    
        public virtual HEDIEUHANH HEDIEUHANH1 { get; set; }
        public virtual NGONNGU NGONNGU1 { get; set; }
        public virtual NHAPHATHANH NHAPHATHANH { get; set; }
        public virtual THELOAIGAME THELOAIGAME { get; set; }
    }
}
