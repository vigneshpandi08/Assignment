using Assignment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Assignment.Controllers
{
    public class UserController : Controller
    {
        UserDB usrDB = new UserDB();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult List()
        {
            return Json(usrDB.ListAll(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(User usr)
        {
            return Json(usrDB.Add(usr), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(User usr)
        {
            return Json(usrDB.Update(usr), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetbyID(int ID)
        {
            var User = usrDB.ListAll().Find(x => x.UserID.Equals(ID));
            return Json(User, JsonRequestBehavior.AllowGet);
        }
    }
}