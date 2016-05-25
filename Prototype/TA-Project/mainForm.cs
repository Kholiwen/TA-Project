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
using System.Threading;

namespace TA_Project
{
    public partial class mainForm : MetroFramework.Forms.MetroForm
    {
        int a = 20;
        string directoryPath = "";
        OleDbConnection oleCon;
        SqlConnection sqlCon;
        SqlDataAdapter sa;
        SqlCommand command;
        String olesqlConn, excelQuery, sqlConn;
        DataRow excelRecordsRow;
        DataTable ds;
        int result = 0;

        public mainForm()
        {
            InitializeComponent();
            label1.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label3.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label4.Font = new Font("Tahoma", 11, FontStyle.Regular);
            WinChartViewer wc = new WinChartViewer();
            createChart(winChartViewer1, 1, a);
            metroGrid1.Font = new Font("Segoe UI", 11f, FontStyle.Regular, GraphicsUnit.Pixel);
            metroPanel2.Visible = false;
            metroPanel3.Visible = false;
            browseBtn.Focus();

            string delQuery = "delete prepTable delete dataTable";
            sqlConnection();
            sqlCon.Open();
            command = new SqlCommand(delQuery, sqlCon);
            command.CommandText = delQuery;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            command.ExecuteNonQuery();
        }
        public string getName() { return "3D Scatter Chart (1)"; }

        //Number of charts produced
        public int getNoOfCharts() { return 1; }

        //Main code for creating chart.
        public void createChart(WinChartViewer viewer, int chartIndex, int a)
        {
            this.a = a;

            // The random XYZ data for the first 3D scatter group
            RanSeries r0 = new RanSeries(7);
            double[] xData0 = r0.getSeries2(a, 100, -10, 10);
            double[] yData0 = r0.getSeries2(a, 0, 0, 20);
            double[] zData0 = r0.getSeries2(a, 100, -10, 10);

            // The random XYZ data for the second 3D scatter group
            RanSeries r1 = new RanSeries(4);
            double[] xData1 = r1.getSeries2(100, 100, -10, 10);
            double[] yData1 = r1.getSeries2(100, 0, 0, 20);
            double[] zData1 = r1.getSeries2(100, 100, -10, 10);

            // The random XYZ data for the third 3D scatter group
            RanSeries r2 = new RanSeries(8);
            double[] xData2 = r2.getSeries2(100, 100, -10, 10);
            double[] yData2 = r2.getSeries2(100, 0, 0, 20);
            double[] zData2 = r2.getSeries2(100, 100, -10, 10);


            // Create a ThreeDScatterChart object of size 720 x 600 pixels
            ThreeDScatterChart c = new ThreeDScatterChart(720, 600);

            // Add a title to the chart using 20 points Times New Roman Italic font
            c.addTitle("3D Scatter Chart", "Times New Roman Italic", 20);

            // Set the center of the plot region at (350, 280), and set width x depth x height to
            // 360 x 360 x 270 pixels
            c.setPlotRegion(350, 280, 360, 360, 270);

            // Set the elevation and rotation angles to 15 and 30 degrees
            c.setViewAngle(15, 30);

            // Add a legend box at (640, 180)
            c.addLegend(600, 180);

            // Add 3 scatter groups to the chart with 9 pixels glass sphere symbols of red (ff0000), green
            // (00ff00) and blue (0000ff) colors
            c.addScatterGroup(xData0, yData0, zData0, "1st Cluster", Chart.GlassSphere2Shape, 9, 0xff0000);
            c.addScatterGroup(xData1, yData1, zData1, "2nd Cluster", Chart.GlassSphere2Shape, 9, 0x00ff00);
            c.addScatterGroup(xData2, yData2, zData2, "3rd Cluster", Chart.GlassSphere2Shape, 9, 0x0000ff);

            // Output the chart
            viewer.Chart = c;

            // Set the x, y and z axis titles
            c.xAxis().setTitle("X-Axis Place Holder");
            c.yAxis().setTitle("Y-Axis Place Holder");
            c.zAxis().setTitle("Z-Axis Place Holder");

            //include tool tip for the chart
            viewer.ImageMap = c.getHTMLImageMap("clickable", "",
                "title='(x={x|p}, y={y|p}, z={z|p}'");
        }

