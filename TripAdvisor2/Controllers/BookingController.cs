using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using TripAdvisor2.Database;
using TripAdvisor2.Model;

namespace TripAdvisor2.Controllers
{
	public class BookingController
	{
		public void SaveBooking(Booking booking)
		{
			DatabaseHelper databaseHelper = new DatabaseHelper();
			databaseHelper.SaveBooking(booking);
		}

		public void DeleteBooking(int id)
		{
			DatabaseHelper databaseHelper = new DatabaseHelper();
			databaseHelper.DeleteBooking(id);
		}

		public List<Booking> GetBookings(string email)
		{
			List<Booking> bookings = new List<Booking>();
			DatabaseHelper databaseHelper = new DatabaseHelper();
			DataTable ds = databaseHelper.GetBookings(email);

			foreach (DataRow dr in ds.Rows)
			{
				bookings.Add(new Booking()
				{
					Id = Convert.ToInt16(dr["id"]),
					ResortId = Convert.ToInt16(dr["resort_id"]),
					Checkin = Convert.ToDateTime(dr["checkin"]),
					Checkout = Convert.ToDateTime(dr["checkout"]),
					Adults = Convert.ToInt16(dr["adults"]),
					Kids = Convert.ToInt16(dr["kids"]),
					Email = dr["email"].ToString(),
					Rooms = Convert.ToInt16(dr["rooms"]),
					TotalCost = Convert.ToDecimal(dr["total_cost"]),
					Photo = dr["photo"].ToString(),
					Name = dr["name"].ToString(),
				});
			}

			return bookings;
		}
	}
}