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

namespace TA_Project
{
    public partial class resultPage : MetroFramework.Forms.MetroForm
    {
        SqlConnection sqlCon;
        SqlCommand command;
        SqlDataAdapter sa;
        string sqlConn;
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();

        public resultPage()
        {
            InitializeComponent();

            //for (int i = 0; i < k; i++)
            //{
            //    dataGridView1.Rows[i].Cells[4].Value = rfmv[i];
            //}
            sqlConnection();
            sqlCon.Open();
            string query = "SELECT * from clusterResult";
            string query2 = "SELECT * from dataTable";
            command = new SqlCommand(query, sqlCon);
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            sa.Fill(ds1, "clusterResult");
            dataGridView1.DataSource = ds1.Tables[0].DefaultView;
            command = new SqlCommand(query2, sqlCon);
            command.CommandText = query2;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            ds2.Clear();
            sa.Fill(ds2,"dataTable");
            dataGridView2.DataSource = ds2.Tables[0].DefaultView;
            sqlCon.Close();
        }
        private void sqlConnection()
        {
            sqlConn = TA_Project.Properties.Settings.Default.CSSConnectionString;
            sqlCon = new SqlConnection(sqlConn);
        }
        private void resultPage_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'cSSDataSet2.clusterResult' table. You can move, or remove it, as needed
        }
    }
}
