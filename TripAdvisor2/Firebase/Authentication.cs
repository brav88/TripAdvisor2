using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI.DataVisualization.Charting;

namespace TripAdvisor2.Firebase
{
	public static class Authentication
	{
		static string apiWeb = "";
		static string url = string.Empty;
		static string urlSign = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + apiWeb;
		static string urlSignUp = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + apiWeb;

		public static bool signInWithPassword(bool signIn, string email, string password)
		{
			try
			{
				if (signIn)
					url = urlSign;
				else
					url = urlSignUp;

				string responseText = string.Empty;
				string body = "{'email':'" + email + "','password':'" + password + "','returnSecureToken':true}";

				HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
				request.Method = "POST";
				request.ContentType = "application/json";

				using (Stream dataStream = request.GetRequestStream())
				{
					dataStream.Write(Encoding.UTF8.GetBytes(body), 0, Encoding.UTF8.GetBytes(body).Length);
				}

				try
				{
					HttpWebResponse response = request.GetResponse() as HttpWebResponse;
					using (StreamReader reader = new StreamReader(response.GetResponseStream()))
					{
						responseText = reader.ReadToEnd();
						return true;
					}
				}
				catch
				{
					return false;
				}				
			}
			catch 
			{ 
				return false; 
			}
		}
	}
}
