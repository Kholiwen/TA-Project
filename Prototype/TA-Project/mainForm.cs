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
    public partial class mainForm : MetroFramework.Forms.MetroForm
    {
        public mainForm()
        {
            InitializeComponent();

            DataTable _table = new DataTable();
            _table.ReadXml(Application.StartupPath + @"\Data\test.xml");
            metroGrid1.DataSource = _table;

            metroGrid1.Font = new Font("Segoe UI", 11f, FontStyle.Regular, GraphicsUnit.Pixel);
        }

        private void metroRadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (metroRadioButton1.Checked == true)
            {
                metroLabel1.Visible = true;
                metroButton2.Visible = true;
            }
            else
            {
                metroLabel1.Visible = false;
                metroButton2.Visible = false;
            }
        }

        private void metroButton1_Click(object sender, EventArgs e)
        {
            metroTabControl1.SelectTab(metroTabPage2);
        }
    }
}