        private void excelConn(string filePath)
        {
            olesqlConn = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", filePath).ToString();
            oleCon = new OleDbConnection(olesqlConn);
        }

        private void sqlConnection()
        {
            sqlConn = TA_Project.Properties.Settings.Default.CSSConnectionString;
            sqlCon = new SqlConnection(sqlConn);
        }

        private void insertExcelRecords(string filePath)
        {
            result = 0;
            excelConn(filePath);
            excelQuery = string.Format("Select [Customer-Name],[Frequency],[Last-Purchase],[Total-Purchase] FROM [{0}]", "Sheet1$");
            string copyQuery = "delete preptable INSERT prepTable SELECT * FROM dataTable";
            sqlConnection();
            sqlCon.Open();
            command = new SqlCommand(copyQuery, sqlCon);
            command.CommandText = copyQuery;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            oleCon.Open();
            ds = new DataTable();
            OleDbDataAdapter oda = new OleDbDataAdapter(excelQuery, oleCon);
            oleCon.Close();
            oda.Fill(ds);
            foreach (DataRow row in ds.Rows)
            {
                excelRecordsRow = ds.NewRow();
                using (SqlCommand sqlCmd = new SqlCommand("sp_INSERT", sqlCon))
                {
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = row[0];
                    sqlCmd.Parameters.Add("@FRQ", SqlDbType.Int).Value = row[1];
                    sqlCmd.Parameters.Add("@TOTAL", SqlDbType.Float).Value = row[3];
                    sqlCmd.Parameters.Add("@DT", SqlDbType.Date).Value = row[2];
                    sqlCmd.Parameters.Add("@CL", SqlDbType.Int).Value = 0;
                    sqlCmd.Parameters.Add("@SGMT", SqlDbType.VarChar).Value = "";
                    result += sqlCmd.ExecuteNonQuery();
                }
            }
            command.ExecuteNonQuery();
            MessageBox.Show(string.Format("{0} Rows have been affected", result), "Confirmation", MessageBoxButtons.OK, MessageBoxIcon.Information); //Show how many rows were affected
            sqlCon.Close();
            cSSDataSet.Reset();
            dataTableTableAdapter.Fill(this.cSSDataSet.dataTable);
        }

        private void metroRadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (batchRadioButton.Checked == true)
            {
                fileTextBox.Visible = true;
                browseBtn.Visible = true;
                welcomeLbl.Visible = false;
            }
            else
            {
                fileTextBox.Visible = false;
                browseBtn.Visible = false;
            }
        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            metroPanel1.Visible = false;
            metroLabel3.Text = "Clustering Options";
            metroPanel2.Visible = true;
            metroPanel3.Visible = false;
            processBtn.Focus();
        }

