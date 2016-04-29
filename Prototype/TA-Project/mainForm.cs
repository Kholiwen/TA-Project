using System;
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
//using scrollingText;

namespace TA_Project
{
    public partial class mainForm : MetroFramework.Forms.MetroForm
    {
        int a = 20;
        string directoryPath = "";
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
            label3.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label4.Font = new Font("Tahoma", 11, FontStyle.Regular);
            //DataTable _table = new DataTable();
            //_table.ReadXml(Application.StartupPath + @"\Data\test.xml");
            //metroGrid1.DataSource = _table;
            WinChartViewer wc = new WinChartViewer();
            createChart(winChartViewer1, 1, a);
            metroGrid1.Font = new Font("Segoe UI", 11f, FontStyle.Regular, GraphicsUnit.Pixel);
            metroPanel2.Visible = false;
            metroPanel3.Visible = false;
            browseBtn.Focus();
            //chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
        }
        public string getName() { return "3D Scatter Chart (1)"; }

        //Number of charts produced in this demo module
        public int getNoOfCharts() { return 1; }

        //Main code for creating chart.
        //Note: the argument chartIndex is unused because this demo only has 1 chart.
        public void createChart(WinChartViewer viewer, int chartIndex, int a)
        {
            this.a = a;
            //// The XYZ data for the 3D scatter chart as 3 random data series
            //RanSeries r = new RanSeries(0);
            //double[] xData = r.getSeries2(100, 100, -10, 10);
            //double[] yData = r.getSeries2(100, 0, 0, 20);
            //double[] zData = r.getSeries2(100, 100, -10, 10);

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

            // Add a scatter group to the chart using 11 pixels glass sphere symbols, in which the
            // color depends on the z value of the symbol
            //c.addScatterGroup(xData, yData, zData, "", Chart.GlassSphere2Shape, 11,
            //    Chart.SameAsMainColor);

            // Set the elevation and rotation angles to 15 and 30 degrees
            c.setViewAngle(15, 30);

            // Add a legend box at (640, 180)
            c.addLegend(600, 180);

            // Add 3 scatter groups to the chart with 9 pixels glass sphere symbols of red (ff0000), green
            // (00ff00) and blue (0000ff) colors
            c.addScatterGroup(xData0, yData0, zData0, "1st Cluster", Chart.GlassSphere2Shape, 9, 0xff0000);
            c.addScatterGroup(xData1, yData1, zData1, "2nd Cluster", Chart.GlassSphere2Shape, 9, 0x00ff00);
            c.addScatterGroup(xData2, yData2, zData2, "3rd Cluster", Chart.GlassSphere2Shape, 9, 0x0000ff);


            // Add a color axis (the legend) in which the left center is anchored at (645, 270). Set
            // the length to 200 pixels and the labels on the right side.
            //c.setColorAxis(645, 270, Chart.Left, 200, Chart.Right);

            //// Set the x, y and z axis titles using 10 points Arial Bold font
            //c.xAxis().setTitle("X-Axis Place Holder", "Arial Bold", 10);
            //c.yAxis().setTitle("Y-Axis Place Holder", "Arial Bold", 10);
            //c.zAxis().setTitle("Z-Axis Place Holder", "Arial Bold", 10);

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
            // TODO: This line of code loads data into the 'cSSDataSet.dataTable' table. You can move, or remove it, as needed.
            // TODO: This line of code loads data into the 'cSSDataSet.dataTable' table. You can move, or remove it, as needed.
            //this.dataTableTableAdapter.Fill(this.cSSDataSet.dataTable);
            // TODO: This line of code loads data into the 'cSSDataSet1.dataTable' table. You can move, or remove it, as needed.

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

            SqlConnection myConnection;
            SqlCommand command = new SqlCommand();
            string connectionString = TA_Project.Properties.Settings.Default.CSSConnectionString;
            string query = "SELECT * FROM dataTable";
            myConnection = new SqlConnection(connectionString);
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = myConnection;
            SqlDataAdapter sa = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            sa.Fill(dt);
            double[,] u = new double[dt.Rows.Count, cltr];
            for (int k = 0; k < cltr; k++)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    u[i, k] = rnd.NextDouble();
                }
            }
            double[,] X = new double[dt.Rows.Count, 3];
            foreach (DataRow dr in dt.Rows)
            {
                X[dt.Rows.IndexOf(dr), 0] = Convert.ToInt32((DateTime.Now - Convert.ToDateTime(dr["Last purchase"])).TotalDays);
                X[dt.Rows.IndexOf(dr), 1] = Convert.ToInt32(dr["Frequency"]);
                X[dt.Rows.IndexOf(dr), 2] = Convert.ToInt64(dr["Total purchase"]);
            }

            //Fuzzy C-Means Method\\
            double temp1 = 0, temp2 = 0, temp3 = 0, temp4 = 0, temp5 = 0, temp6 = 0, temp7 = 0, temp8 = 0, temp9 = 0;
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




                for (int k = 0; k < cltr; k++)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        for (int k2 = 0; k2 < cltr; k2++)
                        {
                            for (int j = 0; j < 3; j++)
                            {
                                temp5 += Math.Pow(X[i, j] - V[k, j], w);
                                temp6 += Math.Pow(X[i, j] - V[k2, j], w);
                            }
                            temp7 = Math.Pow(temp5, -1);
                            temp8 = Math.Pow(temp6, -1);
                            temp9 += temp8;
                            temp5 = 0;
                            temp6 = 0;
                        }
                        u[i, k] = temp7 / temp9;
                        temp7 = 0;
                        temp8 = 0;
                        temp9 = 0;
                    }
                }
                ctr++;
            } while (ctr < maxIter && Math.Abs((P[ctr-1] - P[ctr - 2])) > tc);

            metroPanel3.Visible = true;
            metroPanel1.Visible = false;
            metroPanel2.Visible = false;
            metroLabel3.Text = "Process";
            Console.Out.WriteLine("Process Finished");
            Console.Out.WriteLine(String.Format("{0:F5}", P[20]));
            chartThread();
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

                Properties.Settings.Default.Save();
                textBox2.Text = "";
                textBox3.Text = "";
                textBox4.Text = "";
                textBox5.Text = "";
                textBox6.Text = "";
                textBox7.Text = "";
                textBox8.Text = "";

                textBox10.Text = "";
                textBox11.Text = "";
                textBox12.Text = "";
                textBox13.Text = "";
                textBox14.Text = "";
                textBox15.Text = "";
                textBox17.Text = "";

                textBox18.Text = "";
                textBox19.Text = "";
                textBox20.Text = "";
                textBox21.Text = "";
                textBox22.Text = "";
                textBox23.Text = "";
                textBox24.Text = "";
                textBox25.Text = "";
                textBox27.Text = "";
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
