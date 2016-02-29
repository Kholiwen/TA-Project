using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ChartDirector;

namespace TA_Project
{
    public partial class mainForm : MetroFramework.Forms.MetroForm
    {
        public mainForm()
        {
            InitializeComponent();

            label1.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label2.Font = new Font("Tahoma", 11, FontStyle.Regular);
            label3.Font = new Font("Tahoma", 11, FontStyle.Regular);
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

        private void metroRadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (metroRadioButton1.Checked == true)
            {
                metroTextBox1.Visible = true;
                metroButton2.Visible = true;
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
                    }
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
    }
}
