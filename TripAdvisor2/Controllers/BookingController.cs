using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TripAdvisor2.Database;
using TripAdvisor2.Model;

namespace TripAdvisor2.Controllers
{
	public class BookingController
	{
		public void SaveBooking(Booking booking)
		{
			DatabaseHelper databaseHelper = new DatabaseHelper();
			databaseHelper.saveBooking(booking);
		}
	}
}