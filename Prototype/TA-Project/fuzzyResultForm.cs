using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TA_Project
{
    public partial class fuzzyResultForm : MetroFramework.Forms.MetroForm
    {
        public fuzzyResultForm(ref Double[,] V, int iter, int cltr, Double mpcScore)
        {
            InitializeComponent();
            iterationLabel.Text = "Total Iteration: " + iter;
            MPCLabel.Text = "MPC Score: " + String.Format("{0:0.00000000}",mpcScore);
            dataGridView1.ColumnCount = 4;
            dataGridView1.Columns[0].Name = "Cluster";
            dataGridView1.Columns[1].Name = "Recency Centroid";
            dataGridView1.Columns[2].Name = "Frequency Centroid";
            dataGridView1.Columns[3].Name = "Monetary Centroid";
            dataGridView1.Columns[0].Width = 30;
            dataGridView1.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView1.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView1.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            string[] row = new string[cltr];
            for (int k = 0; k < cltr; k++)
            {
                row = new string[] { (k+1).ToString(),V[k, 0].ToString(), V[k, 1].ToString(), V[k, 2].ToString() };
                dataGridView1.Rows.Add(row);
            }
            //dt.Rows.Add(DateTime.Now.AddDays(-1));
            //dt.Rows.Add(DateTime.Now.AddDays(1));
            //dt.Rows.Add(DateTime.Now.AddDays(2));
            //dt.Rows.Add(DateTime.Now.AddDays(-2));

            //dataGridView1.DataSource = dt;
            //dataGridView1.ColumnHeadersHeight = 25;
            //dataGridView1.Columns[0].HeaderText = "Iteration Counter";
            //dataGridView1.Columns[0].Width = 50;
            //dataGridView1.Columns[1].Width = 70;
            //dataGridView1.Columns[2].Width = 70;
            //dataGridView1.Columns[3].Width = 70;
            //dataGridView1.Columns[4].Width = 80;
            //dataGridView1.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            //dataGridView1.Columns[1].HeaderText = "Recency Centroid";
            //dataGridView1.Columns[2].HeaderText = "Frequency Centroid";
            //dataGridView1.Columns[3].HeaderText = "Monetary Centroid";
            //dataGridView1.Columns[4].HeaderText = "RFM Score";
            //dataGridView1.Columns[5].HeaderText = "Cluster Segment";
            //dataGridView1.Rows[0].Cells[0].Value = V[0, 0];
        }
    }
}
