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

            metroGrid1.Font = new Font("Segoe UI", 11f, FontStyle.Regular, GraphicsUnit.Pixel);

            //chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            chart1.ChartAreas[0].Area3DStyle.Enable3D = true;
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
                textBox1.Text = "3";
                //SqlConnection myConnection;
                SqlCommand command = new SqlCommand();
                //string connectionString = "Data Source=IT\SQLEXPRESS;Initial Catalog=CSS;Persist Security Info=True;User ID=sa;Password=sql12345";
                string query = "SELECT TOP 3 FROM custClass";
                //myConnection = new SqlConnection(connectionString);
                command.CommandText = query;
                command.CommandType = CommandType.Text;
                //command.Connection = myConnection;
                custClassTableAdapter.ClearBeforeFill = true;
                custClassTableAdapter.Adapter.SelectCommand = command;
                custClassTableAdapter.Adapter.Fill(cSSDataSet1.custClass);
            }
        }
    }
}
