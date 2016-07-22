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
    public partial class History : MetroFramework.Forms.MetroForm
    {
        public History()
        {
            InitializeComponent();
            
        }

        private void metroPanel3_Paint(object sender, PaintEventArgs e)
        {
            Image img = new Bitmap(@"C:\Users\patricia\Documents\TA-Project\Prototype\TA-Project\Resources\CSAwb.png");
            e.Graphics.DrawImage(img, new Point(0, 0));
        }
    }
}
