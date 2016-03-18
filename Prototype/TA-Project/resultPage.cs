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
    public partial class resultPage : MetroFramework.Forms.MetroForm
    {
        public resultPage()
        {
            InitializeComponent();
            Label label1 = new Label();
            Label label2 = new Label();
            Label label3 = new Label();
            Label label4 = new Label();
            label1.Text = "Customer Name";
            label2.Text = "RFM Cluster Value";
            label3.Text = "Customer Class";
            label4.Text = "Strategy Recommendation";
            tableLayoutPanel1.Controls.Add(label1);
            tableLayoutPanel1.Controls.Add(label2);
            tableLayoutPanel1.Controls.Add(label3);
            tableLayoutPanel1.Controls.Add(label4);
        }
    }
}
