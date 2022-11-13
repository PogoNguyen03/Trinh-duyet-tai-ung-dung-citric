using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CitricStore.Models
{
    public class CartItem
    {
        CitricStoreEntities4 db = new CitricStoreEntities4();
        public int MaUngDung { get; set; }
        public string TenUngDung { get; set; }
        public string HinhNen { get; set; }
        public decimal DonGia { get; set; }
        public int SoLuong { get; set; }
        //Tính thành tiền = DongGia * SoLuong
        public decimal FinalPrice()
        {
            return SoLuong * DonGia;
        }
        public CartItem(int MaUD)
        {
            this.MaUngDung = MaUD;
            //Tìm sách trong CSDL có mã id cần và gán cho mặt hàng được mua
            var ud = db.SEARCHALLs.Single(s => s.MaSearch == this.MaUngDung);
            this.TenUngDung = ud.TenSearch;
            this.HinhNen = ud.HinhNen;
            this.DonGia = (decimal)ud.DonGia;
            this.SoLuong = 1; //Số lượng mua ban đầu của một mặt hàng là 1 (cho lần click đầu)
        }

    }
}
