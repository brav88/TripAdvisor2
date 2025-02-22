using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using TripAdvisor2.Database;
using TripAdvisor2.Model;

namespace TripAdvisor2.Controllers
{
    public class ResortsController
    {        
        public List<Resort> GetResorts()
        {
			List<Resort> resorts = new List<Resort>();
			DatabaseHelper databaseHelper = new DatabaseHelper();
			DataTable ds = databaseHelper.GetResorts();

			foreach (DataRow dr in ds.Rows)
			{
				resorts.Add(new Resort()
				{
					Id = Convert.ToInt16(dr["id"]),
					Name = dr["name"].ToString(),
					Description = dr["description"].ToString(),
					Price = Convert.ToDecimal(dr["price"]),
					Photo = dr["photo"].ToString()
				});
			}

			return resorts;
        }

        
    }
}