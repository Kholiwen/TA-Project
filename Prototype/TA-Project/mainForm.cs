﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ChartDirector;
//using scrollingText;

namespace TA_Project
{
    public partial class mainForm : MetroFramework.Forms.MetroForm
    {
        OleDbConnection oleCon;
        SqlConnection sqlCon;

        String oleConnectionString, query, sqlConn;

        public mainForm()
        {
            InitializeComponent();

            //private scrollingText.scrollingTextCtrl m_scrollingTextCtrl;

            ////Add these lines to your InitializeComponent() function call.
            //this.m_scrollingTextCtrl = new scrollingText.scrollingTextCtrl(); 
            ////
            //// m_scrollingTextCtrl
            ////
            //this.m_scrollingTextCtrl.scrollingTextColor1 = System.Drawing.Color.Crimson;
            //this.m_scrollingTextCtrl.scrollingTextColor2 = System.Drawing.Color.Gold;
            //this.m_scrollingTextCtrl.Location = new System.Drawing.Point(24, 264);
            //this.m_scrollingTextCtrl.Name = "m_scrollingTextCtrl";
            //this.m_scrollingTextCtrl.Size = new System.Drawing.Size(240, 32);
            //this.m_scrollingTextCtrl.TabIndex = 7;
            //this.m_scrollingTextCtrl.Text = "Welcome to Customer Segmentation System!";

            label1.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label2.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label3.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label4.Font = new Font("Tahoma", 11, FontStyle.Regular);
            metroComboBox1.SelectedIndex = 3;
            //DataTable _table = new DataTable();
            //_table.ReadXml(Application.StartupPath + @"\Data\test.xml");
            //metroGrid1.DataSource = _table;
            WinChartViewer wc = new WinChartViewer();
            createChart(winChartViewer1, 1);
            metroGrid1.Font = new Font("Segoe UI", 11f, FontStyle.Regular, GraphicsUnit.Pixel);

            //chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
        }
        public string getName() { return "3D Scatter Chart (1)"; }

        //Number of charts produced in this demo module
        public int getNoOfCharts() { return 1; }

        //Main code for creating chart.
        //Note: the argument chartIndex is unused because this demo only has 1 chart.
        public void createChart(WinChartViewer viewer, int chartIndex)
        {
            // The XYZ data for the 3D scatter chart as 3 random data series
            RanSeries r = new RanSeries(0);
            double[] xData = r.getSeries2(100, 100, -10, 10);
            double[] yData = r.getSeries2(100, 0, 0, 20);
            double[] zData = r.getSeries2(100, 100, -10, 10);

            // Create a ThreeDScatterChart object of size 720 x 600 pixels
            ThreeDScatterChart c = new ThreeDScatterChart(720, 600);

            // Add a title to the chart using 20 points Times New Roman Italic font
            c.addTitle("3D Scatter Chart (1)  ", "Times New Roman Italic", 20);

            // Set the center of the plot region at (350, 280), and set width x depth x height to
            // 360 x 360 x 270 pixels
            c.setPlotRegion(350, 280, 360, 360, 270);

            // Add a scatter group to the chart using 11 pixels glass sphere symbols, in which the
            // color depends on the z value of the symbol
            c.addScatterGroup(xData, yData, zData, "", Chart.GlassSphere2Shape, 11,
                Chart.SameAsMainColor);

            // Add a color axis (the legend) in which the left center is anchored at (645, 270). Set
            // the length to 200 pixels and the labels on the right side.
            c.setColorAxis(645, 270, Chart.Left, 200, Chart.Right);

            // Set the x, y and z axis titles using 10 points Arial Bold font
            c.xAxis().setTitle("X-Axis Place Holder", "Arial Bold", 10);
            c.yAxis().setTitle("Y-Axis Place Holder", "Arial Bold", 10);
            c.zAxis().setTitle("Z-Axis Place Holder", "Arial Bold", 10);

            // Output the chart
            viewer.Chart = c;

            //include tool tip for the chart
            viewer.ImageMap = c.getHTMLImageMap("clickable", "",
                "title='(x={x|p}, y={y|p}, z={z|p}'");
        }

