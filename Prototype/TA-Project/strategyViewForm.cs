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
    public partial class strategyViewForm : MetroFramework.Forms.MetroForm
    {
        SqlConnection sqlCon;
        SqlDataAdapter sa;
        SqlCommand command;
        DataTable dt;
        String query, sqlConn;
        public strategyViewForm(int custSeg)
        {
            InitializeComponent();
            command = new SqlCommand();
            query = "SELECT * FROM [CSS].[dbo].[segmentStrategy] where segmentID="+custSeg;
            sqlConnection();
            sqlCon.Open();
            dt = new DataTable();
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            sa.Fill(dt);
            string[] strategy = new string[1];
            strategy = dt.Rows[0][2].ToString().Split('|');
            metroLabel1.Text = "Strategy - " + dt.Rows[0][1].ToString() + " Customer";
            //listView1.Items.Add("Strategy Item");
            for (int i = 0; i < strategy.Length; i++)
            {
                listView1.Items.Add("• "+strategy[i]);
            }
            listView1.Items.Add("• Send promotion catalog monthly");
            sqlCon.Close();
            closeBtn.Focus();
        }
        private void sqlConnection()
        {
            sqlConn = TA_Project.Properties.Settings.Default.CSSConnectionString;
            sqlCon = new SqlConnection(sqlConn);
        }

        private void closeBtn_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void strategyViewForm_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Escape)
            {
                this.Hide();
            }
        }
    }
}
