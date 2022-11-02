﻿using System;
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
    public class InputHEDIEUHANHController : Controller
    {
        private CitricStoreEntities2 db = new CitricStoreEntities2();

        // GET: InputHEDIEUHANH
        public ActionResult Index()
        {
            return View(db.HEDIEUHANHs.ToList());
        }

        // GET: InputHEDIEUHANH/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HEDIEUHANH hEDIEUHANH = db.HEDIEUHANHs.Find(id);
            if (hEDIEUHANH == null)
            {
                return HttpNotFound();
            }
            return View(hEDIEUHANH);
        }

        // GET: InputHEDIEUHANH/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: InputHEDIEUHANH/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaHDH,TenHDH")] HEDIEUHANH hEDIEUHANH)
        {
            if (ModelState.IsValid)
            {
                db.HEDIEUHANHs.Add(hEDIEUHANH);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(hEDIEUHANH);
        }

        // GET: InputHEDIEUHANH/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HEDIEUHANH hEDIEUHANH = db.HEDIEUHANHs.Find(id);
            if (hEDIEUHANH == null)
            {
                return HttpNotFound();
            }
            return View(hEDIEUHANH);
        }

        // POST: InputHEDIEUHANH/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHDH,TenHDH")] HEDIEUHANH hEDIEUHANH)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hEDIEUHANH).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(hEDIEUHANH);
        }

        // GET: InputHEDIEUHANH/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HEDIEUHANH hEDIEUHANH = db.HEDIEUHANHs.Find(id);
            if (hEDIEUHANH == null)
            {
                return HttpNotFound();
            }
            return View(hEDIEUHANH);
        }

        // POST: InputHEDIEUHANH/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HEDIEUHANH hEDIEUHANH = db.HEDIEUHANHs.Find(id);
            db.HEDIEUHANHs.Remove(hEDIEUHANH);
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