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
    public partial class About : MetroFramework.Forms.MetroForm
    {
        public About()
        {
            InitializeComponent();
            metroTextBox1.AppendText("Hardy Septian Deli\n");
            metroTextBox1.AppendText("Tempat Lahir\t: Medan\n");
            metroTextBox1.AppendText("Tanggal Lahir\t: 21 Sept 1994\n");
            metroTextBox1.AppendText("Universitas\t: STMIK Mikroskil\n");
            metroTextBox2.AppendText("Klaudius Raymond Natio\n");
            metroTextBox2.AppendText("Tempat Lahir\t: Jakarta\n");
            metroTextBox2.AppendText("Tanggal Lahir\t: 03 Juni 1988\n");
            metroTextBox2.AppendText("Universitas\t: STMIK Mikroskil");
            pictureBox1.ImageLocation = "../../resources/Raymond.jpg";
            pictureBox2.ImageLocation = "../../resources/Hardy.jpg";
        }

        private void About_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (e.KeyChar == (char)Keys.Escape)
            {
                this.Hide();
            }
        }
    }
}
