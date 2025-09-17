using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISSD_TP4_DLP3_DAI5_clase06
{
    public partial class Vuelos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                DropDownList1.DataSource = SqlDataSource2;
                DropDownList1.DataTextField = "Nombre";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("Seleccione una Aerolinea", "0"));
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime fecha;
            if (DateTime.TryParse(TextBox1.Text, out fecha) && TextBox2.Text != string.Empty && DropDownList1.SelectedValue != "0" ) {
                SqlDataSource1.InsertParameters["fecha"].DefaultValue = TextBox1.Text;
                SqlDataSource1.InsertParameters["numeroVuelo"].DefaultValue = TextBox2.Text;
                SqlDataSource1.InsertParameters["idAerolinea"].DefaultValue = DropDownList1.SelectedValue;
                SqlDataSource1.Insert();
                GridView1.DataBind();
            }

            
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Select")
            {
                //int index = Convert.ToInt32(e.CommandArgument);
                //GridViewRow row = GridView1.Rows[index];
                
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            GridViewRow row = GridView1.SelectedRow;
            row.Cells[0].BackColor = System.Drawing.Color.DodgerBlue;
            row.Cells[1].BackColor = System.Drawing.Color.DodgerBlue;
            row.Cells[2].BackColor = System.Drawing.Color.DodgerBlue;
            row.Cells[3].BackColor = System.Drawing.Color.DodgerBlue;
            row.Cells[4].BackColor = System.Drawing.Color.DodgerBlue;
            int id = int.Parse(row.Cells[1].Text);
            var lblFecha = (Label)row.FindControl("Label2");
            var lblAerolinea = (Label)row.FindControl("lblAerolinea");
            int numeroVuelo = int.Parse(row.Cells[3].Text);
            DateTime fecha = DateTime.Parse(lblFecha.Text);
            string aerolinea = lblAerolinea.Text;

            Vuelo v = new Vuelo
            {
                id = id,
                fecha = fecha,
                numero = numeroVuelo,
                aerolinea = aerolinea
            };
            DetailsView1.DataSource = new List<Vuelo> { v };
            DetailsView1.DataBind();
            string js = $@"
                    Swal.fire({{
                          title: 'Detalle del Vuelo',
                          html: document.getElementById('{detalleVueloContainer.ClientID}').innerHTML,
                          icon: 'info',
                            }});";
            ScriptManager.RegisterStartupScript(this, GetType(), "alerta", js, true);
        }
    }
}