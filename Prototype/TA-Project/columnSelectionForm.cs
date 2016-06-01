using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace TA_Project
{
    public partial class columnSelectionForm : MetroFramework.Forms.MetroForm
    {
        public string customerHeader { get; set; }
        public string purchasedateHeader { get; set; }
        public string totalpurchaseHeader { get; set; }
        public columnSelectionForm(DataTable dt)
        {
            InitializeComponent();
            for (int i = 0; i < dt.Columns.Count; i++)
            {
                customerComboBox.Items.Add(dt.Columns[i].Caption);
                purchasedateComboBox.Items.Add(dt.Columns[i].Caption);
                totalpurchaseComboBox.Items.Add(dt.Columns[i].Caption);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (customerComboBox.SelectedItem != null && purchasedateComboBox.SelectedItem != null && totalpurchaseComboBox.SelectedItem != null)
            {
                this.customerHeader = customerComboBox.SelectedItem.ToString();
                this.purchasedateHeader = purchasedateComboBox.SelectedItem.ToString();
                this.totalpurchaseHeader = totalpurchaseComboBox.SelectedItem.ToString();
                this.DialogResult = DialogResult.OK;
            }
            else
            {
                MessageBox.Show("Please select the header");
            }
        }
    }
}
