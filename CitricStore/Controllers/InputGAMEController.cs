using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CitricStore.Models;

namespace CitricStore.Controllers 
{
    public class InputGAMEController : Controller
    {
        private CitricStoreEntities2 db = new CitricStoreEntities2();

        // GET: InputGAME
        public ActionResult Index()
        {
            var gAMEs = db.GAMEs.Include(g => g.NHAPHATHANH).Include(g => g.THELOAI).Include(g => g.HEDIEUHANH).Include(g => g.NGONNGU);
            return View(gAMEs.ToList());
        }

        // GET: InputGAME/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GAME gAME = db.GAMEs.Find(id);
            if (gAME == null)
            {
                return HttpNotFound();
            }
            return View(gAME);
        }

        // GET: InputGAME/Create
        public ActionResult Create()
        {
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH");
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs, "MaTheLoai", "TenTheLoai");
            ViewBag.MaNgonNgu = new SelectList(db.NGONNGUs, "MaNgonNgu", "TenNgonNgu");
            ViewBag.MaHDH = new SelectList(db.HEDIEUHANHs, "MaHDH", "TenHDH");
            return View();
        }

        // POST: InputGAME/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaGame,TenGame,GioiThieu,KichThuocRam,MaNgonNgu,MaHDH,LinkTai,MaTheLoai,MaNPH,NgayCapNhat,HinhNen,HinhCT1,HinhCT2,HinhCT3,HinhCT4,DanhGia")] GAME gAME)
        {
            if (ModelState.IsValid)
            {
                db.GAMEs.Add(gAME);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH", gAME.MaNPH);
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs, "MaTheLoai", "TenTheLoai", gAME.MaTheLoai);
            ViewBag.MaNgonNgu = new SelectList(db.NGONNGUs, "MaNgonNgu", "TenNgonNgu", gAME.MaNgonNgu);
            ViewBag.MaHDH = new SelectList(db.HEDIEUHANHs, "MaHDH", "TenHDH", gAME.MaHDH);

            return View(gAME);
        }

        // GET: InputGAME/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GAME gAME = db.GAMEs.Find(id);
            if (gAME == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH", gAME.MaNPH);
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs, "MaTheLoai", "TenTheLoai", gAME.MaTheLoai);
            ViewBag.MaNgonNgu = new SelectList(db.NGONNGUs, "MaNgonNgu", "TenNgonNgu", gAME.MaNgonNgu);
            ViewBag.MaHDH = new SelectList(db.HEDIEUHANHs, "MaHDH", "TenHDH", gAME.MaHDH);


            return View(gAME);
        }

        // POST: InputGAME/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaGame,TenGame,GioiThieu,KichThuocRam,MaNgonNgu,MaHDH,LinkTai,MaTheLoai,MaNPH,NgayCapNhat,HinhNen,HinhCT1,HinhCT2,HinhCT3,HinhCT4,DanhGia")] GAME gAME)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gAME).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH", gAME.MaNPH);
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs, "MaTheLoai", "TenTheLoai", gAME.MaTheLoai);
            ViewBag.MaNgonNgu = new SelectList(db.NGONNGUs, "MaNgonNgu", "TenNgonNgu", gAME.MaNgonNgu);
            ViewBag.MaHDH = new SelectList(db.HEDIEUHANHs, "MaHDH", "TenHDH", gAME.MaHDH);


            return View(gAME);
        }

        // GET: InputGAME/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GAME gAME = db.GAMEs.Find(id);
            if (gAME == null)
            {
                return HttpNotFound();
            }
            return View(gAME);
        }

        // POST: InputGAME/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GAME gAME = db.GAMEs.Find(id);
            db.GAMEs.Remove(gAME);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
