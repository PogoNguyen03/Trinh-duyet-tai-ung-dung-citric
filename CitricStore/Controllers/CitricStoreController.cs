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
        //Use DbContext to manage databas
        CitricStoreEntities2 database = new CitricStoreEntities2();

        private List<UNGDUNG> LayUngDungMoi (int soluong)
        {
            return database.UNGDUNGs.OrderByDescending(ungdung => ungdung.NgayCapNhat).Take(soluong).ToList();
        }
        // GET: CitricStore
        public ActionResult Index()
        {
            var dsUngDungMoi = LayUngDungMoi(8);
            return View(dsUngDungMoi);
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
            /*            var theloai = from a in database.UNGDUNGs
                                      from b in database.THELOAIs
                                      where a.MaTheLoai == b.MaTheLoai
                                      select b.TenTheLoai;
            */
            var theloai = database.THELOAIs.ToList();

            return PartialView(theloai);              
        }


        public ActionResult UngDungTheoTheLoai(int id)
        {
            var dsUngDung = database.UNGDUNGs.Where(ud => ud.MaTheLoai == id).ToList();
            return View("Index", dsUngDung);
        }
        public ActionResult UngDungTheoNPH(int id)
        {
            var dsNPH = database.UNGDUNGs.Where(ud => ud.MaNPH == id).ToList();
            return View("Index", dsNPH);
        }


        public ActionResult Details(int id)
        {
            var ungdung = database.UNGDUNGs.FirstOrDefault(s => s.MaUngDung == id);
            return View(ungdung);
        }
    }
}