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
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();
        int i = 1, cltr = 0;
        Double totalPurchase;
        string query, query2, query3;
        private mainForm MainForm;

        public resultPage(mainForm frm)
        {
            InitializeComponent();
            this.MainForm = frm;
            dataGridView1.Focus();
            //for (int i = 0; i < k; i++)
            //{
            //    dataGridView1.Rows[i].Cells[4].Value = rfmv[i];
            //}
            sqlConnection();
            sqlCon.Open();
            query = "SELECT clusterIndex, recencyDOM, frequencyDOM, monetaryDOM, rfmScore, clusterSegment, segmentID from clusterResult";
            command = new SqlCommand(query, sqlCon);
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            sa.Fill(ds1, "clusterResult");
            sa.Fill(dt);
            dataGridView1.DataSource = ds1.Tables[0].DefaultView;
            cltr = dt.Rows.Count;
            dataGridView3.ColumnCount = 6;

            dataGridView3.Columns[0].Name = "Cluster";
            dataGridView3.Columns[1].Name = "Number of Customers";
            dataGridView3.Columns[2].Name = "Total Purchase Amount";
            dataGridView3.Columns[3].Name = "Highest Purchase";
            dataGridView3.Columns[4].Name = "Customer Name";
            dataGridView3.Columns[5].Name = "Percentage";
            dataGridView3.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView3.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView3.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView3.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView3.Columns[0].Width = 45;
            dataGridView3.Columns[4].MinimumWidth = 150;
            for (int k = 0; k < cltr; k++)
            {
                query2 = "SELECT CID, [Customer Name], Frequency, [Total Purchase], [Last Purchase] from [CSS].[dbo].customer where clusterIndex=" + (k + 1) + " ORDER BY [Total Purchase] DESC";
                query3 = "SELECT CID, [Customer Name], Frequency, [Total Purchase], [Last Purchase] from [CSS].[dbo].customer";
                command = new SqlCommand(query2, sqlCon);
                command.CommandText = query2;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                sa = new SqlDataAdapter(command);
                dt = new DataTable();
                sa.Fill(dt);

                command = new SqlCommand(query3, sqlCon);
                command.CommandText = query3;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                sa = new SqlDataAdapter(command);
                dt2 = new DataTable();
                sa.Fill(dt2);

                totalPurchase = 0;
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    totalPurchase += Convert.ToDouble(dt.Rows[j][3]);
                }
                dataGridView3.Rows.Add(k + 1, dt.Rows.Count, totalPurchase, dt.Rows[0][3], dt.Rows[0][1], (((float)dt.Rows.Count / (float)dt2.Rows.Count) * 100));
            }
            dataGridView3.Columns[1].DefaultCellStyle.Format = " ### 'customers'";
            dataGridView3.Columns[2].DefaultCellStyle.Format = "'Rp.' ###,###,###',-'";
            dataGridView3.Columns[3].DefaultCellStyle.Format = "'Rp.' ###,###,###',-'";
            dataGridView3.Columns[5].DefaultCellStyle.Format = "##.00'%'";
            query2 = "SELECT CID, [Customer Name], Frequency, [Total Purchase], [Last Purchase] from customer where clusterIndex=" + i;
            command = new SqlCommand(query2, sqlCon);
            command.CommandText = query2;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            ds2.Clear();
            sa.Fill(ds2, "customer");
            dataGridView2.DataSource = ds2.Tables[0].DefaultView;
            metroTabPage1.Text = "Customer List - " + ds1.Tables[0].Rows[i - 1][5];
            dataGridView1.Columns[5].MinimumWidth = 100;
            dataGridView1.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCellsExceptHeader;
            dataGridView1.Columns["segmentID"].Visible = false;
            dataGridView2.Columns[3].DefaultCellStyle.Format = "'Rp.' ###,###,###.00',-'";
            dataGridView2.Columns[4].DefaultCellStyle.Format = "dd MMM yyyy";
            dataGridView2.Columns[1].MinimumWidth = 225;
            dataGridView2.Columns[2].Width = 40;
            dataGridView2.Columns[3].MinimumWidth = 115;
            dataGridView2.Columns[0].Width= 50;
            dataGridView2.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView2.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView2.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView2.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView2.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
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
                dgvc.HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            }
            //dataGridView1.ColumnHeadersHeight = this.dataGridView1.ColumnHeadersHeight * 2;
            dataGridView1.ColumnHeadersHeight = 25;
            dataGridView1.Columns[0].HeaderText = "Cluster";
            dataGridView1.Columns[0].Width = 30;
            dataGridView1.Columns[1].Width = 60;
            dataGridView1.Columns[1].DefaultCellStyle.Format = "0.0######";
            dataGridView1.Columns[2].Width = 60;
            dataGridView1.Columns[2].DefaultCellStyle.Format = "0.0######";
            dataGridView1.Columns[3].Width = 60;
            dataGridView1.Columns[3].DefaultCellStyle.Format = "0.0######";
            dataGridView1.Columns[4].MinimumWidth = 85;
            dataGridView1.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView1.Columns[1].HeaderText = "Recency Score";
            dataGridView1.Columns[2].HeaderText = "Frequency Score";
            dataGridView1.Columns[3].HeaderText = "Monetary Score";
            dataGridView1.Columns[4].HeaderText = "RFM Score";
            dataGridView1.Columns[5].HeaderText = "Cluster Segment";
            this.metroTabControl1.SelectedTab = metroTabPage1;
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridView dgv = sender as DataGridView;
            if (dgv.Columns[e.ColumnIndex].Name == "Strategy link")
            {
                strategyViewForm svf = new strategyViewForm(Convert.ToInt32(dataGridView1.Rows[dataGridView1.CurrentCell.RowIndex].Cells[7].Value));
                svf.ShowDialog();
            }
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
            query2 = "SELECT CID, [Customer Name], Frequency, [Total Purchase], [Last Purchase] from customer where clusterIndex=" + i;
            command = new SqlCommand(query2, sqlCon);
            command.CommandText = query2;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            ds2.Clear();
            dt.Clear();
            sa.Fill(ds2, "customer");
            sa.Fill(dt);
            dataGridView2.DataSource = ds2.Tables[0].DefaultView;
            metroTabPage1.Text = "Customer List - " + ds1.Tables[0].Rows[i - 1][5];
            metroTabControl1.SelectedTab = metroTabPage1;
            sqlCon.Close();
        }

        private void backBtn_Click(object sender, EventArgs e)
        {
            //Application.Run(new mainForm());
            MainForm = new mainForm();
            MainForm.Show();
            Hide();
        }

        private void graphButton_Click(object sender, EventArgs e)
        {
            MainForm.Show();
            Hide();
        }

        private void dataGridView2_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            string custID = dataGridView2.Rows[dataGridView2.CurrentCell.RowIndex].Cells[0].Value.ToString();
            string custName = dataGridView2.Rows[dataGridView2.CurrentCell.RowIndex].Cells[1].Value.ToString();
            var custdetFrm = new customerDetail(custID);
            custdetFrm.Text = custName;
            custdetFrm.Show();
            custdetFrm.Focus();
        }

        private void resultPage_FormClosing(object sender, FormClosingEventArgs e)
        {
            System.Environment.Exit(1);
        }
    }
}
