using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TripAdvisor2.Controllers;
using TripAdvisor2.Model;

namespace TripAdvisor2
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			if (Session["email"] != null)
			{
				showWelcome();
			}

			ResortsController resortsController = new ResortsController();
			List<Resort> resorts = resortsController.GetResorts();

			Session["resorts"] = resorts;
			repResorts.DataSource = resorts;
			repResorts.DataBind();
		}

		protected void btnLogin_ServerClick(object sender, EventArgs e)
		{
            if (!string.IsNullOrEmpty(txtEmail.Value) && !string.IsNullOrEmpty(txtPwd.Value))
            {
				if (Firebase.Authentication.signInWithPassword(true, txtEmail.Value, txtPwd.Value))
				{
					Session["email"] = txtEmail.Value;
					showWelcome();
				}
				else
				{
					//Error
				}
			}
		}

		public void showWelcome()
		{
			divLogin.Attributes.Add("hidden", "hidden");
			divUserLogged.Attributes.Remove("hidden");
			divWelcome.Attributes.Remove("hidden");
			lblName.InnerText = txtEmail.Value;
		}

		protected void actionLogout_ServerClick(object sender, EventArgs e)
		{
			Session.Clear();
			Response.Redirect("index.aspx");
		}
	}
}