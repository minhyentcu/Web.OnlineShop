﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Web.OnlineShop.Entity;
using Web.OnlineShop.Service;
using Web.OnlineShop.Common;

namespace Web.OnlineShop.Areas.Admin.Controllers
{
    [HasPermission(RoleID = "ALL_USER")]
    public class ContactController : BaseController
    {
        private readonly IContactService _contactService;
        public ContactController(IContactService contactService)
        {
            _contactService = contactService;
        }
        // GET: Admin/Contacts
        public ActionResult Index()
        {
            var models = _contactService.Contacts();
            return View(models);
        }

        // GET: Admin/Contacts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var contact = _contactService.GetContactById(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // GET: Admin/Contacts/Create
        public ActionResult Create()
        {
            var model = new Contact();
            return View(model);
        }

        // POST: Admin/Contacts/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create( Contact contact)
        {
            if (ModelState.IsValid)
            {
                var result = await _contactService.Create(contact);
                if (result)
                {
                    return RedirectToAction("Index");
                }
                return View(contact);
            }

            return View(contact);
        }

        // GET: Admin/Contacts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var contact = _contactService.GetContactById(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: Admin/Contacts/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit( Contact contact)
        {
            if (ModelState.IsValid)
            {
                var result = await _contactService.Update(contact);
                if (result)
                {
                    return RedirectToAction("Index");
                }
                return View(contact);
            }
            return View(contact);
        }

        // GET: Admin/Contacts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var contact = _contactService.GetContactById(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: Admin/Contacts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var result = await _contactService.Delete(id);
            if (result)
            {
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }
    }
}