        private void excelConn(string filePath)
        {
            oleConnectionString = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", filePath).ToString();
            oleCon = new OleDbConnection(oleConnectionString);

        }

        private void sqlConnection()
        {
            sqlConn = TA_Project.Properties.Settings.Default.CSSConnectionString;
            sqlCon = new SqlConnection(sqlConn);
        }

        private void insertExcelRecords(string filePath)
        {
            int result = 0;
            excelConn(filePath);
            query = string.Format("Select [Guest-Name],[Frequency],[Depart],[RmRate] FROM [{0}]", "Sheet1$");
            OleDbCommand Ecom = new OleDbCommand(query, oleCon);
            oleCon.Open();
            DataTable ds = new DataTable();
            OleDbDataAdapter oda = new OleDbDataAdapter(query, oleCon);
            oleCon.Close();
            oda.Fill(ds);
            var Exceldt = new DataTable();
            sqlConnection();
            sqlCon.Open();
            foreach (DataRow row in ds.Rows)
            {
                DataRow excelRecordsRow = ds.NewRow();
                using (SqlCommand sqlCmd = new SqlCommand("sp_INSERT", sqlCon))
                {
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = row[0];
                    sqlCmd.Parameters.Add("@FRQ", SqlDbType.Int).Value = row[1];
                    sqlCmd.Parameters.Add("@TOTAL", SqlDbType.Float).Value = row[3];
                    sqlCmd.Parameters.Add("@DT", SqlDbType.Date).Value = row[2];
                    result += sqlCmd.ExecuteNonQuery();
                }
            }
            MessageBox.Show(string.Format("{0} Rows have been affected", result), "Confirmation", MessageBoxButtons.OK, MessageBoxIcon.Information); //Show how many rows were affected
            //SqlBulkCopy objbulk = new SqlBulkCopy(sqlCon);
            ////assigning Destination table name    
            //objbulk.DestinationTableName = "dataTable";
            ////Mapping Table column    
            //objbulk.ColumnMappings.Add("Guest-Name", "Customer Name");
            //objbulk.ColumnMappings.Add("Frequency", "Frequency");
            //objbulk.ColumnMappings.Add("RmRate", "Total purchase");
            //objbulk.ColumnMappings.Add("Depart", "Last purchase");
            ////inserting Datatable Records to DataBase
            //objbulk.WriteToServer(Exceldt);
            sqlCon.Close();
            cSSDataSet.Reset();
            dataTableTableAdapter.Fill(this.cSSDataSet.dataTable);


        }

        private void metroRadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (metroRadioButton1.Checked == true)
            {
                metroTextBox1.Visible = true;
                metroButton2.Visible = true;
                metroLabel2.Visible = false;
            }
            else
            {
                metroTextBox1.Visible = false;
                metroButton2.Visible = false;
            }
        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            metroTabControl1.SelectTab(metroTabPage2);
        }

