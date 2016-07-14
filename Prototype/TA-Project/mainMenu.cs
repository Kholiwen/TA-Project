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
    public partial class mainMenu : MetroFramework.Forms.MetroForm
    {
        public mainMenu()
        {
            InitializeComponent();
        }

        private void exitBtn_Click(object sender, EventArgs e)
        {
            System.Windows.Forms.Application.Exit();
        }

        private void startBtn_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form mainFrm = new mainForm();
            mainFrm.Show();
        }

        private void mainMenu_Load(object sender, EventArgs e)
        {   
            startBtn.Focus();
        }
    }
}
