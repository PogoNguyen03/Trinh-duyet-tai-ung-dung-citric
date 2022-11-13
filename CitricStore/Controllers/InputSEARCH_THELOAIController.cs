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
    public class InputSEARCH_THELOAIController : Controller
    {
        private CitricStoreEntities4 db = new CitricStoreEntities4();

        // GET: InputSEARCH_THELOAI
        public ActionResult Index()
        {
            return View(db.SEARCH_THELOAI.ToList());
        }

        // GET: InputSEARCH_THELOAI/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SEARCH_THELOAI sEARCH_THELOAI = db.SEARCH_THELOAI.Find(id);
            if (sEARCH_THELOAI == null)
            {
                return HttpNotFound();
            }
            return View(sEARCH_THELOAI);
        }

        // GET: InputSEARCH_THELOAI/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: InputSEARCH_THELOAI/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaTheLoai,TenTheLoai")] SEARCH_THELOAI sEARCH_THELOAI)
        {
            if (ModelState.IsValid)
            {
                db.SEARCH_THELOAI.Add(sEARCH_THELOAI);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(sEARCH_THELOAI);
        }

        // GET: InputSEARCH_THELOAI/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SEARCH_THELOAI sEARCH_THELOAI = db.SEARCH_THELOAI.Find(id);
            if (sEARCH_THELOAI == null)
            {
                return HttpNotFound();
            }
            return View(sEARCH_THELOAI);
        }

        // POST: InputSEARCH_THELOAI/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaTheLoai,TenTheLoai")] SEARCH_THELOAI sEARCH_THELOAI)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sEARCH_THELOAI).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sEARCH_THELOAI);
        }

        // GET: InputSEARCH_THELOAI/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SEARCH_THELOAI sEARCH_THELOAI = db.SEARCH_THELOAI.Find(id);
            if (sEARCH_THELOAI == null)
            {
                return HttpNotFound();
            }
            return View(sEARCH_THELOAI);
        }

        // POST: InputSEARCH_THELOAI/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SEARCH_THELOAI sEARCH_THELOAI = db.SEARCH_THELOAI.Find(id);
            db.SEARCH_THELOAI.Remove(sEARCH_THELOAI);
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
