using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace TA_Project
{
    public partial class customerDetail : MetroFramework.Forms.MetroForm
    {
        SqlConnection sqlCon;
        SqlDataAdapter sa;
        String sqlConn;
        DataSet ds;

        public customerDetail(string custID)
        {
            InitializeComponent();
            this.Text = custID;
            sqlConnection();
            sa = new SqlDataAdapter("SELECT TID, customerName, purchaseAmount, purchaseDate FROM [transaction] where CID='"+custID+"'",sqlCon);
            metroGrid1.Focus();
            // Create an instance of a DataSet, and retrieve data from the Authors table.
            ds = new DataSet("Customer Details");
            //sa.FillSchema(ds, SchemaType.Source, "Customer Details");
            sa.Fill(ds, "Customer Details");
        }

        private void sqlConnection()
        {
            sqlConn = TA_Project.Properties.Settings.Default.CSSConnectionString;
            sqlCon = new SqlConnection(sqlConn);
        }

        private void customerDetail_Load(object sender, EventArgs e)
        {
            metroGrid1.AutoGenerateColumns = true;
            metroGrid1.DataSource = ds.Tables[0];
            metroGrid1.Columns[2].DefaultCellStyle.Format = "'Rp.' ###,###,###.00',-'";
            metroGrid1.Columns[3].DefaultCellStyle.Format = "dd MMM yyyy";
            metroGrid1.Columns[1].MinimumWidth = 200;
            metroGrid1.Columns[2].MinimumWidth = 110;
        }

        private void customerDetail_Deactivate(object sender, EventArgs e)
        {
            this.Close();
        }

        private void customerDetail_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Escape)
            {
                this.Hide();
            }
        }
    }
}