        private void mainForm_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'cSSDataSet1.custClass' table. You can move, or remove it, as needed.
            this.custClassTableAdapter.Fill(this.cSSDataSet1.custClass);
            // TODO: This line of code loads data into the 'cSSDataSet.dataTable' table. You can move, or remove it, as needed.
            this.dataTableTableAdapter.Fill(this.cSSDataSet.dataTable);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            metroPanel1.Visible = true;
            metroLabel3.Text = "Data Input";
            metroPanel2.Visible = false;
            metroPanel3.Visible = false;
        }

        private void metroButton2_Click(object sender, EventArgs e)
        {
            if (browseBtn.Text == "Browse..")
            {
                OpenFileDialog openFileDialog1 = new OpenFileDialog();
                openFileDialog1.ShowDialog();
                openFileDialog1.Filter = "txt files (*.txt)|*.txt|Excel Files (*.xls,*.xlsx)|*.xls;*.xlsx";
                openFileDialog1.FilterIndex = 2;
                openFileDialog1.RestoreDirectory = true;
                directoryPath = openFileDialog1.FileName;
                fileTextBox.Text = directoryPath;
                browseBtn.Text = "OK";
            }
            else if (browseBtn.Text == "OK")
            {
                try
                {
                    if (fileTextBox.Text != "")
                    {
                        insertExcelRecords(directoryPath);
                    }
                    metroGrid1.Visible = true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: Could not read file from disk. Original error: " + ex.Message);
                }
                fileTextBox.Text = "";
                browseBtn.Text = "Browse..";
            }
        }

        private void metroTextBox1_ButtonClick(object sender, EventArgs e)
        {
            fileTextBox.Clear();
        }

        // This method will be called when the thread is started. 
        public void DoWork()
        {
            while (!_shouldStop)
            {
                Console.WriteLine("worker thread: working...");
                createChart(winChartViewer1, 1, a);
                a += 20;
            }
            Console.WriteLine("worker thread: terminating gracefully.");
        }
        public void RequestStop()
        {
            _shouldStop = true;
        }
        // Volatile is used as hint to the compiler that this data 
        // member will be accessed by multiple threads. 
        private volatile bool _shouldStop;

        public void chartThread()
        {

            // Create the thread object. This does not start the thread.
            Thread workerThread = new Thread(new System.Threading.ThreadStart(DoWork));

            // Start the worker thread.
            workerThread.Start();
            Console.WriteLine("main thread: Starting worker thread...");

            // Loop until worker thread activates. 
            while (!workerThread.IsAlive) ;

            // Put the main thread to sleep for 1 millisecond to 
            // allow the worker thread to do some work:
            Thread.Sleep(1000);

            // Request that the worker thread stop itself:
            RequestStop();

            // Use the Join method to block the current thread  
            // until the object's thread terminates.
            workerThread.Join();
            Console.WriteLine("main thread: Worker thread has terminated.");
        }

        private void metroButton3_Click(object sender, EventArgs e)
        {
            int cltr = 0;
            int w = 2;
            int maxIter = 100;
            double tc = 0.00001;
            double[] P = new double[maxIter];
            P[0] = 0;
            cltr = Decimal.ToInt32(clusterSizeNUD.Value);
            double[,] V = new double[cltr, 3];
            int ctr = 1;
            Random rnd = new Random();

            command = new SqlCommand();
            string query = "SELECT * FROM dataTable";
            sqlConnection();
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sa.Fill(dt);
            int[] custCltr = new int[dt.Rows.Count];
            double[,] r = new double[cltr, 2];
            double[,] f = new double[cltr, 2];
            double[,] m = new double[cltr, 2];
            string[] rfmv;

            Dictionary<string, string> rfmd
                   = new Dictionary<string, string>{
                {"000","Dormant Customer 18"},{"010","Dormant Customer 12"},{"020","Dormant Customer 6"},{"030","Dormant Customer 3"},
                {"001","Dormant Customer 17"},{"011","Dormant Customer 11"},{"021","Dormant Customer 5"},{"031","Dormant Customer 2"},
                {"002","Dormant Customer 16"},{"012","Dormant Customer 10"},{"022","Dormant Customer 4"},{"032","Dormant Customer 1"},
                {"003","Occasional Customer 14"},{"013","Occasional Customer 13"},{"023","Golden Customer 8"},{"033","Golden Customer 7"},
                {"004","Occasional Customer 12"},{"014","Occasional Customer 11"},{"024","Superstar 8"},{"034","Superstar 7"},
                {"100","Dormant Customer 15"},{"110","Dormant Customer 9"},{"120","Everyday Shopper 18"},{"130","Everyday Shopper 17"},
                {"101","Dormant Customer 14"},{"111","Dormant Customer 8"},{"121","Everyday Shopper 16"},{"131","Everyday Shopper 15"},
                {"102","Dormant Customer 13"},{"112","Dormant Customer 7"},{"122","Everyday Shopper 14"},{"132","Everyday Shopper 13"},
                {"103","Occasional Customer 10"},{"113","Occasional Customer 9"},{"123","Golden Customer 6"},{"133","Golden Customer 5"},
                {"104","Occasional Customer 8"},{"114","Occasional Customer 7"},{"124","Superstar 6"},{"134","Superstar 5"},
                {"200","Typical Customer 14"},{"210","Typical Customer 13"},{"220","Everyday Shopper 12"},{"230","Everyday Shopper 11"},
                {"201","Typical Customer 12"},{"211","Typical Customer 11"},{"221","Everyday Shopper 10"},{"231","Everyday Shopper 9"},
                {"202","Occasional Customer 6"},{"212","Occasional Customer 5"},{"222","Everyday Shopper 8"},{"232","Everyday Shopper 7"},
                {"203","Occasional Customer 4"},{"213","Occasional Customer 3"},{"223","Golden Customer 4"},{"233","Golden Customer 3"},
                {"204","Occasional Customer 2"},{"214","Occasional Customer 1"},{"224","Superstar 4"},{"234","Superstar 3"},
                {"300","Typical Customer 10"},{"310","Typical Customer 9"},{"320","Everyday Shopper 6"},{"330","Everyday Shopper 5"},
                {"301","Typical Customer 8"},{"311","Typical Customer 7"},{"321","Everyday Shopper 4"},{"331","Everyday Shopper 3"},
                {"302","Typical Customer 6"},{"312","Typical Customer 5"},{"322","Everyday Shopper 2"},{"332","Everyday Shopper 1"},
                {"303","Typical Customer 4"},{"313","Typical Customer 3"},{"323","Golden Customer 2"},{"333","Golden Customer 1"},
                {"304","Typical Customer 2"},{"314","Typical Customer 1"},{"324","Superstar 2"},{"334","Superstar 1"},};

            //RFM criteria value input to array\\
            int[,] rfmc = new int[3, 8];
            rfmc[0, 0] = Convert.ToInt32(recQLTlow.Text);
            rfmc[0, 1] = Convert.ToInt32(recRCNThigh.Text);
            rfmc[0, 2] = Convert.ToInt32(recLTlow.Text);
            rfmc[0, 3] = Convert.ToInt32(recQLThigh.Text);
            rfmc[0, 4] = Convert.ToInt32(recLTA.Text);
            rfmc[0, 5] = Convert.ToInt32(recLThigh.Text);

            rfmc[1, 0] = Convert.ToInt32(freRlow.Text);
            rfmc[1, 1] = Convert.ToInt32(freVRhigh.Text);
            rfmc[1, 2] = Convert.ToInt32(freOlow.Text);
            rfmc[1, 3] = Convert.ToInt32(freRhigh.Text);
            rfmc[1, 4] = Convert.ToInt32(freVO.Text);
            rfmc[1, 5] = Convert.ToInt32(freOhigh.Text);

            rfmc[2, 0] = Convert.ToInt32(monLlow.Text + "000000");
            rfmc[2, 1] = Convert.ToInt32(monVLhigh.Text + "000000");
            rfmc[2, 2] = Convert.ToInt32(monMlow.Text + "000000");
            rfmc[2, 3] = Convert.ToInt32(monLhigh.Text + "000000");
            rfmc[2, 4] = Convert.ToInt32(monHlow.Text + "000000");
            rfmc[2, 5] = Convert.ToInt32(monMhigh.Text + "000000");
            rfmc[2, 6] = Convert.ToInt32(monVH.Text + "000000");
            rfmc[2, 7] = Convert.ToInt32(monHhigh.Text + "000000");

            //Random number generation\\
            double[,] u = new double[dt.Rows.Count, cltr];
            for (int k = 0; k < cltr; k++)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    u[i, k] = rnd.NextDouble();
                }
            }

            //Data input\\
            double[,] X = new double[dt.Rows.Count, 3];
            foreach (DataRow dr in dt.Rows)
            {
                X[dt.Rows.IndexOf(dr), 0] = Convert.ToInt32((DateTime.Now - Convert.ToDateTime(dr["Last purchase"])).TotalDays);
                X[dt.Rows.IndexOf(dr), 1] = Convert.ToInt32(dr["Frequency"]);
                X[dt.Rows.IndexOf(dr), 2] = Convert.ToInt64(dr["Total purchase"]);

            }

            //Fuzzy C-Means Method\\
            double temp1 = 0, temp2 = 0, temp3 = 0, temp4 = 0, temp5 = 0, temp6 = 0, temp7 = 0, temp8 = 0, temp9 = 0, temp10 = 0;
            do
            {
                for (int k = 0; k < cltr; k++)
                {
                    for (int j = 0; j < 3; j++)
                    {
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            temp1 += Math.Pow(u[i, k], w);
                            temp2 += Math.Pow(u[i, k], w) * X[i, j];
                        }
                        V[k, j] = temp2 / temp1;
                        temp1 = 0;
                        temp2 = 0;
                    }
                }

                //Objective Function
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int k = 0; k < cltr; k++)
                    {
                        for (int j = 0; j < 3; j++)
                        {
                            temp3 += Math.Pow(X[i, j] - V[k, j], w);
                        }
                        temp4 += temp3 * Math.Pow(u[i, k], 2);
                        temp3 = 0;
                    }
                }
                P[ctr] += temp4;
                temp4 = 0;

                //Membership degree\\

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int k = 0; k < cltr; k++)
                    {
                        for (int k2 = 0; k2 < cltr; k2++)
                        {
                            for (int j = 0; j < 3; j++)
                            {
                                temp5 += Math.Pow(X[i, j] - V[k, j], w);
                                temp6 += Math.Pow(X[i, j] - V[k2, j], w);
                                //Y[i, 0] = dt2.Rows[i][0].ToString();
                            }
                            temp7 = Math.Pow(temp5, -1);
                            temp8 = Math.Pow(temp6, -1);
                            temp9 += temp8;
                            temp5 = 0;
                            temp6 = 0;
                        }
                        u[i, k] = temp7 / temp9;
                        if (temp10 < u[i, k])
                        {
                            temp10 = u[i, k];
                            custCltr[i] = k;
                        }
                        temp7 = 0;
                        temp8 = 0;
                        temp9 = 0;
                    }
                    temp10 = 0;
                }
                ctr++;
            } while (ctr < maxIter && Math.Abs((P[ctr - 1] - P[ctr - 2])) > tc);

            //Fuzzy RFM Method\\
            double[] rfm = new double[cltr];
            double[] temp = new double[2];
            double g = 0.5;
            string[] rfmvalue = new string[cltr];

            for (int k = 0; k < cltr; k++)
            {
                rfm[k] = 1;
                for (int j = 0; j < 3; j++)
                {
                    if (j == 0)
                    {
                        for (int i = 0; i < 4; i++)
                        {
                            if (i == 0)
                            {
                                temp[0] = downlinearValue(V[k, j], rfmc[j, 0], rfmc[j, 1]);
                                temp[1] = 3;
                            }
                            else if (i == 1)
                            {
                                temp2 = trapValue(V[k, j], rfmc[j, 0], rfmc[j, 1], rfmc[j, 2], rfmc[j, 3]);
                                if (temp2 > temp[0])
                                {
                                    temp[0] = temp2;
                                    temp[1] = 2;
                                }
                            }
                            else if (i == 2)
                            {
                                temp3 = trapValue(V[k, j], rfmc[j, 2], rfmc[j, 3], rfmc[j, 4], rfmc[j, 5]);
                                if (temp3 > temp[0])
                                {
                                    temp[0] = temp3;
                                    temp[1] = 1;
                                }
                            }
                            else if (i == 3)
                            {
                                temp4 = uplinearValue(V[k, j], rfmc[j, 4], rfmc[j, 5]);
                                if (temp4 > temp[0])
                                {
                                    temp[0] = temp4;
                                    temp[1] = 0;
                                }
                            }
                        }
                        r[k, 0] = temp[0];
                        r[k, 1] = temp[1];
                        temp[0] = 0;
                    }

                    else if (j == 1)
                    {
                        for (int i = 0; i < 4; i++)
                        {
                            if (i == 0)
                            {
                                temp[0] = downlinearValue(V[k, j], rfmc[j, 0], rfmc[j, 1]);
                                temp[1] = i;
                            }
                            else if (i == 1)
                            {
                                temp2 = trapValue(V[k, j], rfmc[j, 0], rfmc[j, 1], rfmc[j, 2], rfmc[j, 3]);
                                if (temp2 > temp[0])
                                {
                                    temp[0] = temp2;
                                    temp[1] = i;
                                }
                            }
                            else if (i == 2)
                            {
                                temp3 = trapValue(V[k, j], rfmc[j, 2], rfmc[j, 3], rfmc[j, 4], rfmc[j, 5]);
                                if (temp3 > temp[0])
                                {
                                    temp[0] = temp3;
                                    temp[1] = i;
                                }
                            }
                            else if (i == 3)
                            {
                                temp4 = uplinearValue(V[k, j], rfmc[j, 4], rfmc[j, 5]);
                                if (temp4 > temp[0])
                                {
                                    temp[0] = temp4;
                                    temp[1] = i;
                                }
                            }
                        }
                        f[k, 0] = temp[0];
                        f[k, 1] = temp[1];
                        temp[0] = 0;
                    }
                    else if (j == 2)
                    {
                        for (int i = 0; i < 5; i++)
                        {
                            if (i == 0)
                            {
                                temp[0] = downlinearValue(V[k, j], rfmc[j, 0], rfmc[j, 1]);
                            }
                            if (i == 1)
                            {
                                temp2 = trapValue(V[k, j], rfmc[j, 0], rfmc[j, 1], rfmc[j, 2], rfmc[j, 3]);
                                if (temp2 > temp[0])
                                {
                                    temp[0] = temp2;
                                    temp[1] = i;
                                }
                            }
                            else if (i == 2)
                            {
                                temp3 = trapValue(V[k, j], rfmc[j, 2], rfmc[j, 3], rfmc[j, 4], rfmc[j, 5]);
                                if (temp3 > temp[0])
                                {
                                    temp[0] = temp3;
                                    temp[1] = i;
                                }
                            }
                            else if (i == 3)
                            {
                                temp4 = trapValue(V[k, j], rfmc[j, 4], rfmc[j, 5], rfmc[j, 6], rfmc[j, 7]);
                                if (temp4 > temp[0])
                                {
                                    temp[0] = temp4;
                                    temp[1] = i;
                                }
                            }
                            else if (i == 4)
                            {
                                temp5 = uplinearValue(V[k, j], rfmc[j, 6], rfmc[j, 7]);
                                if (temp5 > temp[0])
                                {
                                    temp[0] = temp5;
                                    temp[1] = i;
                                }
                            }
                        }
                        m[k, 0] = temp[0];
                        m[k, 1] = temp[1];
                        temp[0] = 0;
                    }
                    rfm[k] = Math.Pow((r[k, 0] * f[k, 0] * m[k, 0]), 1 - g) * Math.Pow(1 - (((1 - r[k, 0]) * (1 - f[k, 0]) * (1 - m[k, 0]))), 0.5);
                    rfmvalue[k] = r[k, 1].ToString() + f[k, 1].ToString() + m[k, 1].ToString();
                }
            }

            rfmv = new string[cltr];
            {
                for (int i = 0; i < cltr; i++)
                {
                    rfmv[i] = rfmd[r[i, 1].ToString() + f[i, 1].ToString() + m[i, 1].ToString()];
                }
            }

            sqlConnection();
            sqlCon.Open();
            query = "delete dataTable";
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            command = new SqlCommand(query, sqlCon);
            command.ExecuteNonQuery();
            query = "select * from prepTable";
            command.CommandText = query;
            sa = new SqlDataAdapter(command);
            command = new SqlCommand(query, sqlCon);
            dt.Clear();
            sa.Fill(dt);
            foreach (DataRow row in dt.Rows)
            {
                excelRecordsRow = dt.NewRow();
                using (SqlCommand sqlCmd = new SqlCommand("sp_INSERT", sqlCon))
                {
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = row[1];
                    sqlCmd.Parameters.Add("@FRQ", SqlDbType.Int).Value = row[2];
                    sqlCmd.Parameters.Add("@TOTAL", SqlDbType.Float).Value = row[3];
                    sqlCmd.Parameters.Add("@DT", SqlDbType.Date).Value = row[4];
                    sqlCmd.Parameters.Add("@CL", SqlDbType.Int).Value = custCltr[dt.Rows.IndexOf(row)]+1;
                    sqlCmd.Parameters.Add("@SGMT", SqlDbType.VarChar).Value = rfmv[custCltr[dt.Rows.IndexOf(row)]];
                    sqlCmd.ExecuteNonQuery();
                }
            }
            string delClusterQuery = "delete clusterResult";
            command.CommandText = delClusterQuery;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            command = new SqlCommand(delClusterQuery, sqlCon);
            command.ExecuteNonQuery();
            for (int i=0;i<cltr;i++)
            {
                string clusterQuery = "INSERT clusterResult (clusterIndex, recencyCentroid, frequencyCentroid, monetaryCentroid) VALUES (" + (i + 1) + ", '" + r[i, 0] + "', '" + f[i, 0] + "', '" + m[i, 0] + "')";
                command.CommandText = clusterQuery;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                command = new SqlCommand(clusterQuery, sqlCon);
                command.ExecuteNonQuery();
            }
            sqlCon.Close();
            metroPanel3.Visible = true; 
            metroPanel1.Visible = false;
            metroPanel2.Visible = false;
            metroLabel3.Text = "Process";
            chartThread();
            Console.Out.WriteLine("Process Finished");
            var newForm = new resultPage();
            newForm.Show();
            //metroPanel3.Visible = false;
        }

        //Trapezoid Function\\
        public double trapValue(double V, int a, int b, int c, int d)
        {
            if (V >= a && V <= b)
            {
                return (V - a) / (b - a);
            }
            else if (V >= b && V <= c)
            {
                return 1;
            }
            else if (V >= c && V <= d)
            {
                return (d - V) / (d - c);
            }
            else return 0;
        }

        public double downlinearValue(double V, int a, int b)
        {
            if (V <= a)
            {
                return 1;
            }
            else if (V >= a && V <= b)
            {
                return (b - V) / (b - a);
            }
            else return 0;
        }

        public double uplinearValue(double V, int a, int b)
        {
            if (V <= a)
            {
                return 0;
            }
            else if (V >= a && V <= b)
            {
                return (V - a) / (b - a);
            }
            else return 1;
        }

        private void metroRadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            welcomeLbl.Visible = false;
            metroGrid1.Visible = true;
            metroGrid1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            metroGrid1.CurrentCell = metroGrid1.Rows[0].Cells[0];
            metroGrid1.BeginEdit(true);
        }

        private void trackBar1_ValueChanged(object sender, EventArgs e)
        {
            label5.Text = (criteriaTrackBar.Value + 1).ToString();
        }

        private void metroCheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (customCheckbox.Checked)
            {
                panel1.Enabled = true;
                panel2.Enabled = true;
                panel3.Enabled = true;

                //Properties.Settings.Default.Save();
                recLTA.Text = "";
                recLTlow.Text = "";
                recLThigh.Text = "";
                recQLTlow.Text = "";
                recQLThigh.Text = "";
                recRCNTlow.Text = "";
                recRCNThigh.Text = "";

                freVRlow.Text = "";
                freVRhigh.Text = "";
                freRlow.Text = "";
                freRhigh.Text = "";
                freOlow.Text = "";
                freOhigh.Text = "";
                freVO.Text = "";

                monVLlow.Text = "";
                monVLhigh.Text = "";
                monLlow.Text = "";
                monLhigh.Text = "";
                monMlow.Text = "";
                monMhigh.Text = "";
                monHlow.Text = "";
                monHhigh.Text = "";
                monVH.Text = "";
            }
            else if (customCheckbox.Checked == false)
            {
                panel1.Enabled = false;
                panel2.Enabled = false;
                panel3.Enabled = false;
                Properties.Settings.Default.Reload();
            }
        }

        private void numericUpDown1_MouseDown(object sender, MouseEventArgs e)
        {
            criteriaTrackBar.Focus();
        }
    }
}
