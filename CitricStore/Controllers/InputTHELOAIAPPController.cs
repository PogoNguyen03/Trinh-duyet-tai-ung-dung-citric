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
    public class InputTHELOAIAPPController : Controller
    {
        private CitricStoreEntities5 db = new CitricStoreEntities5();

        // GET: InputTHELOAIAPP
        public ActionResult Index()
        {
            return View(db.THELOAIAPPs.ToList());
        }

        // GET: InputTHELOAIAPP/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            THELOAIAPP tHELOAIAPP = db.THELOAIAPPs.Find(id);
            if (tHELOAIAPP == null)
            {
                return HttpNotFound();
            }
            return View(tHELOAIAPP);
        }

        // GET: InputTHELOAIAPP/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: InputTHELOAIAPP/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaTheLoaiApp,TenTheLoai")] THELOAIAPP tHELOAIAPP)
        {
            if (ModelState.IsValid)
            {
                db.THELOAIAPPs.Add(tHELOAIAPP);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tHELOAIAPP);
        }

        // GET: InputTHELOAIAPP/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            THELOAIAPP tHELOAIAPP = db.THELOAIAPPs.Find(id);
            if (tHELOAIAPP == null)
            {
                return HttpNotFound();
            }
            return View(tHELOAIAPP);
        }

        // POST: InputTHELOAIAPP/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTheLoaiApp,TenTheLoai")] THELOAIAPP tHELOAIAPP)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tHELOAIAPP).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tHELOAIAPP);
        }

        // GET: InputTHELOAIAPP/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            THELOAIAPP tHELOAIAPP = db.THELOAIAPPs.Find(id);
            if (tHELOAIAPP == null)
            {
                return HttpNotFound();
            }
            return View(tHELOAIAPP);
        }

        // POST: InputTHELOAIAPP/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            THELOAIAPP tHELOAIAPP = db.THELOAIAPPs.Find(id);
            db.THELOAIAPPs.Remove(tHELOAIAPP);
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
