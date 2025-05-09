﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using TripAdvisor2.Model;
using TripAdvisor2.Views;

namespace TripAdvisor2.Database
{
	public class DatabaseHelper
	{
		const string server = "localhost";
		const string database = "TripAdvisor2";

		SqlConnection cnn = new SqlConnection($"Data Source={server};Initial Catalog={database};Integrated Security=True");		

		public DataTable GetResorts()
		{
			return Execute("[dbo].[getResorts]", null);
		}

		public DataTable GetBookings(string email)
		{
			List<SqlParameter> paramList = new List<SqlParameter>();

			paramList.Add(new SqlParameter("@email", email));

			return Execute("[dbo].[getBookings]", paramList);
		}

		public void SaveBooking(Booking booking)
		{
			List<SqlParameter> paramList = new List<SqlParameter>();

			paramList.Add(new SqlParameter("@resort_id", booking.ResortId));
			paramList.Add(new SqlParameter("@email", booking.Email));
			paramList.Add(new SqlParameter("@checkin", booking.Checkin));
			paramList.Add(new SqlParameter("@checkout", booking.Checkout));
			paramList.Add(new SqlParameter("@adults", booking.Adults));
			paramList.Add(new SqlParameter("@kids", booking.Kids));
			paramList.Add(new SqlParameter("@rooms", booking.Rooms));
			paramList.Add(new SqlParameter("@total_cost", booking.TotalCost));

			ExecuteUpdate("[dbo].[saveBooking]", paramList);
		}

		public void DeleteBooking(int id)
		{
			List<SqlParameter> paramList = new List<SqlParameter>();

			paramList.Add(new SqlParameter("@id", id));			

			ExecuteUpdate("[dbo].[deleteBooking]", paramList);
		}

		public void ExecuteUpdate(string procedure, List<SqlParameter> paramList)
		{
			try
			{
				using (this.cnn)
				{
					cnn.Open();
					SqlCommand cmd = cnn.CreateCommand();
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.CommandText = procedure;
					
					if (paramList != null)
					{
						foreach (SqlParameter param in paramList)
						{
							cmd.Parameters.Add(param);
						}
					}					

					cmd.ExecuteNonQuery();					
				}
			}
			catch
			{				
			}
		}

		public DataTable Execute(string procedure, List<SqlParameter> paramList)
		{
			try
			{
				using (this.cnn)
				{
					cnn.Open();
					SqlCommand cmd = cnn.CreateCommand();
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.CommandText = procedure;

					if (paramList != null)
					{
						foreach (SqlParameter param in paramList)
						{
							cmd.Parameters.Add(param);
						}
					}

					cmd.ExecuteNonQuery();

					DataTable dt = new DataTable();	
					SqlDataAdapter adapter = new SqlDataAdapter(cmd);
					adapter.Fill(dt);
					return dt;
				}
			}
			catch
			{
				return null;
			}
		}
	}
}