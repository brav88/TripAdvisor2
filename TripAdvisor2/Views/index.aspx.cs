using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TripAdvisor2.Controllers;

namespace TripAdvisor2
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblName.InnerText = "John Doe";            

            ResortsController resortsController = new ResortsController();

            repResorts.DataSource = resortsController.GetResorts();
            repResorts.DataBind();            
        }

		protected void btnLogin_ServerClick(object sender, EventArgs e)
		{
            string email = txtEmail.Value;
			string pwd = txtPwd.Value;

            if(email == "brav88@hotmail.com")
            {
                if (pwd == "Admin$1234")
                {
					lblName.InnerText = "Braulio";
				}
            }
		}
	}
}