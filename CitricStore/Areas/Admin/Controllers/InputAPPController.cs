using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CitricStore.Models;
using System.IO;

namespace CitricStore.Areas.Admin.Controllers
{
    public class InputAPPController : Controller
    {
        private CitricStoreEntities4 db = new CitricStoreEntities4();

        // GET: Admin/InputAPP
        public ActionResult Index()
        {
            var aPPs = db.APPs.Include(a => a.HEDIEUHANH1).Include(a => a.NGONNGU1).Include(a => a.NHAPHATHANH).Include(a => a.THELOAIAPP);
            return View(aPPs.ToList());
        }

        // GET: Admin/InputAPP/Details/5
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

        // GET: Admin/InputAPP/Create
        public ActionResult Create()
        {
            ViewBag.MaHDH = new SelectList(db.HEDIEUHANHs, "MaHDH", "TenHDH");
            ViewBag.MaNgonNgu = new SelectList(db.NGONNGUs, "MaNgonNgu", "TenNgonNgu");
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH");
            ViewBag.MaTheLoaiApp = new SelectList(db.THELOAIAPPs, "MaTheLoaiApp", "TenTheLoai");
            return View();
        }

        // POST: Admin/InputAPP/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaApp,TenApp,GioiThieu,DungLuong,NgonNgu,HeDieuHanh,LinkTai,MaTheLoaiApp,MaNPH,MaHDH,MaNgonNgu,NgayCapNhat,DanhGia,HinhNen,HinhCT1,HinhCT2,HinhCT3,HinhCT4")] APP aPP, HttpPostedFileBase HinhNen)
        {
            if (ModelState.IsValid)
            {
                if(HinhNen != null)
                {
                    var fileName = Path.GetFileName(HinhNen.FileName);

                    var path = Path.Combine(Server.MapPath("~/Images/APP"), fileName);

                    aPP.HinhNen = fileName;

                    HinhNen.SaveAs(path);
                }
                db.APPs.Add(aPP);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaHDH = new SelectList(db.HEDIEUHANHs, "MaHDH", "TenHDH", aPP.MaHDH);
            ViewBag.MaNgonNgu = new SelectList(db.NGONNGUs, "MaNgonNgu", "TenNgonNgu", aPP.MaNgonNgu);
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH", aPP.MaNPH);
            ViewBag.MaTheLoaiApp = new SelectList(db.THELOAIAPPs, "MaTheLoaiApp", "TenTheLoai", aPP.MaTheLoaiApp);
            return View(aPP);
        }

        // GET: Admin/InputAPP/Edit/5
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
            ViewBag.MaHDH = new SelectList(db.HEDIEUHANHs, "MaHDH", "TenHDH", aPP.MaHDH);
            ViewBag.MaNgonNgu = new SelectList(db.NGONNGUs, "MaNgonNgu", "TenNgonNgu", aPP.MaNgonNgu);
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH", aPP.MaNPH);
            ViewBag.MaTheLoaiApp = new SelectList(db.THELOAIAPPs, "MaTheLoaiApp", "TenTheLoai", aPP.MaTheLoaiApp);
            return View(aPP);
        }

        // POST: Admin/InputAPP/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaApp,TenApp,GioiThieu,DungLuong,NgonNgu,HeDieuHanh,LinkTai,MaTheLoaiApp,MaNPH,MaHDH,MaNgonNgu,NgayCapNhat,DanhGia,HinhNen,HinhCT1,HinhCT2,HinhCT3,HinhCT4")] APP aPP)
        {
            if (ModelState.IsValid)
            {
                db.Entry(aPP).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaHDH = new SelectList(db.HEDIEUHANHs, "MaHDH", "TenHDH", aPP.MaHDH);
            ViewBag.MaNgonNgu = new SelectList(db.NGONNGUs, "MaNgonNgu", "TenNgonNgu", aPP.MaNgonNgu);
            ViewBag.MaNPH = new SelectList(db.NHAPHATHANHs, "MaNPH", "TenNPH", aPP.MaNPH);
            ViewBag.MaTheLoaiApp = new SelectList(db.THELOAIAPPs, "MaTheLoaiApp", "TenTheLoai", aPP.MaTheLoaiApp);
            return View(aPP);
        }

        // GET: Admin/InputAPP/Delete/5
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

        // POST: Admin/InputAPP/Delete/5
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
