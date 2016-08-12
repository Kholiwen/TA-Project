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
using System.Drawing.Imaging;

namespace TA_Project
{
    public partial class mainForm : MetroFramework.Forms.MetroForm
    {
        resultPage resultForm;
        About ab;
        Dictionary<String, String> rfmd, segmentD;
        OleDbConnection oleCon;
        SqlConnection sqlCon;
        SqlDataAdapter sa;
        SqlCommand command;
        DataTable dt, dt2;
        String olesqlConn, excelQuery, sqlConn, query, delQuery;
        String[] rfmv;
        String[] custName, custID;
        String directoryPath = "";
        Double[] rfm;
        Double[,] r;
        Double[,] f;
        Double[,] m;
        Double[,] u;
        Double[,] V;
        Double[,] X;
        Double[] P;
        Double tc = 0.00001;
        Double temp1 = 0, temp2 = 0, temp3 = 0, temp4 = 0, temp5 = 0, temp6 = 0, temp7 = 0, temp8 = 0, temp9 = 0, temp10 = 0;
        int dataCtr;
        int result = 0, cltr = 0;
        int[,] rfmc;
        int[] custCltr;
        int w = 2;
        int maxIter = 1500;
        int ctr, num = 0;
        int selectedRowIndex;
        Random rnd = new Random();
        TimeSpan timeSpan;
        DateTime dataimporttimeStart, fuzzycmeanstimeStart, fuzzyrfmtimeStart, dateCutOff;

        public mainForm()
        {
            InitializeComponent();
            initCriteriaRFM();

            label1.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label3.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label4.Font = new Font("Tahoma", 11, FontStyle.Regular);
            manualInputGrid.Font = new Font("Segoe UI", 11f, FontStyle.Regular, GraphicsUnit.Pixel);
            manualInputGrid.EnableHeadersVisualStyles = true;
            manualInputGrid.CellBorderStyle = DataGridViewCellBorderStyle.Single;
            manualInputGrid.GridColor = Color.Black;
            metroPanel2.Visible = false;
            metroPanel3.Visible = false;
            metroPanel4.Visible = false;
            browseBtn.Focus();

            delQuery = "delete [CSS].[dbo].[transaction]";
            sqlConnection();
            sqlCon.Open();
            //command = new SqlCommand(delQuery, sqlCon);
            //command.CommandText = delQuery;
            //command.CommandType = CommandType.Text;
            //command.Connection = sqlCon;
            //sa = new SqlDataAdapter(command);
            //dt = new DataTable();
            //command.ExecuteNonQuery();
            //Database Intact Startup\\
            query = "SELECT * FROM [CSS].[dbo].[transaction]";
            command = new SqlCommand();
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            dt = new DataTable();
            sa.Fill(dt);
            dataCtr = dt.Rows.Count;
            sqlCon.Close();
        }

        public void createChart(WinChartViewer viewer, int chartIndex)
        {
            int[] chartColor = new int[8] { 0xff0000, 0x00ff00, 0x0000ff, 0xffff00, 0xff00ff, 0x55ffff, 0x888888, 0x111111 };

            ThreeDScatterChart c = new ThreeDScatterChart(640, 480);

            for (int k = 0; k < cltr; k++)
            {
                RanSeries r = new RanSeries(k);
                Double[] xData = new Double[1];
                Double[] yData = new Double[1];
                Double[] zData = new Double[1];

                xData = r.getSeries2(1, V[k, 0], 0, 0);
                yData = r.getSeries2(1, V[k, 1], 0, 0);
                zData = r.getSeries2(1, V[k, 2], 0, 0);
                c.addScatterGroup(xData, yData, zData, "", Chart.GlassSphere2Shape, 18, chartColor[k]);
                if (viewFuzzyBtn.Visible == true)
                {
                    for (int i = 0; i < num / 2; i++)
                    {
                        if (custCltr[i] == k)
                        {
                            xData = r.getSeries2(1, X[i, 0], 0, 0);
                            yData = r.getSeries2(1, X[i, 1], 0, 0);
                            zData = r.getSeries2(1, X[i, 2], 0, 0);
                            c.addScatterGroup(xData, yData, zData, "", Chart.GlassSphere2Shape, 12, chartColor[k]);
                        }
                    }
                    c.addScatterGroup(xData, yData, zData, rfmv[k], Chart.GlassSphere2Shape, 12, chartColor[k]);
                    c.addLegend(400, 10);
                }
                else
                {
                    for (int i = 0; i < num / 2; i++)
                    {
                        if (custCltr[i] == k)
                        {
                            xData = r.getSeries2(1, X[i, 0] * temp10, 0, 0);
                            yData = r.getSeries2(1, X[i, 1] * temp10, 0, 0);
                            zData = r.getSeries2(1, X[i, 2] * temp10, 0, 0);
                            c.addScatterGroup(xData, yData, zData, "", Chart.GlassSphere2Shape, 12, chartColor[k]);
                        }
                    }
                }
            }
            c.setPlotRegion(350, 225, 360, 360, 270);
            c.setViewAngle(15, 30);
            c.xAxis().setTitle("Recency");
            c.yAxis().setTitle("Frequency");
            c.zAxis().setTitle("Monetary");

            viewer.Chart = c;
            viewer.ImageMap = c.getHTMLImageMap("clickable", "",
                "title='(x={x|p}, y={y|p}, z={z|p}'");
        }

        private void excelConn(String filePath)
        {
            olesqlConn = String.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", filePath).ToString();
            oleCon = new OleDbConnection(olesqlConn);
        }

