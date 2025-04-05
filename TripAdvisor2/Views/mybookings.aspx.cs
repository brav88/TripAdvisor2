using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using TripAdvisor2.Controllers;

namespace TripAdvisor2.Views
{
	public partial class mybookings : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			LoadBooking();
		}

		public void LoadBooking()
		{
			if (Session["email"] == null)
			{
				Response.Redirect("index.aspx");
			}

			BookingController bookingController = new BookingController();

			repBooking.DataSource = bookingController.GetBookings(Session["email"].ToString());
			repBooking.DataBind();
		}

		protected void btnDelete_ServerClick(object sender, EventArgs e)
		{
			var button = (HtmlButton)sender;
			int dataId = Convert.ToInt16(button.Attributes["dataId"]);

			BookingController bookingController = new BookingController();
			bookingController.DeleteBooking(dataId);

			LoadBooking();
		}
	}
}