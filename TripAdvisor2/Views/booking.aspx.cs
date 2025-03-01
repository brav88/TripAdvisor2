using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripAdvisor2.Model;

namespace TripAdvisor2.Views
{
	public partial class booking : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if(Session["email"] == null)
			{
				Response.Redirect("index.aspx");
			}

			int id = Convert.ToInt16(Request.QueryString["id"]);

			lblName.InnerText = Session["email"].ToString();

			List<Resort> resorts = (List<Resort>)Session["resorts"];			

			foreach(var item in resorts)
			{
				if (item.Id == id) 
				{
					lblResortName.InnerText = item.Name;
					lblDescription.InnerText = item.Description;
					imgResort.Attributes.Add("src", item.Photo);
					lblPrice.InnerText = item.Price.ToString();
					lblTotal.InnerText = item.Price.ToString();
				}
			}
		}
	}
}