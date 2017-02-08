using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ToDoList.Models;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ToDoList.Controllers
{
    public class ItemsController : Controller
    {
        private ToDoListContext db = new ToDoListContext();

        public IActionResult Index()
        {
            return View(db.Items.ToList());
        }

        public IActionResult Details(int id)
        {
            var thisItem = db.Items.Where(items => items.Id == id).Include(items => items.CategoryItems).FirstOrDefault();

            //Viewbag to test many to many relationships
            ViewBag.Categories = db.CategoriesItems.Include(ci => ci.Category).Include(ci => ci.Item).Where(ci => ci.Item.Description == "Something to be done").Select(ci => ci.Category.Description).ToList();

            //Viewbag to test many to many to many relationships
            //ViewBag.Priorities = db.CategoriesItems.Include(ci => ci.Category).Include(ci => ci.Item).Include(ci => ci.Item.ItemPriorities
            //.Join
            //(
            //    db.Priorities,
            //    itP => itP.PriorityId,
            //    p => p.Id,
            //    (itP, p) => new
            //    {
            //        ItemPriorities = itP,
            //        Priorities = p
            //    }
            //)).Where(ci => ci.ItemId == id).Select(ci => ci.);
            // Example Join
            //.Join(
            //    db.ItemPriorities,
            //    catIt => catIt.ItemId,
            //    itP => itP.ItemId,
            //    (catIt, itP) => new
            //    {
            //        ItemPriorities = itP,
            //        CategoriesItems = catIt
            //    }
            //)


            return View(db.CategoriesItems.Include(ci => ci.Category).Include(ci => ci.Item).ToList());
        }
                //


        public IActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Description");
            return View();
        }

        [HttpPost]
        public IActionResult Create(Item item)
        {
            db.Items.Add(item);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Edit(int id)
        {
            var thisItem = db.Items.FirstOrDefault(items => items.Id == id);
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Description");
            return View(thisItem);
        }

        [HttpPost]
        public IActionResult Edit(Item item)
        {
            db.Entry(item).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult Delete(int id)
        {
            var thisItem = db.Items.FirstOrDefault(items => items.Id == id);
            return View(thisItem);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(int id)
        {
            var thisItem = db.Items.FirstOrDefault(items => items.Id == id);
            db.Items.Remove(thisItem);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}


// TO SELECT BY ITEM ID
//ViewBag.Categories = db.CategoriesItems.Include(thing => thing.Category).Where(thingy => thingy.ItemId == id).Select(stuff => stuff.Category.Description).ToList();
// OR (to select by item description):
//ViewBag.Categories = db.CategoriesItems.Include(ci => ci.Category).Include(ci => ci.Item).Where(ci => ci.Item.Description == "Something to be done").Select(ci => ci.Category.Description).ToList();

// THE FORMER TURNS INTO: 
//exec sp_executesql N'
//    SELECT [thing.Category].[Description]
//    FROM
//    [CategoriesItems] AS[thing]
//    INNER JOIN[Categories] AS[thing.Category] ON[thing].[CategoryId] = [thing.Category].[Id]
//    WHERE[thing].[ItemId] = @__id_0',N'@__id_0 int',@__id_0=1

// WHICH IS BASICALLY: 
//    SELECT Categories.Description FROM CategoriesItems INNER JOIN Categories ON CategoriesItems.CategoryId = Categories.Id
//        WHERE CategoriesItems.ItemId = id