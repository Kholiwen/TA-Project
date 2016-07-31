namespace TA_Project
{
    partial class columnSelectionForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.customerComboBox = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.purchasedateComboBox = new System.Windows.Forms.ComboBox();
            this.label3 = new System.Windows.Forms.Label();
            this.totalpurchaseComboBox = new System.Windows.Forms.ComboBox();
            this.button1 = new System.Windows.Forms.Button();
            this.customerIDComboBox = new System.Windows.Forms.ComboBox();
            this.custID = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(24, 112);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(82, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Customer Name";
            // 
            // customerComboBox
            // 
            this.customerComboBox.FormattingEnabled = true;
            this.customerComboBox.Location = new System.Drawing.Point(145, 109);
            this.customerComboBox.Name = "customerComboBox";
            this.customerComboBox.Size = new System.Drawing.Size(173, 21);
            this.customerComboBox.TabIndex = 0;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(24, 147);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(78, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "Purchase Date";
            // 
            // purchasedateComboBox
            // 
            this.purchasedateComboBox.FormattingEnabled = true;
            this.purchasedateComboBox.Location = new System.Drawing.Point(145, 144);
            this.purchasedateComboBox.Name = "purchasedateComboBox";
            this.purchasedateComboBox.Size = new System.Drawing.Size(173, 21);
            this.purchasedateComboBox.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(24, 182);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(91, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "Purchase Amount";
            // 
            // totalpurchaseComboBox
            // 
            this.totalpurchaseComboBox.FormattingEnabled = true;
            this.totalpurchaseComboBox.Location = new System.Drawing.Point(145, 179);
            this.totalpurchaseComboBox.Name = "totalpurchaseComboBox";
            this.totalpurchaseComboBox.Size = new System.Drawing.Size(173, 21);
            this.totalpurchaseComboBox.TabIndex = 2;
            this.totalpurchaseComboBox.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.totalpurchaseComboBox_KeyPress);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(27, 218);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(291, 31);
            this.button1.TabIndex = 3;
            this.button1.Text = "Confirm";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // customerIDComboBox
            // 
            this.customerIDComboBox.FormattingEnabled = true;
            this.customerIDComboBox.Location = new System.Drawing.Point(145, 74);
            this.customerIDComboBox.Name = "customerIDComboBox";
            this.customerIDComboBox.Size = new System.Drawing.Size(173, 21);
            this.customerIDComboBox.TabIndex = 0;
            // 
            // custID
            // 
            this.custID.AutoSize = true;
            this.custID.Location = new System.Drawing.Point(24, 77);
            this.custID.Name = "custID";
            this.custID.Size = new System.Drawing.Size(65, 13);
            this.custID.TabIndex = 0;
            this.custID.Text = "Customer ID";
            // 
            // columnSelectionForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(341, 262);
            this.ControlBox = false;
            this.Controls.Add(this.button1);
            this.Controls.Add(this.totalpurchaseComboBox);
            this.Controls.Add(this.purchasedateComboBox);
            this.Controls.Add(this.customerIDComboBox);
            this.Controls.Add(this.customerComboBox);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.custID);
            this.Controls.Add(this.label1);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Movable = false;
            this.Name = "columnSelectionForm";
            this.Resizable = false;
            this.ShadowType = MetroFramework.Forms.MetroFormShadowType.AeroShadow;
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Column Header Selection";
            this.TextAlign = MetroFramework.Forms.MetroFormTextAlign.Center;
            this.TopMost = true;
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox customerComboBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox purchasedateComboBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox totalpurchaseComboBox;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ComboBox customerIDComboBox;
        private System.Windows.Forms.Label custID;
    }
}