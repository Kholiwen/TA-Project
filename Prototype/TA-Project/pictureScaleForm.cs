﻿using System;
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
    public partial class pictureScaleForm : MetroFramework.Forms.MetroForm
    {
        //Picture scale function\\
        public pictureScaleForm(Size sz,Point lc, string historyID, string picType)
        {
            InitializeComponent();
            if (picType == "criteria")
            {
                string filePath = "../screenshot/" + historyID + "_Criteria.jpg";
                pictureBox1.ImageLocation = filePath;
                pictureBox1.Size = sz;
                this.Size = sz;
                this.Location = new Point(lc.X - 100, lc.Y + 230);
            }
            else
            {
                string filePath = "../screenshot/" + historyID + "_Chart.jpg";
                pictureBox1.ImageLocation = filePath;
                pictureBox1.Size = sz;
                this.Size = sz;
                this.Location = new Point(lc.X + 275, lc.Y + 230);
            }
        }

        private void pictureScaleForm_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
