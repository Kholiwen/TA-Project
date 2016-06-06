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
        int i = 1;
        string query = "SELECT * from clusterResult";
        string query2;

        public resultPage()
        {
            InitializeComponent();
            //for (int i = 0; i < k; i++)
            //{
            //    dataGridView1.Rows[i].Cells[4].Value = rfmv[i];
            //}
            sqlConnection();
            sqlCon.Open();
            command = new SqlCommand(query, sqlCon);
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            sa.Fill(ds1, "clusterResult");
            dataGridView1.DataSource = ds1.Tables[0].DefaultView;
            query2 = "SELECT CID, [Customer Name], Frequency, [Total Purchase], [Last Purchase] from processedTable where cluster=" + i;
            command = new SqlCommand(query2, sqlCon);
            command.CommandText = query2;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            ds2.Clear();
            sa.Fill(ds2, "processedTable");
            dataGridView2.DataSource = ds2.Tables[0].DefaultView;
            metroTabPage1.Text = "Customer List - " + ds1.Tables[0].Rows[i-1][5];
            DataGridViewLinkColumn dgvlc = new DataGridViewLinkColumn();
            dataGridView1.Columns.Add(dgvlc);
            dgvlc.HeaderText = "Strategy";
            dgvlc.Text = "View";
            dgvlc.Name = "Strategy link";
            dgvlc.UseColumnTextForLinkValue = true;
            sqlCon.Close();
            foreach (DataGridViewColumn dgvc in dataGridView1.Columns)
            {
                dgvc.SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvc.HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            }
            foreach (DataGridViewColumn dgvc in dataGridView2.Columns)
            {
                dgvc.SortMode = DataGridViewColumnSortMode.NotSortable;
                dgvc.HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            }
            dataGridView1.ColumnHeadersHeight = this.dataGridView1.ColumnHeadersHeight * 2;
            dataGridView1.ColumnHeadersHeight = 25;
            dataGridView1.Columns[0].HeaderText = "Cluster Index";
            dataGridView1.Columns[0].Width = 50;
            dataGridView1.Columns[1].Width = 70;
            dataGridView1.Columns[2].Width = 70;
            dataGridView1.Columns[3].Width = 70;
            dataGridView1.Columns[4].Width = 80;
            dataGridView1.Columns[1].HeaderText = "Recency Score";
            dataGridView1.Columns[2].HeaderText = "Frequency Score";
            dataGridView1.Columns[3].HeaderText = "Monetary Score";
            dataGridView1.Columns[4].HeaderText = "RFM Score";
            dataGridView1.Columns[5].HeaderText = "Cluster Segment";
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

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (!dataGridView1.Focused) return;
            i = dataGridView1.CurrentCell.RowIndex + 1;
            sqlCon.Open();
            query2 = "SELECT CID, [Customer Name], Frequency, [Total Purchase], [Last Purchase] from processedTable where cluster=" + i;
            command = new SqlCommand(query2, sqlCon);
            command.CommandText = query2;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            ds2.Clear();
            sa.Fill(ds2, "processedTable");
            dataGridView2.DataSource = ds2.Tables[0].DefaultView;
            metroTabPage1.Text = "Customer List - " + ds1.Tables[0].Rows[i-1][5];
            sqlCon.Close();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if (linkLabel1.Text == "Enable Sort")
            {
                foreach (DataGridViewColumn dgvc in dataGridView2.Columns)
                {
                    dgvc.SortMode = DataGridViewColumnSortMode.Automatic;
                    dgvc.HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
                }
                linkLabel1.Text = "Disable Sort";
            }
            else
            {
                foreach (DataGridViewColumn dgvc in dataGridView2.Columns)
                {
                    dgvc.SortMode = DataGridViewColumnSortMode.NotSortable;
                    dgvc.HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
                }
                linkLabel1.Text = "Enable Sort";
            }
        }

        private void nextBtn2_Click(object sender, EventArgs e)
        {
            Form frm = new mainForm();
            frm.Show();
            this.Close();
        }
    }
}
