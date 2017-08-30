﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EntityModel.EF;

namespace TLTY.Areas.Admin.Controllers
{
    public class ContactsController : BaseController
    {
        private TLTYDBContext db = new TLTYDBContext();

        // GET: /Admin/Contacts/
        public ActionResult Index()
        {
            return View(db.Contacts.ToList());
        }

        // GET: /Admin/Contacts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // GET: /Admin/Contacts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: /Admin/Contacts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="ID,CreateDate,UserName,Status,Address,Phone,Email")] Contact contact)
        {
            if (string.IsNullOrEmpty(contact.Address))
            {
                SetAlert("<img src='/Data/images/ChucNang/del.png' height='20' width='20' /> Địa chỉ trống xin hãy kiểm tra lại!", "error");
            }
            else if (string.IsNullOrEmpty(contact.Phone))
            {
                SetAlert("<img src='/Data/images/ChucNang/del.png' height='20' width='20' /> Số điện thoại trống xin hãy kiểm tra lại!", "error");
            }
            else if (string.IsNullOrEmpty(contact.Email))
            {
                SetAlert("<img src='/Data/images/ChucNang/del.png' height='20' width='20' /> Email trống xin hãy kiểm tra lại!", "error");
            }
            else
            {
                    contact.Status = false;
                    contact.CreateDate = DateTime.Now.Date;
                    contact.UserName = Session["UserName"].ToString();
                    db.Contacts.Add(contact);
                    db.SaveChanges();
                    if (contact.ID > 0)
                    {
                        SetAlert("<img src='/Data/images/ChucNang/ok.png' /> Thêm liên hệ thành công!. Hãy kích hoạt liên hệ vừa tạo.", "success");
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        SetAlert("<img src='/Data/images/ChucNang/del.png' height='20' width='20' /> Thêm liên hệ không thành công!", "error");
                        return RedirectToAction("Index");
                    }
                }
            return RedirectToAction("Index");
        }

        // GET: /Admin/Contacts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: /Admin/Contacts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="ID,CreateDate,UserName,Status,Address,Phone,Email")] Contact contact)
        {
            if (string.IsNullOrEmpty(contact.Address))
            {
                SetAlert("<img src='/Data/images/ChucNang/del.png' height='20' width='20' /> Địa chỉ trống xin hãy kiểm tra lại!", "error");
            }
            else if (string.IsNullOrEmpty(contact.Phone))
            {
                SetAlert("<img src='/Data/images/ChucNang/del.png' height='20' width='20' /> Số điện thoại trống xin hãy kiểm tra lại!", "error");
            }
            else if (string.IsNullOrEmpty(contact.Email))
            {
                SetAlert("<img src='/Data/images/ChucNang/del.png' height='20' width='20' /> Email trống xin hãy kiểm tra lại!", "error");
            }
            else
            {
                db.Entry(contact).State = EntityState.Modified;
                db.SaveChanges();
                if (contact.ID > 0)
                {
                    SetAlert("<img src='/Data/images/ChucNang/ok.png' /> Sửa liên hệ thành công!", "success");
                    return RedirectToAction("Index");
                }
                else
                {
                    SetAlert("<img src='/Data/images/ChucNang/del.png' height='20' width='20' /> Sửa liên hệ không thành công!", "error");
                    return RedirectToAction("Index");
                }
            }
            return RedirectToAction("Index");
        }

        // GET: /Admin/Contacts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contact contact = db.Contacts.Find(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: /Admin/Contacts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Contact contact = db.Contacts.Find(id);
            db.Contacts.Remove(contact);
            db.SaveChanges();
            if (contact.ID > 0)
            {
                SetAlert("<img src='/Data/images/ChucNang/ok.png' /> Xóa liên hệ thành công!", "success");
                return RedirectToAction("Index");
            }
            else
            {
                SetAlert("<img src='/Data/images/ChucNang/del.png' height='20' width='20' /> Xóa liên hệ không thành công!", "error");
                return RedirectToAction("Index");
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {

            var user = db.Contacts.Find(id);
            user.Status = !user.Status;
            db.SaveChanges();
            return Json(new
            {
                status = user.Status
            });
        }
    }
}