        private void mainForm_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'cSSDataSet1.custClass' table. You can move, or remove it, as needed.
            this.custClassTableAdapter.Fill(this.cSSDataSet1.custClass);
            // TODO: This line of code loads data into the 'cSSDataSet.dataTable' table. You can move, or remove it, as needed.
            this.dataTableTableAdapter.Fill(this.cSSDataSet.dataTable);
            // TODO: This line of code loads data into the 'cSSDataSet.dataTable' table. You can move, or remove it, as needed.
            // TODO: This line of code loads data into the 'cSSDataSet.dataTable' table. You can move, or remove it, as needed.
            //this.dataTableTableAdapter.Fill(this.cSSDataSet.dataTable);
            // TODO: This line of code loads data into the 'cSSDataSet1.dataTable' table. You can move, or remove it, as needed.

        }

        private void button1_Click(object sender, EventArgs e)
        {
            metroTabControl1.SelectTab(metroTabPage1);
        }

        private void metroButton2_Click(object sender, EventArgs e)
        {
            Stream myStream = null;
            OpenFileDialog openFileDialog1 = new OpenFileDialog();

            openFileDialog1.InitialDirectory = "c:\\";
            openFileDialog1.Filter = "txt files (*.txt)|*.txt|Excel Files (*.xls,*.xlsx)|*.xls;*.xlsx";
            openFileDialog1.FilterIndex = 2;
            openFileDialog1.RestoreDirectory = true;

            if (openFileDialog1.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    if ((myStream = openFileDialog1.OpenFile()) != null)
                    {
                        string directoryPath = openFileDialog1.FileName;
                        using (myStream)
                        {
                            // Insert code to read the stream here.
                        }
                        metroTextBox1.Text = directoryPath;
                        insertExcelRecords(directoryPath);
                    }
                    metroGrid1.Visible = true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
            }
        }

        private void metroTextBox1_ButtonClick(object sender, EventArgs e)
        {
            metroTextBox1.Clear();
        }

        private void metroButton3_Click(object sender, EventArgs e)
        {
            metroTabControl1.SelectTab(metroTabPage3);
        }

        private void metroComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (metroComboBox1.SelectedIndex == 0)
            {
                cSSDataSet1.Clear();
                SqlConnection myConnection;
                SqlCommand command = new SqlCommand();
                string connectionString = TA_Project.Properties.Settings.Default.CSSConnectionString;
                string query = "SELECT TOP 3 cType FROM custClass";
                myConnection = new SqlConnection(connectionString);
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = myConnection;
                custClassTableAdapter.ClearBeforeFill = true;
                custClassTableAdapter.Adapter.SelectCommand = command;
                custClassTableAdapter.Adapter.Fill(cSSDataSet1.custClass);
            }
            else if (metroComboBox1.SelectedIndex == 1)
            {
                cSSDataSet1.Clear();
                SqlConnection myConnection;
                SqlCommand command = new SqlCommand();
                string connectionString = TA_Project.Properties.Settings.Default.CSSConnectionString;
                string query = "SELECT TOP 4 cType FROM custClass";
                myConnection = new SqlConnection(connectionString);
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = myConnection;
                custClassTableAdapter.ClearBeforeFill = true;
                custClassTableAdapter.Adapter.SelectCommand = command;
                custClassTableAdapter.Adapter.Fill(cSSDataSet1.custClass);
            }
            else if (metroComboBox1.SelectedIndex == 2)
            {
                cSSDataSet1.Clear();
                SqlConnection myConnection;
                SqlCommand command = new SqlCommand();
                string connectionString = TA_Project.Properties.Settings.Default.CSSConnectionString;
                string query = "SELECT TOP 5 cType FROM custClass";
                myConnection = new SqlConnection(connectionString);
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = myConnection;
                custClassTableAdapter.ClearBeforeFill = true;
                custClassTableAdapter.Adapter.SelectCommand = command;
                custClassTableAdapter.Adapter.Fill(cSSDataSet1.custClass);
            }
            else if (metroComboBox1.SelectedIndex == 3)
            {
                cSSDataSet1.Clear();
                SqlConnection myConnection;
                SqlCommand command = new SqlCommand();
                string connectionString = TA_Project.Properties.Settings.Default.CSSConnectionString;
                string query = "SELECT TOP 6 cType FROM custClass";
                myConnection = new SqlConnection(connectionString);
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = myConnection;
                custClassTableAdapter.ClearBeforeFill = true;
                custClassTableAdapter.Adapter.SelectCommand = command;
                custClassTableAdapter.Adapter.Fill(cSSDataSet1.custClass);
            }
        }

        private void metroRadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            metroLabel2.Visible = false;
            metroGrid1.Visible = true;
            metroGrid1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            metroGrid1.CurrentCell = metroGrid1.Rows[0].Cells[0];
            metroGrid1.BeginEdit(true);
        }

        private void metroTrackBar1_ValueChanged(object sender, EventArgs e)
        {
            metroTrackBar1.Minimum = 10;
            metroTrackBar1.Maximum = 120;
            label5.Text = (System.Math.Round(metroTrackBar1.Value / 10.0)).ToString();
        }
    }
}