        private void sqlConnection()
        {
            sqlConn = TA_Project.Properties.Settings.Default.CSSConnectionString;
            sqlCon = new SqlConnection(sqlConn);
        }

        private void insertExcelRecords(String filePath)
        {
            try
            {
                String customerIDHeader = "", customerHeader = "", purchasedateHeader = "", purchaseAmountHeader = "";
                result = 0;
                excelConn(filePath);
                excelQuery = String.Format("Select * FROM [{0}]", "Sheet1$");

                oleCon.Open();
                OleDbDataAdapter oda = new OleDbDataAdapter(excelQuery, oleCon);
                oleCon.Close();
                dt = new DataTable();
                oda.Fill(dt);
                try
                {
                    using (var frm = new columnSelectionForm(dt))
                    {
                        var res = frm.ShowDialog();
                        if (res == DialogResult.OK)
                        {
                            customerIDHeader = frm.customerIDHeader;
                            customerHeader = frm.customerHeader;
                            purchasedateHeader = frm.purchasedateHeader;
                            purchaseAmountHeader = frm.purchaseAmountHeader;
                        }
                    }
                    manualRadioButton.Enabled = false;
                    browseBtn.Enabled = false;
                    dataimporttimeStart = DateTime.Now - timeSpan;
                    oleCon.Open();
                    excelQuery = String.Format("Select [" + customerIDHeader + "],[" + customerHeader + "],[" + purchasedateHeader + "],[" + purchaseAmountHeader + "] FROM [{0}]", "Sheet1$");
                    oda = new OleDbDataAdapter(excelQuery, oleCon);
                    oleCon.Close();
                    dt = new DataTable();
                    oda.Fill(dt);
                    batchProgressBar.Maximum = dt.Rows.Count;
                    sqlConnection();
                    sqlCon.Open();
                    DateTime dateValue;
                    float floatValue;
                    if (DateTime.TryParse(dt.Rows[0][2].ToString(), out dateValue) && float.TryParse(dt.Rows[0][3].ToString(), out floatValue))
                    {
                        batchimportProcess();
                    }
                    else
                    {
                        MessageBox.Show("Column header must be selected properly. Please repeat the process again.");
                        manualRadioButton.Enabled = true;
                        browseBtn.Enabled = true;
                        browseBtn.Focus();
                    }
                }
                catch (Exception ex)
                {
                    System.Console.WriteLine("Exception Message: " + ex);
                    manualRadioButton.Enabled = true;
                    browseBtn.Enabled = true;
                }
            }
            catch (OleDbException e)
            {
                MessageBox.Show("Please close the file and repeat the process again.");
                System.Console.WriteLine("OleDbException Message: " + e);
            }
        }

        private void mainForm_Load(object sender, EventArgs e)
        {
            this.segmentStrategyTableAdapter.Fill(this.cSSDataSet1.segmentStrategy);
            this.transactionTableAdapter.Fill(this.cSSDataSet3.transaction);
            this.historyIndexTableAdapter.Fill(this.cSSDataSet4.historyIndex);
        }

