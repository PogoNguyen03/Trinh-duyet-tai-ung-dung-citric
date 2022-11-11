﻿using CitricStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace CitricStore.Controllers
{
    public class CitricStoreController : Controller
    {
        CitricStoreEntities4 database = new CitricStoreEntities4();

        //Lọc Game theo ngày cập nhật -> Game Mới
        public ActionResult Index()
        {
            var kh = database.KHACHHANGs.ToList();
            return View(kh);
        }

        private List<GAME> LayGameMoi(int soluong)
        {
            return database.GAMEs.OrderByDescending(game => game.NgayCapNhat).Take(soluong).ToList();
        }
        public ActionResult Index_GameMoi()
        {
            var dsGameMoi = LayGameMoi(8);
            return PartialView(dsGameMoi);
        }

        //Lọc Game theo đánh giá -> Game Đề Xuất
        private List<GAME> LayGameTheoDanhGia(int soluong)
        {
            return database.GAMEs.OrderByDescending(game => game.DanhGia).Take(soluong).ToList();
        }
        public ActionResult Index_GameTheoDanhGia()
        {
            var dsGameDeXuat = LayGameTheoDanhGia(8);
            return PartialView(dsGameDeXuat);
        }

        //Lọc App theo ngày cập nhật -> App Mới
        private List<APP> LayAppMoi(int soluong)
        {
            return database.APPs.OrderByDescending(app => app.NgayCapNhat).Take(soluong).ToList();
        }
        public ActionResult Index_AppMoi()
        {
            var dsAppMoi = LayAppMoi(8);
            return PartialView(dsAppMoi);
        }


        //Lọc App theo đánh giá -> App Đề Xuất
        private List<APP> LayAppTheoDanhGia(int soluong)
        {
            return database.APPs.OrderByDescending(app => app.DanhGia).Take(soluong).ToList();
        }
        public ActionResult Index_AppTheoDanhGia()
        {
            var dsAppDeXuat = LayAppTheoDanhGia(8);
            return PartialView(dsAppDeXuat);
        }

        //Dropdown Navbar
        public ActionResult Index_LayTheLoaiApp()
        {
            var dsTheLoai = database.THELOAIAPPs.ToList();
            return PartialView(dsTheLoai);
        }
        public ActionResult Index_LayTheLoaiGame()
        {
            var dsTheLoai = database.THELOAIGAMEs.ToList();
            return PartialView(dsTheLoai);
        }

        public ActionResult Page_GameTheoTheLoai(int id, string sortOrder)
        {
            ViewBag.RateSortParm = String.IsNullOrEmpty(sortOrder) ? "rate_desc" : "";
            ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";
            var games = from s in database.GAMEs
                        where s.MaTheLoaiGame == id
                        select s;
            switch (sortOrder)
            {
                case "rate_desc":
                    games = games.OrderByDescending(s => s.DanhGia);
                    break;
                case "Date":
                    games = games.OrderBy(s => s.NgayCapNhat);
                    break;
                case "date_desc":
                    games = games.OrderByDescending(s => s.NgayCapNhat);
                    break;
                default:
                    games = games.OrderBy(s => s.MaGame);
                    break;
            }
            return View(games.ToList());
        }


        public ActionResult Page_AppTheoTheLoai(int id, string sortOrder)
        {
            ViewBag.RateSortParm = String.IsNullOrEmpty(sortOrder) ? "rate_desc" : "";
            ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";
            var apps = from s in database.APPs
                        where s.MaTheLoaiApp == id
                        select s;
            switch (sortOrder)
            {
                case "rate_desc":
                    apps = apps.OrderByDescending(s => s.DanhGia);
                    break;
                case "Date":
                    apps = apps.OrderBy(s => s.NgayCapNhat);
                    break;
                case "date_desc":
                    apps = apps.OrderByDescending(s => s.NgayCapNhat);
                    break;
                default:
                    apps = apps.OrderBy(s => s.MaApp);
                    break;
            }
            return View(apps.ToList());
        }
        //Trang chứa toàn bộ game
        public ActionResult Page_Game(string searchString)
        {
            var game = from g in database.SEARCHALLs
                       select g;
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower();
                game = game.Where(g => g.TenSearch.ToLower().Contains(searchString));
            }
            return View(game);
        }

        //Trang chứa toàn bộ phần mềm
        public ActionResult Page_App(string searchString)
        {
            var app = from a in database.APPs
                      select a;
            if (!String.IsNullOrEmpty(searchString))
            {
                searchString = searchString.ToLower();
                app = app.Where(g => g.TenApp.ToLower().Contains(searchString));
            }
            return View(app);
        }





        public ActionResult DetailsApp(int id)
        {
            var app = database.APPs.FirstOrDefault(s => s.MaApp == id);
            return View(app);
        }

        //DetailsApp
        public ActionResult Details_AppMoi()
        {
            var dsAppMoi = LayAppMoi(8);
            return PartialView(dsAppMoi);
        }

        public ActionResult Details_AppTheoDanhGia()
        {
            var dsAppDeXuat = LayAppTheoDanhGia(8);
            return PartialView(dsAppDeXuat);
        }
        public ActionResult Details_AppCungTheLoai(int idtheloai)
        {
            var dsNPH = database.APPs.Where(ud => ud.MaTheLoaiApp == idtheloai).ToList();
            return PartialView(dsNPH);
        }
        //App theo NPH
        public ActionResult AppTheoNPH_Details(int idnph)
        {
            var dsNPH = database.GAMEs.Where(ud => ud.MaNPH == idnph).ToList();
            return PartialView(dsNPH);
        }

        //--------------------------DETAILS GAME--------------------------
        public ActionResult DetailsGame(int id)
        {
            var game = database.GAMEs.FirstOrDefault(s => s.MaGame == id);
            return View(game);
        }

        public ActionResult Details_GameTheoDanhGia()
        {
            var dsGameDeXuat = LayGameTheoDanhGia(8);
            return PartialView(dsGameDeXuat);
        }

        public ActionResult Details_GameMoi()
        {
            var dsGameMoi = LayGameMoi(8);
            return PartialView(dsGameMoi);
        }

        public ActionResult Details_GameCungTheLoai(int idtheloai)
        {
            var dsNPH = database.GAMEs.Where(ud => ud.MaTheLoaiGame == idtheloai).ToList();
            return PartialView(dsNPH);
        }


        //--------------------------GET NAME--------------------------\

        //Lấy tên thể loại app
        public ActionResult TenTheLoaiApp(int idtheloai)
        {
            var theloai = database.THELOAIAPPs.Where(g => g.MaTheLoaiApp == idtheloai).ToList();

            return PartialView(theloai);
        }
        public ActionResult TenTheLoaiGame(int idtheloai)
        {
            var theloai = database.THELOAIGAMEs.Where(g => g.MaTheLoaiGame == idtheloai).ToList();
            return PartialView(theloai);
        }
        //Lấy tên của nhà phát hành
        public ActionResult Details_TenNPH(int idnph)
        {
            var tennph = database.NHAPHATHANHs.Where(g => g.MaNPH == idnph).ToList();
            return PartialView(tennph);
        }

        //Lấy tên ngôn ngữ
        public ActionResult Details_TenNgonNgu(int idngonngu)
        {
            var tenngonngu = database.NGONNGUs.Where(g => g.MaNgonNgu == idngonngu).ToList();
            return PartialView(tenngonngu);
        }

        //Lấy tên hệ điều hành
        public ActionResult Details_TenHDH(int idhdh)
        {
            var tenhdh = database.HEDIEUHANHs.Where(g => g.MaHDH == idhdh).ToList();
            return PartialView(tenhdh);
        }

        //TRANG PHÂN LOẠI
        public ActionResult Classify()
        {
            return View();
        }









    }
}