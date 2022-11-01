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
    public class InputNHAPHATHANHController : Controller
    {
        private CitricStoreEntities2 db = new CitricStoreEntities2();

        // GET: InputNHAPHATHANH
        public ActionResult Index()
        {
            return View(db.NHAPHATHANHs.ToList());
        }

        // GET: InputNHAPHATHANH/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NHAPHATHANH nHAPHATHANH = db.NHAPHATHANHs.Find(id);
            if (nHAPHATHANH == null)
            {
                return HttpNotFound();
            }
            return View(nHAPHATHANH);
        }

        // GET: InputNHAPHATHANH/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: InputNHAPHATHANH/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNPH,TenNPH")] NHAPHATHANH nHAPHATHANH)
        {
            if (ModelState.IsValid)
            {
                db.NHAPHATHANHs.Add(nHAPHATHANH);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nHAPHATHANH);
        }

        // GET: InputNHAPHATHANH/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NHAPHATHANH nHAPHATHANH = db.NHAPHATHANHs.Find(id);
            if (nHAPHATHANH == null)
            {
                return HttpNotFound();
            }
            return View(nHAPHATHANH);
        }

        // POST: InputNHAPHATHANH/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNPH,TenNPH")] NHAPHATHANH nHAPHATHANH)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nHAPHATHANH).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nHAPHATHANH);
        }

        // GET: InputNHAPHATHANH/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NHAPHATHANH nHAPHATHANH = db.NHAPHATHANHs.Find(id);
            if (nHAPHATHANH == null)
            {
                return HttpNotFound();
            }
            return View(nHAPHATHANH);
        }

        // POST: InputNHAPHATHANH/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NHAPHATHANH nHAPHATHANH = db.NHAPHATHANHs.Find(id);
            db.NHAPHATHANHs.Remove(nHAPHATHANH);
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
