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
    public class InputTHELOAIGAMEController : Controller
    {
        private CitricStoreEntities5 db = new CitricStoreEntities5();

        // GET: InputTHELOAIGAME
        public ActionResult Index()
        {
            return View(db.THELOAIGAMEs.ToList());
        }

        // GET: InputTHELOAIGAME/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            THELOAIGAME tHELOAIGAME = db.THELOAIGAMEs.Find(id);
            if (tHELOAIGAME == null)
            {
                return HttpNotFound();
            }
            return View(tHELOAIGAME);
        }

        // GET: InputTHELOAIGAME/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: InputTHELOAIGAME/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaTheLoaiGame,TenTheLoai")] THELOAIGAME tHELOAIGAME)
        {
            if (ModelState.IsValid)
            {
                db.THELOAIGAMEs.Add(tHELOAIGAME);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tHELOAIGAME);
        }

        // GET: InputTHELOAIGAME/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            THELOAIGAME tHELOAIGAME = db.THELOAIGAMEs.Find(id);
            if (tHELOAIGAME == null)
            {
                return HttpNotFound();
            }
            return View(tHELOAIGAME);
        }

        // POST: InputTHELOAIGAME/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTheLoaiGame,TenTheLoai")] THELOAIGAME tHELOAIGAME)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tHELOAIGAME).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tHELOAIGAME);
        }

        // GET: InputTHELOAIGAME/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            THELOAIGAME tHELOAIGAME = db.THELOAIGAMEs.Find(id);
            if (tHELOAIGAME == null)
            {
                return HttpNotFound();
            }
            return View(tHELOAIGAME);
        }

        // POST: InputTHELOAIGAME/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            THELOAIGAME tHELOAIGAME = db.THELOAIGAMEs.Find(id);
            db.THELOAIGAMEs.Remove(tHELOAIGAME);
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
