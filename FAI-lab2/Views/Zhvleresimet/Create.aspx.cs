﻿using FAI_lab2.Controllers;
using FAI_lab2.Models;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FAI_lab2.Views.Zhvleresimet
{
    public partial class Create : System.Web.UI.Page
    {
        int count;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                placeShenimet();
                placeShenimetList();
            }
            DataSotTextBox.ReadOnly = true;
            VitiTextBox.ReadOnly = true;
            DataRegjistrimitTextBox.ReadOnly = true;
            CmimiTextBox.ReadOnly = true;
            CmimiAktualTextBox.ReadOnly = true;
            HumbjaTextBox.ReadOnly = true;
            DataZhvlersimitTextBox.ReadOnly = true;
        }

        protected void ListGridView_DataBound(object sender, EventArgs e)
        {
            ListGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
            ListGridView.HeaderStyle.CssClass = "flip-content";
        }
        protected void ListGridView_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
                ListGridView.HeaderStyle.CssClass = "flip-content";
            }

        }

        private void placeShenimetList()
        {
            int ID = Convert.ToInt32(ViewState["SelectedID"].ToString());
            List<Zhvlersimi> lb = new List<Zhvlersimi>();
            ZhvlersimetMappers bm = new ZhvlersimetMappers(lb);
            bm.SelectAll(ID);
            ListGridView.DataSource = lb;
            ListGridView.DataBind();
        }
        protected void ListGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ListGridView.PageIndex = e.NewPageIndex;
            placeShenimet();
        }

        public void placeShenimet()
        {
            Index form = (Index)Context.Handler;
            int ID = form.SelectedID;
            ViewState["SelectedID"] = ID;

            Zhvlersimi ex = new Zhvlersimi();
            ZhvlersimiMapper em = new ZhvlersimiMapper(ex);
            Zhvlersimi exz = new Zhvlersimi();
            ZhvlersimiMapper emz = new ZhvlersimiMapper(exz);

            Produkti ex1 = new Produkti();
            ProduktiMapper em1 = new ProduktiMapper(ex1);

            em.SelectLastRecord(ID);
            emz.SelectedID(ex.ZhvlersimiID);
            em1.SelectedID(ID);

            if (exz.Viti != (DateTime.Today.Year - ex1.Data1.Year + 1))
            {
                zhvlerso();
            }
            TitlePageLabel.Text = ex1.Emri + " - " + ex1.NrSerik;
            DataSotTextBox.Text = DateTime.Now.ToShortDateString();
            VitiTextBox.Text = exz.Viti.ToString();
            DataRegjistrimitTextBox.Text = ex1.Data1.ToString("d");
            CmimiTextBox.Text = exz.Cmimi.ToString();
            CmimiAktualTextBox.Text = exz.CmimiZh.ToString();
            HumbjaTextBox.Text = (exz.Cmimi - exz.CmimiZh).ToString();
            DataZhvlersimitTextBox.Text = exz.DataZhvlersimit.ToString();
        }

        public void zhvlerso()
        {
            int ID = Convert.ToInt32(ViewState["SelectedID"].ToString());
            Produkti ex = new Produkti();
            ProduktiMapper em = new ProduktiMapper(ex);
            em.SelectedID(ID);

            List<Zhvlersimi> lb = new List<Zhvlersimi>();
            ZhvlersimetMappers bm = new ZhvlersimetMappers(lb);
            bm.SelectAllZhvlersimet();

            for (int i = 0; i > lb.Count; i++)
            {
                if (lb[i].ProduktiID.Equals(ID))
                {
                    count++;
                }
            }

            Zhvlersimi zh = new Zhvlersimi();
            if (count < ex.Jetegjatesia)
            {
                decimal cmimiPaSalvage = ex.Cmimi - ex.salvageValue;
                decimal cmimiZhvlersuar = cmimiPaSalvage / ex.Jetegjatesia;
                int viti = DateTime.Today.Year - ex.Data1.Year + 1;

                zh.Cmimi = ex.Cmimi;
                zh.ProduktiID = ex.ProduktiID;
                zh.Viti = viti;
                if (DateTime.Today.Year - ex.Data1.Year > 0)
                {
                    zh.CmimiZh = ex.Cmimi - cmimiZhvlersuar * viti;
                }
                else
                {
                    zh.CmimiZh = ex.Cmimi - cmimiZhvlersuar;
                }
                zh.DataZhvlersimit = DateTime.Today;
            }
            ZhvlersimiMapper zhx = new ZhvlersimiMapper(zh);
            zhx.Insert();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            placeShenimetList();
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Zhvlersimi.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            ListGridView.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
#pragma warning disable CS0612 // Type or member is obsolete  
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
#pragma warning restore CS0612 // Type or member is obsolete  
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            ListGridView.AllowPaging = true;
            ListGridView.DataBind();
        }
    }
}