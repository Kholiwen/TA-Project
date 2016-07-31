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
    public partial class History : MetroFramework.Forms.MetroForm
    {
        SqlConnection sqlCon;
        SqlDataAdapter sa;
        SqlCommand command;
        DataTable dt;
        DataSet ds;
        String sqlConn, query, query2;
        DataGridViewSelectedCellCollection dgvsc;

        public History(DataGridViewSelectedCellCollection dgvsc)
        {
            InitializeComponent();
            metroLabel1.Text = "History - " + dgvsc[0].Value;
            this.dgvsc = dgvsc;
            query = "SELECT TOP 1 * FROM [CSS].[dbo].[historyIndex] order by historyID DESC";
            sqlConnection();
            sqlCon.Open();
            dt = new DataTable();
            command = new SqlCommand();
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            sa.Fill(dt);
            query2 = "SELECT [clusterIndex] ,[recencyCentroid],[frequencyCentroid],[monetaryCentroid],[recencyDOM],[frequencyDOM],[monetaryDOM],[rfmScore],[clusterSegment] from [CSS].[dbo].historyDetail where historyID ='" + dgvsc[0].Value.ToString() + "'";
            command = new SqlCommand(query2, sqlCon);
            command.CommandText = query2;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            ds = new DataSet();
            sa.Fill(ds, "history");
            historyDetailGrid.DataSource = ds.Tables[0].DefaultView;
            sqlCon.Close();

            historyDetailGrid.Columns[0].HeaderText = "Cluster";
            historyDetailGrid.Columns[1].HeaderText = "Recency Centroid";
            historyDetailGrid.Columns[2].HeaderText = "Frequency Centroid";
            historyDetailGrid.Columns[3].HeaderText = "Monetary Centroid";
            historyDetailGrid.Columns[4].HeaderText = "Recency DOM";
            historyDetailGrid.Columns[5].HeaderText = "Frequency DOM";
            historyDetailGrid.Columns[6].HeaderText = "Monetary DOM";
            historyDetailGrid.Columns[7].HeaderText = "RFM Score";
            historyDetailGrid.Columns[8].HeaderText = "Cluster Segment";
            historyDetailGrid.Columns[1].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            historyDetailGrid.Columns[2].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            historyDetailGrid.Columns[3].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            historyDetailGrid.Columns[4].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            historyDetailGrid.Columns[5].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            historyDetailGrid.Columns[6].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            historyDetailGrid.Columns[7].HeaderCell.Style.Alignment = DataGridViewContentAlignment.MiddleCenter;
            historyDetailGrid.Columns[1].DefaultCellStyle.Format = "0.0#####";
            historyDetailGrid.Columns[2].DefaultCellStyle.Format = "0.0#####";
            historyDetailGrid.Columns[3].DefaultCellStyle.Format = "0.0#####";
            historyDetailGrid.Columns[4].DefaultCellStyle.Format = "0.0#####";
            historyDetailGrid.Columns[5].DefaultCellStyle.Format = "0.0#####";
            historyDetailGrid.Columns[6].DefaultCellStyle.Format = "0.0#####";
            historyDetailGrid.Columns[7].DefaultCellStyle.Format = "0.0#####";
            historyDetailGrid.Columns[0].Width = 35;
            historyDetailGrid.Columns[1].Width = 60;
            historyDetailGrid.Columns[2].Width = 60;
            historyDetailGrid.Columns[3].Width = 60;
            historyDetailGrid.Columns[4].Width = 60;
            historyDetailGrid.Columns[5].Width = 60;
            historyDetailGrid.Columns[6].Width = 60;
            historyDetailGrid.Columns[7].Width = 70;
            historyDetailGrid.Columns[8].MinimumWidth = 100;
            historyDetailGrid.Columns[8].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            string criteriaFilePath = "../screenshot/" + dgvsc[0].Value.ToString() + "_Criteria.jpg";
            criteriaPictureBox.ImageLocation = criteriaFilePath;
            string chartFilePath = "../screenshot/" + dgvsc[0].Value.ToString() + "_Chart.jpg";
            chartPictureBox.ImageLocation = chartFilePath;
        }

        private void sqlConnection()
        {
            sqlConn = TA_Project.Properties.Settings.Default.CSSConnectionString;
            sqlCon = new SqlConnection(sqlConn);
        }

        private void criteriaPictureBox_Click(object sender, EventArgs e)
        {
            pictureScaleForm psf = new pictureScaleForm(new Size(Convert.ToInt32(criteriaPictureBox.Width * 1.5), Convert.ToInt32(criteriaPictureBox.Height * 1.5)), this.Location, dgvsc[0].Value.ToString(),"criteria");
            psf.ShowDialog();
        }

        private void chartPictureBox_Click(object sender, EventArgs e)
        {
            pictureScaleForm psf = new pictureScaleForm(new Size(Convert.ToInt32(chartPictureBox.Width * 1.5), Convert.ToInt32(chartPictureBox.Height * 1.5)), this.Location, dgvsc[0].Value.ToString(),"chart");
            psf.ShowDialog();
        }
    }
}
