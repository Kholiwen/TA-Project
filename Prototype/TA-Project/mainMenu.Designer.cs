namespace TA_Project
{
    partial class mainMenu
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
            this.startBtn = new MetroFramework.Controls.MetroButton();
            this.lastBtn = new MetroFramework.Controls.MetroButton();
            this.aboutButton = new MetroFramework.Controls.MetroButton();
            this.exitBtn = new MetroFramework.Controls.MetroButton();
            this.SuspendLayout();
            // 
            // startBtn
            // 
            this.startBtn.Location = new System.Drawing.Point(23, 63);
            this.startBtn.Name = "startBtn";
            this.startBtn.Size = new System.Drawing.Size(144, 125);
            this.startBtn.TabIndex = 0;
            this.startBtn.Text = "Start";
            this.startBtn.UseSelectable = true;
            this.startBtn.Click += new System.EventHandler(this.startBtn_Click);
            // 
            // lastBtn
            // 
            this.lastBtn.Location = new System.Drawing.Point(183, 63);
            this.lastBtn.Name = "lastBtn";
            this.lastBtn.Size = new System.Drawing.Size(144, 125);
            this.lastBtn.TabIndex = 1;
            this.lastBtn.Text = "Last Result";
            this.lastBtn.UseSelectable = true;
            // 
            // aboutButton
            // 
            this.aboutButton.Location = new System.Drawing.Point(23, 207);
            this.aboutButton.Name = "aboutButton";
            this.aboutButton.Size = new System.Drawing.Size(144, 125);
            this.aboutButton.TabIndex = 2;
            this.aboutButton.Text = "About";
            this.aboutButton.UseSelectable = true;
            // 
            // exitBtn
            // 
            this.exitBtn.Location = new System.Drawing.Point(183, 207);
            this.exitBtn.Name = "exitBtn";
            this.exitBtn.Size = new System.Drawing.Size(144, 125);
            this.exitBtn.TabIndex = 3;
            this.exitBtn.Text = "Exit";
            this.exitBtn.UseSelectable = true;
            this.exitBtn.Click += new System.EventHandler(this.exitBtn_Click);
            // 
            // mainMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(350, 355);
            this.ControlBox = false;
            this.Controls.Add(this.exitBtn);
            this.Controls.Add(this.aboutButton);
            this.Controls.Add(this.lastBtn);
            this.Controls.Add(this.startBtn);
            this.MaximizeBox = false;
            this.Name = "mainMenu";
            this.Resizable = false;
            this.Load += new System.EventHandler(this.mainMenu_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private MetroFramework.Controls.MetroButton startBtn;
        private MetroFramework.Controls.MetroButton lastBtn;
        private MetroFramework.Controls.MetroButton aboutButton;
        private MetroFramework.Controls.MetroButton exitBtn;
    }
}