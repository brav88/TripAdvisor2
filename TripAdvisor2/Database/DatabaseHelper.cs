using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace TripAdvisor2.Database
{
	public class DatabaseHelper
	{
		const string server = "localhost";
		const string database = "TripAdvisor2";

		SqlConnection cnn = new SqlConnection($"Data Source={server};Initial Catalog={database};Integrated Security=True");		

		public DataTable GetResorts()
		{
			string procedure = "[dbo].[GetResorts]";
			return Execute(procedure);
		}

		public DataTable Execute(string procedure)
		{
			try
			{
				using (this.cnn)
				{
					cnn.Open();
					SqlCommand cmd = cnn.CreateCommand();
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.CommandText = procedure;
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