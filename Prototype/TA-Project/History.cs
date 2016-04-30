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
            pictureScaleForm psf = new pictureScaleForm(new Size(Convert.ToInt32(criteriaPictureBox.Width * 1.5), Convert.ToInt32(criteriaPictureBox.Height * 1.5)), this.Location, dgvsc[0].Value.ToString());
            psf.ShowDialog();
        }
    }
}
