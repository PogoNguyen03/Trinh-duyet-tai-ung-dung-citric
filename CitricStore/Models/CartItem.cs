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
        public string LoaiUngDung { get; set; }
        //Tính thành tiền = DongGia * SoLuong
        public decimal FinalPrice()
        {
            return SoLuong * DonGia;
        }
        public CartItem(int MaUD)
        {
            this.MaUngDung = MaUD;
            //Tìm sách trong CSDL có mã id cần và gán cho mặt hàng được mua
            var ud = db.OVERALLs.Single(s => s.Ma == this.MaUngDung);
            this.TenUngDung = ud.Ten;
            this.HinhNen = ud.HinhNen;
            this.DonGia = (decimal)ud.DonGia;
            this.SoLuong = 1; //Số lượng mua ban đầu của một mặt hàng là 1 (cho lần click đầu)
            this.LoaiUngDung = ud.AppOrGame;
        }

    }
}
