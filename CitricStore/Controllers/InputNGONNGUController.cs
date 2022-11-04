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
    public class InputNGONNGUController : Controller
    {
        private CitricStoreEntities2 db = new CitricStoreEntities2();

        // GET: InputNGONNGU
        public ActionResult Index()
        {
            return View(db.NGONNGUs.ToList());
        }

        // GET: InputNGONNGU/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NGONNGU nGONNGU = db.NGONNGUs.Find(id);
            if (nGONNGU == null)
            {
                return HttpNotFound();
            }
            return View(nGONNGU);
        }

        // GET: InputNGONNGU/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: InputNGONNGU/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNgonNgu,TenNgonNgu")] NGONNGU nGONNGU)
        {
            if (ModelState.IsValid)
            {
                db.NGONNGUs.Add(nGONNGU);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nGONNGU);
        }

        // GET: InputNGONNGU/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NGONNGU nGONNGU = db.NGONNGUs.Find(id);
            if (nGONNGU == null)
            {
                return HttpNotFound();
            }
            return View(nGONNGU);
        }

        // POST: InputNGONNGU/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNgonNgu,TenNgonNgu")] NGONNGU nGONNGU)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nGONNGU).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nGONNGU);
        }

        // GET: InputNGONNGU/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NGONNGU nGONNGU = db.NGONNGUs.Find(id);
            if (nGONNGU == null)
            {
                return HttpNotFound();
            }
            return View(nGONNGU);
        }

        // POST: InputNGONNGU/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NGONNGU nGONNGU = db.NGONNGUs.Find(id);
            db.NGONNGUs.Remove(nGONNGU);
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
