using CitricStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CitricStore.Controllers
{
    public class CitricStoreController : Controller
    {
        //Use DbContext to manage database
        CitricStoreEntities2 database = new CitricStoreEntities2();

        //Lọc Game theo ngày cập nhật -> Game Mới
        private List<GAME> LayGameMoi (int soluong)
        {
            return database.GAMEs.OrderByDescending(game => game.NgayCapNhat).Take(soluong).ToList();
        }

        // GET: CitricStore
        public ActionResult Index()
        {
            var dsGameMoi = LayGameMoi(8);
            return View(dsGameMoi);
        }

        //Lọc Game theo đánh giá -> Game Đề Xuất
        private List<GAME> LayGameTheoDanhGia(int soluong)
        {
            return database.GAMEs.OrderByDescending(game => game.DanhGia).Take(soluong).ToList();
        }
        public ActionResult GameTheoDanhGia()
        {
            var dsGameDeXuat = LayGameTheoDanhGia(8);
            return PartialView(dsGameDeXuat);
        }

        //Lọc App theo ngày cập nhật -> App Mới
        private List<APP> LayAppMoi(int soluong)
        {
            return database.APPs.OrderByDescending(app => app.NgayCapNhat).Take(soluong).ToList();
        }
        public ActionResult AppMoi()
        {
            var dsAppMoi = LayAppMoi(8);
            return PartialView(dsAppMoi);
        }

        //Lọc App theo đánh giá -> App Đề Xuất
        private List<APP> LayAppTheoDanhGia(int soluong)
        {
            return database.APPs.OrderByDescending(app => app.DanhGia).Take(soluong).ToList();
        }
        public ActionResult AppTheoDanhGia()
        {
            var dsAppDeXuat = LayAppTheoDanhGia(8);
            return PartialView(dsAppDeXuat);
        }


        public ActionResult LayTheLoai()
        {
           var dsTheLoai = database.THELOAIs.ToList();
           return PartialView(dsTheLoai);
        }

        public ActionResult LayNPH()
        {
            var dsNPH = database.NHAPHATHANHs.ToList();
            return PartialView(dsNPH);
        }
         public ActionResult TenTheLoai_Bloggame()
        {
                    /*var theloai = from a in database.UNGDUNGs
                                      from b in database.THELOAIs
                                      where a.MaTheLoai == b.MaTheLoai
                                      select b.TenTheLoai;*/
                    var theloai = database.THELOAIs.ToList();

            return PartialView(theloai);              
        }


        public ActionResult UngDungTheoTheLoai(int id)
        {
            var dsUngDung = database.GAMEs.Where(ud => ud.MaTheLoai == id).ToList();
            return View("Index", dsUngDung);
        }
        public ActionResult UngDungTheoNPH(int id)
        {
            var dsNPH = database.GAMEs.Where(ud => ud.MaNPH == id).ToList();
            return View("Index", dsNPH);
        }

        public ActionResult AppTheoNPH_Details(int id)
        {
            var dsNPH = database.APPs.Where(ud => ud.MaNPH == id).ToList();
            return PartialView("Index", dsNPH);
        }


        public ActionResult DetailsGame(int id)
        {
            var game = database.GAMEs.FirstOrDefault(s => s.MaGame == id);
            return View(game);
        }

        public ActionResult DetailsApp(int id)
        {
            var app = database.APPs.FirstOrDefault(s => s.MaApp == id);
            return View(app);
        }

        //DetailsApp
        public ActionResult AppMoi_Details()
        {
            var dsAppMoi = LayAppMoi(8);
            return PartialView(dsAppMoi);
        }

        public ActionResult AppTheoDanhGia_Details()
        {
            var dsAppDeXuat = LayAppTheoDanhGia(8);
            return PartialView(dsAppDeXuat);
        }

        public ActionResult GameTheoDanhGia_Details()
        {
            var dsGameDeXuat = LayGameTheoDanhGia(8);
            return PartialView(dsGameDeXuat);
        }
        public ActionResult GameMoi_Details()
        {
            var dsGameMoi = LayGameMoi(8);
            return PartialView(dsGameMoi);
        }

        public ActionResult Search()
        {
            return View();
        }

        public APP Select(int id)
        {
            return database.APPs.Find(id);
        }

        public List<APP> SelectByKey(string key)
        {
            return database.APPs.SqlQuery("Select * from APP where TenAPP like '%" + key + "%'").ToList();
        }
        public GAME Select1(int id)
        {
            return database.GAMEs.Find(id);
        }

        public List<GAME> SelectByKey1(string key)
        {
            return database.GAMEs.SqlQuery("Select * from GAME where TenGame like '%" + key + "%'").ToList();
        }

    }
}