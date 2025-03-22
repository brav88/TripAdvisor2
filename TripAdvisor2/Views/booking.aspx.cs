using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripAdvisor2.Controllers;
using TripAdvisor2.Model;

namespace TripAdvisor2.Views
{
	public partial class booking : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Session["email"] == null)
				{
					Response.Redirect("index.aspx");
				}

				int id = Convert.ToInt16(Request.QueryString["id"]);

				lblName.InnerText = Session["email"].ToString();

				List<Resort> resorts = (List<Resort>)Session["resorts"];

				foreach (var item in resorts)
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

        protected void btnSaveBooking_ServerClick(object sender, EventArgs e)
        {
			int id = Convert.ToInt16(Request.QueryString["id"]);
			int nights = Convert.ToInt16((DateTime.Parse(DateOut.Value) - DateTime.Parse(DateIn.Value)).TotalDays);
			decimal totalCost = 25 + (Convert.ToInt16(txtAdults.Value) + Convert.ToInt16(txtKids.Value)) * nights * Convert.ToDecimal(lblTotal.InnerText);

			Booking booking = new Booking
			{
				ResortId = id,
				Email = Session["email"].ToString(),
				Checkin = DateTime.Parse(DateIn.Value),
				Checkout = DateTime.Parse(DateOut.Value),
				Adults = Convert.ToInt16(txtAdults.Value),
				Kids = Convert.ToInt16(txtKids.Value),
				Rooms = Convert.ToInt16(txtRooms.Value),
				TotalCost = totalCost
			};

			BookingController bookingController = new BookingController();
			bookingController.SaveBooking(booking);
		}
    }
}