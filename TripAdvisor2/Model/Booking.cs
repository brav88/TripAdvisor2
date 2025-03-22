using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TripAdvisor2.Model
{
	public class Booking
	{
		public int ResortId { get; set; }
		public string Email { get; set; }
		public DateTime Checkin { get; set; }
		public DateTime Checkout { get; set; }
		public int Adults { get; set; }
		public int Kids { get; set; }
		public int Rooms { get; set; }
		public decimal TotalCost { get; set; }
	}
}