        private void batchimportProcess()
        {
            BackgroundWorker b = new BackgroundWorker();
            b.DoWork += (object sender, DoWorkEventArgs e) =>
            {
                foreach (DataRow row in dt.Rows)
                {
                    using (SqlCommand sqlCmd = new SqlCommand("sp_insertTRANSACTION", sqlCon))
                    {
                        sqlCmd.CommandType = CommandType.StoredProcedure;
                        sqlCmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = row[1];
                        sqlCmd.Parameters.Add("@TOTAL", SqlDbType.Float).Value = row[3];
                        sqlCmd.Parameters.Add("@DT", SqlDbType.Date).Value = row[2];
                        sqlCmd.Parameters.Add("@CID", SqlDbType.NChar).Value = row[0];
                        result += sqlCmd.ExecuteNonQuery();
                    }
                    getResult(result.ToString());
                }
            };

            b.RunWorkerCompleted += (object sender, RunWorkerCompletedEventArgs e) =>
            {
                timer1.Stop();
                this.TopMost = true;
                this.BringToFront();
                this.Focus();
                nextBtn1.Focus();
                if (dt.Rows.Count != 0)
                {
                    MessageBox.Show(String.Format("Data has been imported successfully! ({0})", result), "Confirmation", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    dataCtr += dt.Rows.Count;
                    transactionTableAdapter.Fill(this.cSSDataSet3.transaction);
                    batchInputGrid.Visible = true;
                    batchInputGrid.Focus();
                    Console.Out.WriteLine(result + " records has been imported to database.");
                }
                batchProgressBar.Hide();
                manualRadioButton.Enabled = true;
                browseBtn.Enabled = true;
                this.TopMost = false;
            };

            timer1.Start();
            batchProgressBar.Visible = true;
            timerLabel.Visible = true;
            batchLabel.Visible = true;
            batchProgressBar.Value = result;
            b.RunWorkerAsync();
        }
        delegate void getResultCallback(String result);
        private void getResult(String result)
        {
            if (this.batchLabel.InvokeRequired)
            {
                getResultCallback d = new getResultCallback(getResult);
                this.Invoke(d, new object[] { result });
            }
            else
            {
                this.batchProgressBar.Value = Convert.ToInt32(result);
                this.batchLabel.Text = String.Format("{0} {1}", " records imported:", (Convert.ToInt32(result) + dataCtr).ToString());
            }
        }

        private void fuzzycmeansprocessThread()
        {
            timer2.Start();
            BackgroundWorker b = new BackgroundWorker();
            int period = 0;
            int periodTrackbarValue = periodTrackBar.Value;
            metroPanel1.Visible = false;
            metroPanel2.Visible = false;
            metroPanel3.Visible = true;
            this.Text = "Process";
            fuzzyrfmTimerLabel.Visible = false;
            viewFuzzyBtn.Visible = false;
            viewResultBtn.Visible = false;
            winChartViewer1.Image = null;

            b.DoWork += (object sender, DoWorkEventArgs e) =>
            {
                query = "SELECT TOP 1 * FROM [CSS].[dbo].[transaction] order by purchaseDate DESC";
                sqlConnection();
                sqlCon.Open();
                command = new SqlCommand();
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                sa = new SqlDataAdapter(command);
                dt = new DataTable();
                sa.Fill(dt);
                dateCutOff = Convert.ToDateTime(dt.Rows[0][3]);

                query = "SELECT * FROM [CSS].[dbo].[transaction] order by [CID]";
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                sa = new SqlDataAdapter(command);
                dt = new DataTable();
                sa.Fill(dt);

                delQuery = "delete [CSS].[DBO].customer";
                command = new SqlCommand(delQuery, sqlCon);
                command.CommandText = delQuery;
                sa = new SqlDataAdapter(command);
                command.Connection = sqlCon;
                command.ExecuteNonQuery();

                //Data input\\
                custName = new String[1];
                custID = new String[1];
                DateTime date = Convert.ToDateTime(dt.Rows[0][3]);
                Double mntry = Convert.ToInt64(dt.Rows[0][2]);
                X = new Double[dt.Rows.Count, 3];
                int frq = 1;
                int idx = 0;

                DataRow dr;
                dr = dt.Rows[0];
                for (int i = 0; i < periodTrackbarValue; i++)
                {
                    period += DateTime.DaysInMonth(dateCutOff.Year, dateCutOff.Month - i);
                }
                for (int i = 0; i < dt.Rows.Count - 1; i++)
                {
                    if (Convert.ToInt32((dateCutOff - Convert.ToDateTime(dr.Table.Rows[i][3])).TotalDays) <= period)
                    {
                        custName[idx] = dr.Table.Rows[i][1].ToString();
                        custID[idx] = dr.Table.Rows[i][4].ToString();
                        if (custID[idx] == dt.Rows[i + 1][4].ToString())
                        {
                            if (Convert.ToInt32((dateCutOff - Convert.ToDateTime(dt.Rows[i + 1][3])).TotalDays) <= period)
                            {
                                if (Convert.ToDateTime(dt.Rows[i + 1][3]) > Convert.ToDateTime(dr.Table.Rows[i][3]))
                                {
                                    date = Convert.ToDateTime(dt.Rows[i + 1][3]);
                                }
                                frq += 1;
                                mntry += Convert.ToInt64(dt.Rows[i + 1][2]);
                            }
                        }
                        else if (custID[idx] != dt.Rows[i + 1][4].ToString())
                        {
                            X[idx, 0] = Convert.ToInt32((dateCutOff - date).TotalDays);
                            X[idx, 1] = frq;
                            X[idx, 2] = mntry;
                            idx += 1;
                            Array.Resize(ref custName, idx + 1);
                            Array.Resize(ref custID, idx + 1);
                            frq = 1;
                            mntry = Convert.ToInt64(dt.Rows[i + 1][2]);
                            date = Convert.ToDateTime(dt.Rows[i + 1][3]);
                        }
                    }
                }
                num = Enumerable.Range(0, X.GetLength(0)).Count(i => X[i, 0] != 0);
                for (int i = 0; i < num; i++)
                {
                    String customerQuery = "INSERT customer (CID, customerName, Frequency, totalPurchase, lastPurchase, clusterIndex) VALUES ('" + custID[i] + "', '" + custName[i].Replace("'", " ") + "', '" + X[i, 1] + "', '" + X[i, 2] + "', '" + dateCutOff.AddDays(-X[i, 0]) + "', '" + 0 + "')";
                    command.CommandText = customerQuery;
                    command.CommandType = CommandType.Text;
                    command.Connection = sqlCon;
                    command = new SqlCommand(customerQuery, sqlCon);
                    command.ExecuteNonQuery();
                }
                fuzzyCMeans();

            };

            b.RunWorkerCompleted += (object sender, RunWorkerCompletedEventArgs e) =>
            {
                this.TopMost = true;
                this.BringToFront();
                this.Focus();
                sqlCon.Open();
                timer2.Stop();
                clusterProgressBar.Visible = false;
                clusterProgressBar.Enabled = false;
                rfmprocessBtn.Visible = true;
                rfmprocessBtn.Focus();
                this.TopMost = false;
                viewFuzzyBtn.Visible = true;
                fuzzycmeansTimerLabel.Location = new Point(163, 9);
                query = "SELECT TOP 1 * FROM [CSS].[dbo].[historyIndex] order by historyID DESC";
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                sa = new SqlDataAdapter(command);
                dt = new DataTable();
                sa.Fill(dt);
                query = "UPDATE [CSS].[dbo].historyIndex set fuzzyProcessTime ='" + timeSpan + "', MPCScore='" + MPCScore + "', fuzzyRFMTime=null where historyID ='" + dt.Rows[0][0].ToString() + "'";
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                command.ExecuteNonQuery();
                sqlCon.Close();
            };
            clusterProgressBar.Enabled = true;
            b.RunWorkerAsync();
        }

        private void fuzzyrfmprocessThread()
        {
            BackgroundWorker b = new BackgroundWorker();
            timer3.Start();

            b.DoWork += (object sender, DoWorkEventArgs e) =>
            {
                fuzzyRFM();
            };

            b.RunWorkerCompleted += (object sender, RunWorkerCompletedEventArgs e) =>
            {
                timer3.Stop();
                fuzzyrfmTimerLabel.Location = new Point(163, 32);
                rfmprogressBar.Visible = false;
                viewResultBtn.Visible = true;
                query = "SELECT TOP 1 * FROM [CSS].[dbo].[historyIndex] order by historyID DESC";
                sqlConnection();
                sqlCon.Open();
                dt = new DataTable();
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                sa = new SqlDataAdapter(command);
                sa.Fill(dt);
                query = "UPDATE [CSS].[dbo].historyIndex set fuzzyRFMTime='" + timeSpan + "' where historyID ='" + dt.Rows[0][0].ToString() + "'";
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                command.ExecuteNonQuery();
                this.TopMost = true;
                this.BringToFront();
                this.Focus();
                viewResultBtn.Focus();
                this.TopMost = false;
                Rectangle bounds = this.Bounds;
                using (Bitmap bitmap = new Bitmap(bounds.Width, bounds.Height))
                {
                    using (Graphics g = Graphics.FromImage(bitmap))
                    {
                        g.CopyFromScreen(new Point(bounds.Left, bounds.Top), Point.Empty, bounds.Size);
                    }
                    bitmap.Save("../Screenshot/" + dt.Rows[0][0].ToString().Trim() + "_Chart" + ".jpg", ImageFormat.Jpeg);
                }
                for (int i = 0; i < cltr; i++)
                {
                    String historyQuery = "INSERT historyDetail ([historyID] ,[clusterIndex],[recencyCentroid],[frequencyCentroid],[monetaryCentroid] ,[recencyDOM],[frequencyDOM],[monetaryDOM],[rfmScore] ,[clusterSegment]) VALUES ('" + dt.Rows[0][0].ToString() + "', '" + (i + 1) + "', '" + V[i, 0] + "', '" + V[i, 1] + "', '" + V[i, 2] + "', '" + r[i, 0] + "', '" + f[i, 0] + "', '" + m[i, 0] + "', '" + rfm[i] + "', '" + rfmv[i] + "')";
                    command.CommandText = historyQuery;
                    command.CommandType = CommandType.Text;
                    command.Connection = sqlCon;
                    command = new SqlCommand(historyQuery, sqlCon);
                    command.ExecuteNonQuery();
                }
                sqlCon.Close();
                Console.Out.WriteLine("Process Finished");
            };

            rfmprogressBar.ProgressBarStyle = ProgressBarStyle.Marquee;
            rfmprogressBar.Enabled = true;
            rfmprogressBar.Visible = true;
            fuzzyrfmTimerLabel.Visible = true;

            b.RunWorkerAsync();
        }
        public void fuzzyCMeans()
        {
            P = new Double[maxIter];
            P[0] = 0;
            cltr = Decimal.ToInt32(clusterSizeNUD.Value);
            ctr = 1;
            V = new Double[cltr, 3];

            command = new SqlCommand();
            query = "SELECT * FROM customer order by CID";
            sqlConnection();
            command.CommandText = query;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            dt = new DataTable();
            sa.Fill(dt);
            custCltr = new int[dt.Rows.Count];
            r = new Double[cltr, 2];
            f = new Double[cltr, 2];
            m = new Double[cltr, 2];
            segmentD = new Dictionary<String, String>{{"Superstar","1"},{"Golden","2"},{"Typical","3"},{"Occasional","4"},
                {"Everyday","5"},{"Dormant","6"}};

            rfmd = new Dictionary<String, String>{
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
            rfmc = new int[3, 8];
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
            u = new Double[dt.Rows.Count, cltr];
            for (int k = 0; k < cltr; k++)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    u[i, k] = rnd.NextDouble();
                }
            }

            //Fuzzy C-Means Method\\
            do
            {
                //Cluster Centroid Function\\
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

                //Objective Function\\
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

                //Membership Degree Function\\

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    temp10 = 0;
                    for (int k = 0; k < cltr; k++)
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
                        if (temp10 < u[i, k])
                        {
                            temp10 = u[i, k];
                            custCltr[i] = k;
                        }
                        temp7 = 0;
                        temp8 = 0;
                        temp9 = 0;
                    }
                }
                if (ctr == 3)
                {
                    createChart(winChartViewer1, 1);
                }
                if (ctr % 50 == 0)
                {
                    createChart(winChartViewer1, 1);
                }
                ctr++;
            } while (ctr < maxIter && Math.Abs((P[ctr - 1] - P[ctr - 2])) > tc);
            createChart(winChartViewer1, 1);
            MPC(PC());
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                temp1 = 0;
                for (int k = 0; k < cltr; k++)
                {
                    if (temp1 < u[i, k])
                    {
                        temp1 = u[i, k];
                        custCltr[i] = k;
                    }
                }
            }
        }

        //MPC Score Method\\
        public Double PC()
        {
            temp1 = 0;
            for (int k = 0; k < cltr; k++)
            {
                temp2 = 0;
                for (int i = 0; i < num; i++)
                {
                    temp2 += Math.Pow(u[i, k], 2);
                }
                temp1 += temp2;
            }
            return ((float)1 / num) * temp1;
        }
        public Double MPCScore;
        public void MPC(Double PC)
        {
            MPCScore = 1 - ((float)cltr / (cltr - 1)) * (1 - PC);
        }

        public void fuzzyRFM()
        {
            //Fuzzy RFM Method\\
            rfm = new Double[cltr];
            Double[] temp = new Double[2];
            Double g = 0.5;

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
                                temp[1] = i;
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
                }
                rfm[k] = Math.Pow((r[k, 0] * f[k, 0] * m[k, 0]), 1 - g) * Math.Pow(1 - (((1 - r[k, 0]) * (1 - f[k, 0]) * (1 - m[k, 0]))), 0.5);
            }
            rfmv = new String[cltr];
            {
                for (int i = 0; i < cltr; i++)
                {
                    rfmv[i] = rfmd[r[i, 1].ToString() + f[i, 1].ToString() + m[i, 1].ToString()];
                }
            }
            delQuery = "delete customer";
            sqlConnection();
            sqlCon.Open();
            command = new SqlCommand(delQuery, sqlCon);
            command.CommandText = delQuery;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            sa = new SqlDataAdapter(command);
            command.ExecuteNonQuery();
            for (int i = 0; i < num; i++)
            {
                String customerQuery = "INSERT customer (CID, customerName, Frequency, totalPurchase, lastPurchase, clusterIndex) VALUES ('" + custID[i] + "', '" + custName[i].Replace("'", " ") + "', '" + X[i, 1] + "', '" + X[i, 2] + "', '" + dateCutOff.AddDays(-X[i, 0]) + "', '" + (custCltr[i] + 1) + "')";
                command.CommandText = customerQuery;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                command = new SqlCommand(customerQuery, sqlCon);
                command.ExecuteNonQuery();
            }
            String delClusterQuery = "delete clusterResult";
            command.CommandText = delClusterQuery;
            command.CommandType = CommandType.Text;
            command.Connection = sqlCon;
            command = new SqlCommand(delClusterQuery, sqlCon);
            command.ExecuteNonQuery();
            for (int i = 0; i < cltr; i++)
            {
                String clusterQuery = "INSERT clusterResult (clusterIndex, recencyDOM, frequencyDOM, monetaryDOM, rfmScore, clusterSegment, segmentID) VALUES (" + (i + 1) + ", '" + r[i, 0] + "', '" + f[i, 0] + "', '" + m[i, 0] + "', '" + rfm[i] + "', '" + rfmv[i] + "', '" + Convert.ToInt32(segmentD[rfmv[i].Split(' ')[0]]) + "')";
                command.CommandText = clusterQuery;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                command = new SqlCommand(clusterQuery, sqlCon);
                command.ExecuteNonQuery();
            }
            sqlCon.Close();
            createChart(winChartViewer1, 1);
        }

        //Trapezoid Function\\
        public Double trapValue(Double V, int a, int b, int c, int d)
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

        public Double downlinearValue(Double V, int a, int b)
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

        public Double uplinearValue(Double V, int a, int b)
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

        private void batchRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (batchRadioButton.Checked == true)
            {
                manualInputGrid.EndEdit();
                fileTextBox.Visible = true;
                browseBtn.Visible = true;
                browseBtn.Focus();
                batchInputGrid.ReadOnly = true;
                if (dt.Rows.Count != 0)
                {
                    if (dataCtr != dt.Rows.Count)
                    {
                        transactionTableAdapter.Fill(this.cSSDataSet3.transaction);
                    }
                    batchInputGrid.Visible = true;
                }
            }
        }

        private void manualRadioButton_CheckedChanged(object sender, EventArgs e)
        {
            if (manualRadioButton.Checked == true)
            {
                batchInputGrid.Visible = false;
                manualInputGrid.Visible = true;
                fileTextBox.Visible = false;
                browseBtn.Visible = false;
                welcomeLbl.Visible = false;
                manualInputGrid.ReadOnly = false;
                if (dt.Rows.Count != 0)
                {
                    if (dataCtr != dt.Rows.Count)
                    {
                        transactionTableAdapter.Fill(this.cSSDataSet3.transaction);
                    }
                }
                manualInputGrid.CurrentCell = manualInputGrid.Rows[manualInputGrid.Rows.Count - 1].Cells[0];
                if (manualInputGrid != null)
                {
                    manualInputGrid.BeginEdit(true);
                }
                manualInputGrid.Rows[manualInputGrid.Rows.Count - 1].Cells[0].ToolTipText = "Click here to start data input";
            }
        }

        private void browseBtn_Click(object sender, EventArgs e)
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
                if (fileTextBox.Text != "")
                {
                    browseBtn.Text = "OK";
                }
            }
            else if (browseBtn.Text == "OK")
            {
                try
                {
                    if (fileTextBox.Text != "")
                    {
                        insertExcelRecords(directoryPath);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Could not read file from disk. " + "Exception Message: " + ex.Message);
                }
                fileTextBox.Text = "";
                browseBtn.Text = "Browse..";
            }
        }


        private void manualInputGrid_CellValueChanged_1(object sender, DataGridViewCellEventArgs e)
        {
            if (manualRadioButton.Checked == true)
            {
                if (manualInputGrid.Rows.Count > 0)
                {
                    if (manualInputGrid.Rows[dataCtr].Cells[0].Value != null)
                    {
                        query = "SELECT customerName FROM [CSS].[dbo].[transaction] where CID='" + manualInputGrid.Rows[dataCtr].Cells[0].Value.ToString() + "'";
                        dt = new DataTable();
                        command.CommandText = query;
                        command.CommandType = CommandType.Text;
                        command.Connection = sqlCon;
                        sa = new SqlDataAdapter(command);
                        sa.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            manualInputGrid.Rows[dataCtr].Cells[1].Value = dt.Rows[0][0].ToString();
                        }
                    }
                }
            }
        }

        private void manualInputGrid_RowEnter_1(object sender, DataGridViewCellEventArgs e)
        {
            if (manualRadioButton.Checked == true)
            {
                if (manualInputGrid.Rows.Count > dataCtr + 1)
                {
                    result = 0;
                    if (manualInputGrid.Rows[dataCtr].Cells[0].Value.ToString() != "" && manualInputGrid.Rows[dataCtr].Cells[1].Value.ToString() != "" && manualInputGrid.Rows[dataCtr].Cells[2].Value.ToString() != "" && manualInputGrid.Rows[dataCtr].Cells[3].Value.ToString() != "")
                    {
                        if (sqlCon.State == ConnectionState.Closed)
                        {
                            sqlCon.Open();
                        }
                        query = "SELECT * FROM [CSS].[dbo].[transaction] order by customerName";
                        using (SqlCommand sqlCmd = new SqlCommand("sp_insertTRANSACTION", sqlCon))
                        {
                            sqlCmd.CommandType = CommandType.StoredProcedure;
                            sqlCmd.Parameters.Add("@Name", SqlDbType.VarChar).Value = Convert.ToString(manualInputGrid.Rows[dataCtr].Cells[1].Value);
                            sqlCmd.Parameters.Add("@TOTAL", SqlDbType.Float).Value = Convert.ToDecimal(manualInputGrid.Rows[dataCtr].Cells[2].Value);
                            sqlCmd.Parameters.Add("@DT", SqlDbType.Date).Value = manualInputGrid.Rows[dataCtr].Cells[3].Value;
                            sqlCmd.Parameters.Add("@CID", SqlDbType.NChar).Value = Convert.ToString(manualInputGrid.Rows[dataCtr].Cells[0].Value);
                            result += sqlCmd.ExecuteNonQuery();
                        }
                        dataCtr += 1;
                    }
                    dt = new DataTable();
                    command.CommandText = query;
                    command.CommandType = CommandType.Text;
                    command.Connection = sqlCon;
                    sa = new SqlDataAdapter(command);
                    sa.Fill(dt);
                    sqlCon.Close();
                }
            }
        }

        private void manualInputGrid_RowsRemoved(object sender, DataGridViewRowsRemovedEventArgs e)
        {
            if (manualRadioButton.Checked == true)
            {
                if (manualInputGrid.Rows.Count > 0)
                {
                    if (sqlCon.State == ConnectionState.Closed)
                    {
                        sqlCon.Open();
                    }
                    query = "DELETE [CSS].[dbo].[transaction] where TID='" + dt.Rows[selectedRowIndex][0].ToString().Trim() + "'";
                    command.CommandText = query;
                    command.CommandType = CommandType.Text;
                    command.Connection = sqlCon;
                    command.ExecuteNonQuery();
                    sqlCon.Close();
                    dataCtr -= 1;
                }
            }
        }

        private void manualInputGrid_SelectionChanged(object sender, EventArgs e)
        {
            if (manualRadioButton.Checked == true)
            {
                if (manualInputGrid.Rows.Count > 1)
                {
                    selectedRowIndex = manualInputGrid.CurrentCell.RowIndex;
                }
            }
        }

        private void fileTextBox_ButtonClick(object sender, EventArgs e)
        {
            fileTextBox.Clear();
            browseBtn.Text = "Browse..";
            browseBtn.Focus();
        }

        private void nextBtn1_Click(object sender, EventArgs e)
        {
            titleLabel.Text = "Options";
            metroPanel1.Visible = false;
            metroPanel2.Visible = true;
            metroPanel3.Visible = false;
            processBtn.Focus();
        }

        private void backBtn1_Click(object sender, EventArgs e)
        {
            titleLabel.Text = "Data Input";
            metroPanel1.Visible = true;
            metroPanel2.Visible = false;
            metroPanel3.Visible = false;
        }

        private void trackBar1_ValueChanged(object sender, EventArgs e)
        {
            if (periodTrackBar.Value == 12)
            {
                label5.Text = "1";
                label6.Text = "Year";
            }
            else
            {
                label5.Text = (periodTrackBar.Value).ToString();
                label6.Text = "Month";
            }
        }

        private void customCheckbox_CheckedChanged(object sender, EventArgs e)
        {
            if (customCheckbox.Checked)
            {
                panel1.Enabled = true;
                panel2.Enabled = true;
                panel3.Enabled = true;

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
                recLTA.Text = Properties.Settings.Default.ToString();
                initCriteriaRFM();
            }
        }

        public void initCriteriaRFM()
        {
            recLTA.Text = (18 * periodTrackBar.Value).ToString();
            recLTlow.Text = (11 * periodTrackBar.Value).ToString();
            recLThigh.Text = (19 * periodTrackBar.Value).ToString();
            recQLTlow.Text = (4 * periodTrackBar.Value).ToString();
            recQLThigh.Text = (12 * periodTrackBar.Value).ToString();
            recRCNThigh.Text = (5 * periodTrackBar.Value).ToString();
            recRCNTlow.Text = 0.ToString();

            freVRhigh.Text = (3 * periodTrackBar.Value).ToString();
            freRlow.Text = (2 * periodTrackBar.Value).ToString();
            freRhigh.Text = (5 * periodTrackBar.Value).ToString();
            freOlow.Text = (3 * periodTrackBar.Value).ToString();
            freOhigh.Text = (7 * periodTrackBar.Value).ToString();
            freVO.Text = (6 * periodTrackBar.Value).ToString();
            freVRlow.Text = 1.ToString();

            monVLhigh.Text = (2 * periodTrackBar.Value).ToString();
            monLlow.Text = (1 * periodTrackBar.Value).ToString();
            monLhigh.Text = (4 * periodTrackBar.Value).ToString();
            monMlow.Text = (3 * periodTrackBar.Value).ToString();
            monMhigh.Text = (6 * periodTrackBar.Value).ToString();
            monHlow.Text = (5 * periodTrackBar.Value).ToString();
            monHhigh.Text = (8 * periodTrackBar.Value).ToString();
            monVH.Text = (7 * periodTrackBar.Value).ToString();
            monVLlow.Text = (0).ToString();
        }

        private void numericUpDown1_MouseDown(object sender, MouseEventArgs e)
        {
            periodTrackBar.Focus();
        }

        private void periodTrackBar_Scroll(object sender, EventArgs e)
        {
            initCriteriaRFM();
        }

        private void processBtn_Click(object sender, EventArgs e)
        {
            try
            {
                query = "SELECT * FROM [CSS].[dbo].[transaction]";
                sqlConnection();
                sqlCon.Open();
                dt2 = new DataTable();
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                command.Connection = sqlCon;
                sa = new SqlDataAdapter(command);
                sa.Fill(dt2);

                if (dt2.Rows.Count != 0)
                {
                    if (dt2.Rows.Count != dataCtr)
                    {
                        MessageBox.Show("Wait for the import process finish first!");
                    }
                    else if (dt2.Rows.Count == dataCtr)
                    {
                        clusterProgressBar.Visible = true;
                        clusterProgressBar.Enabled = true;
                        fuzzycmeansTimerLabel.Location = new Point(388, 9);
                        fuzzyrfmTimerLabel.Location = new Point(388, 32);
                        rfmprogressBar.Value = 0;
                        clusterProgressBar.Focus();
                        titleLabel.Text = "Process";
                        mainMenu.Visible = false;
                        fuzzycmeanstimeStart = DateTime.Now;
                        using (SqlCommand sqlCmd = new SqlCommand("sp_insertHistory", sqlCon))
                        {
                            sqlCmd.CommandType = CommandType.StoredProcedure;
                            sqlCmd.Parameters.Add("@PROCDT", SqlDbType.DateTime).Value = fuzzycmeanstimeStart;
                            sqlCmd.Parameters.Add("@CLTR", SqlDbType.Int).Value = clusterSizeNUD.Value;
                            sqlCmd.Parameters.Add("@TOTAL", SqlDbType.Int).Value = dataCtr;
                            sqlCmd.Parameters.Add("@PERIOD", SqlDbType.Int).Value = periodTrackBar.Value;
                            sqlCmd.Parameters.Add("@FUZZYCTIME", SqlDbType.DateTime).Value = DBNull.Value;
                            sqlCmd.Parameters.Add("@MPCSCORE", SqlDbType.Float).Value = DBNull.Value;
                            sqlCmd.Parameters.Add("@FUZZYRFMTIME", SqlDbType.DateTime).Value = DBNull.Value;
                            result += sqlCmd.ExecuteNonQuery();
                        }
                        query = "SELECT TOP 1 * FROM [CSS].[dbo].[historyIndex] order by historyID DESC";
                        sqlConnection();
                        sqlCon.Open();
                        dt = new DataTable();
                        command.CommandText = query;
                        command.CommandType = CommandType.Text;
                        command.Connection = sqlCon;
                        sa = new SqlDataAdapter(command);
                        sa.Fill(dt);
                        sqlCon.Close();
                        Rectangle bounds = this.Bounds;
                        using (Bitmap bitmap = new Bitmap(bounds.Width, bounds.Height))
                        {
                            using (Graphics g = Graphics.FromImage(bitmap))
                            {
                                g.CopyFromScreen(new Point(bounds.Left, bounds.Top), Point.Empty, bounds.Size);
                            }
                            bitmap.Save("../Screenshot/" + dt.Rows[0][0].ToString() + "_Criteria" + ".jpg", ImageFormat.Jpeg);
                        }
                        fuzzycmeansprocessThread();
                    }
                }
                else
                {
                    MessageBox.Show("You need to import some data first!");
                    titleLabel.Text = "Data Input";
                    metroPanel2.Visible = false;
                    metroPanel1.Visible = true;
                    Console.Out.WriteLine("Process Aborted");
                }
            }
            catch (Exception ex)
            {
                metroPanel2.Visible = true;
                metroPanel3.Visible = false;
                mainMenu.Visible = true;
                titleLabel.Text = "Options";
                System.Console.WriteLine("Exception Message: " + ex);
            }
        }

        private void viewFuzzyBtn_Click(object sender, EventArgs e)
        {
            fuzzyResultForm frf = new fuzzyResultForm(ref V, ctr, cltr, MPCScore);
            frf.Show();
        }

        private void rfmprocessBtn_Click(object sender, EventArgs e)
        {
            fuzzyrfmtimeStart = DateTime.Now;
            rfmprocessBtn.Visible = false;
            fuzzyrfmprocessThread();
        }

        private void mainForm_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (dt.Rows.Count != 0)
            {
                if (MessageBox.Show("Are you sure you want to exit?", "Exit", MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.No)
                    e.Cancel = true;
                else
                {
                    Environment.Exit(0);
                }
            }
            else
            {
                Environment.Exit(0);
            }
        }

        private void viewResultBtn_Click(object sender, EventArgs e)
        {
            resultForm = new resultPage(this);
            resultForm.Show(this);
            Hide();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            Double second, minute, hour;
            timeSpan = DateTime.Now - dataimporttimeStart;
            second = timeSpan.TotalSeconds;
            minute = timeSpan.Minutes;
            hour = timeSpan.TotalHours;
            timerLabel.Text = "";
            if (hour >= 1)
            {
                timerLabel.Text = hour + " hours " + minute + " minutes " + String.Format("{0}{1}", timeSpan.Seconds, " seconds");
            }
            else if (minute >= 1)
            {
                timerLabel.Text = minute + " minutes " + String.Format("{0:0}.{1:000}{2}", timeSpan.Seconds, timeSpan.Milliseconds, " seconds");
            }
            else if (second > 0)
            {
                timerLabel.Text = String.Format("{0:0.000}{1}", second, " seconds");
            }
        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            Double second, minute, hour;
            timeSpan = DateTime.Now - fuzzycmeanstimeStart;
            second = timeSpan.TotalSeconds;
            minute = timeSpan.Minutes;
            hour = timeSpan.TotalHours;
            timerLabel.Text = "";
            if (hour >= 1)
            {
                fuzzycmeansTimerLabel.Text = hour + " hours " + minute + " minutes " + String.Format("{0}{1}", timeSpan.Seconds, " seconds");
            }
            else if (minute >= 1)
            {
                fuzzycmeansTimerLabel.Text = minute + " minutes " + String.Format("{0:0}.{1:000}{2}", timeSpan.Seconds, timeSpan.Milliseconds, " seconds");
            }
            else if (second > 0)
            {
                fuzzycmeansTimerLabel.Text = String.Format("{0:0.000}{1}", second, " seconds");
            }
        }

        private void timer3_Tick(object sender, EventArgs e)
        {
            Double second, minute, hour;
            timeSpan = DateTime.Now - fuzzyrfmtimeStart;
            second = timeSpan.TotalSeconds;
            minute = timeSpan.Minutes;
            hour = timeSpan.TotalHours;
            timerLabel.Text = "";
            if (hour >= 1)
            {
                fuzzyrfmTimerLabel.Text = hour + " hours " + minute + " minutes " + String.Format("{0}{1}", timeSpan.Seconds, " seconds");
            }
            else if (minute >= 1)
            {
                fuzzyrfmTimerLabel.Text = minute + " minutes " + String.Format("{0:0}.{1:000}{2}", timeSpan.Seconds, timeSpan.Milliseconds, " seconds");
            }
            else if (second > 0)
            {
                fuzzyrfmTimerLabel.Text = String.Format("{0:0.000}{1}", second, " seconds");
            }
        }

        private void dataInputToolstrip_Click(object sender, EventArgs e)
        {
            titleLabel.Text = "Data Input";
            metroPanel1.Visible = true;
            batchRadioButton.Visible = true;
            manualRadioButton.Visible = true;
            nextBtn1.Visible = true;
            welcomeLbl.Visible = false;
            metroPanel4.Visible = false;
            metroPanel2.Visible = false;
            metroPanel3.Visible = false;
        }

        private void historyToolstrip_Click(object sender, EventArgs e)
        {
            titleLabel.Text = "History";
            historyIndexTableAdapter.Fill(this.cSSDataSet4.historyIndex);
            metroPanel4.Visible = true;
            metroPanel3.Visible = false;
            metroPanel2.Visible = false;
            metroPanel1.Visible = false;
            historyGrid.Focus();
            historyGrid.Columns[2].HeaderCell.Style.Font = new Font("Segoe UI", 11f, FontStyle.Regular, GraphicsUnit.Pixel);
            historyGrid.Columns[5].DefaultCellStyle.Format = "mm'm 'ss'.'fff's'";
            historyGrid.Columns[6].DefaultCellStyle.Format = "0.00000000";
            historyGrid.Columns[7].DefaultCellStyle.Format = "mm'm 'ss'.'fff's'";
            for (int i = 0; i < historyGrid.Rows.Count; i++)
            {
                if (Convert.ToInt32(historyGrid.Rows[i].Cells[4].Value) == 1)
                {
                    historyGrid.Rows[i].Cells[4].Style.Format = "# 'month'";
                }
            }
        }

        private void historyGrid_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            history his = new history(historyGrid.SelectedCells);
            his.Show();
        }

        private void exitToolStrip_Click(object sender, EventArgs e)
        {
            if (dt.Rows.Count != 0)
            {
                if (MessageBox.Show("Are you sure you want to exit?", "Exit", MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.Yes)
                {
                    Environment.Exit(0);
                }
            }
            else
            {
                Environment.Exit(0);
            }
        }

        private void aboutToolStrip_Click(object sender, EventArgs e)
        {
            ab = new About();
            ab.ShowDialog();
        }
        public bool setActivePanel
        {
            get { return true; }
            set
            {
                metroPanel1.Visible = true;
                metroPanel3.Visible = false;
                mainMenu.Visible = true;
                System.Console.Write("Main Menu");
            }
        }
    }
}
