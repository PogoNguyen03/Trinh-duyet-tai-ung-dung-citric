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
    public class InputAPPController : Controller
    {
        private CitricStoreEntities2 db = new CitricStoreEntities2();

        // GET: InputAPP
        public ActionResult Index()
        {
            var aPPs = db.APPs.Include(a => a.NHAPHATHANH).Include(a => a.THELOAI);
            return View(aPPs.ToList());
        }

        // GET: InputAPP/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            APP aPP = db.APPs.Find(id);
            if (aPP == null)
            {
                return HttpNotFound();
            }
            return View(aPP);
        }

        // GET: InputAPP/Create
        public ActionResult Create()
        {
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH");
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs, "MaTheLoai", "TenTheLoai");
            return View();
        }

        // POST: InputAPP/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaApp,TenApp,GioiThieu,KichThuocRam,NgonNgu,HeDieuHanh,LinkTai,MaTheLoai,MaNPH,NgayCapNhat,HinhNen,HinhCT1,HinhCT2,HinhCT3,HinhCT4,DanhGia")] APP aPP)
        {
            if (ModelState.IsValid)
            {
                db.APPs.Add(aPP);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH", aPP.MaNPH);
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs, "MaTheLoai", "TenTheLoai", aPP.MaTheLoai);
            return View(aPP);
        }

        // GET: InputAPP/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            APP aPP = db.APPs.Find(id);
            if (aPP == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH", aPP.MaNPH);
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs, "MaTheLoai", "TenTheLoai", aPP.MaTheLoai);
            return View(aPP);
        }

        // POST: InputAPP/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaApp,TenApp,GioiThieu,KichThuocRam,NgonNgu,HeDieuHanh,LinkTai,MaTheLoai,MaNPH,NgayCapNhat,HinhNen,HinhCT1,HinhCT2,HinhCT3,HinhCT4,DanhGia")] APP aPP)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aPP).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH", aPP.MaNPH);
            ViewBag.MaTheLoai = new SelectList(db.THELOAIs, "MaTheLoai", "TenTheLoai", aPP.MaTheLoai);
            return View(aPP);
        }

        // GET: InputAPP/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            APP aPP = db.APPs.Find(id);
            if (aPP == null)
            {
                return HttpNotFound();
            }
            return View(aPP);
        }

        // POST: InputAPP/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            APP aPP = db.APPs.Find(id);
            db.APPs.Remove(aPP);
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
