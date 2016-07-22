namespace TA_Project
{
    partial class History
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
            this.historydetailPanel = new MetroFramework.Controls.MetroPanel();
            this.criteriahistoryPanel = new MetroFramework.Controls.MetroPanel();
            this.charthistoryPanel = new MetroFramework.Controls.MetroPanel();
            this.SuspendLayout();
            // 
            // historydetailPanel
            // 
            this.historydetailPanel.HorizontalScrollbarBarColor = true;
            this.historydetailPanel.HorizontalScrollbarHighlightOnWheel = false;
            this.historydetailPanel.HorizontalScrollbarSize = 10;
            this.historydetailPanel.Location = new System.Drawing.Point(37, 48);
            this.historydetailPanel.Name = "historydetailPanel";
            this.historydetailPanel.Size = new System.Drawing.Size(740, 222);
            this.historydetailPanel.TabIndex = 0;
            this.historydetailPanel.VerticalScrollbarBarColor = true;
            this.historydetailPanel.VerticalScrollbarHighlightOnWheel = false;
            this.historydetailPanel.VerticalScrollbarSize = 10;
            // 
            // criteriahistoryPanel
            // 
            this.criteriahistoryPanel.HorizontalScrollbarBarColor = true;
            this.criteriahistoryPanel.HorizontalScrollbarHighlightOnWheel = false;
            this.criteriahistoryPanel.HorizontalScrollbarSize = 10;
            this.criteriahistoryPanel.Location = new System.Drawing.Point(37, 288);
            this.criteriahistoryPanel.Name = "criteriahistoryPanel";
            this.criteriahistoryPanel.Size = new System.Drawing.Size(361, 305);
            this.criteriahistoryPanel.TabIndex = 1;
            this.criteriahistoryPanel.VerticalScrollbarBarColor = true;
            this.criteriahistoryPanel.VerticalScrollbarHighlightOnWheel = false;
            this.criteriahistoryPanel.VerticalScrollbarSize = 10;
            // 
            // charthistoryPanel
            // 
            this.charthistoryPanel.HorizontalScrollbarBarColor = true;
            this.charthistoryPanel.HorizontalScrollbarHighlightOnWheel = false;
            this.charthistoryPanel.HorizontalScrollbarSize = 10;
            this.charthistoryPanel.Location = new System.Drawing.Point(413, 288);
            this.charthistoryPanel.Name = "charthistoryPanel";
            this.charthistoryPanel.Size = new System.Drawing.Size(364, 305);
            this.charthistoryPanel.TabIndex = 2;
            this.charthistoryPanel.VerticalScrollbarBarColor = true;
            this.charthistoryPanel.VerticalScrollbarHighlightOnWheel = false;
            this.charthistoryPanel.VerticalScrollbarSize = 10;
            this.charthistoryPanel.Paint += new System.Windows.Forms.PaintEventHandler(this.metroPanel3_Paint);
            // 
            // History
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackImagePadding = new System.Windows.Forms.Padding(8, 7, 0, 0);
            this.BackMaxSize = 45;
            this.ClientSize = new System.Drawing.Size(800, 600);
            this.Controls.Add(this.charthistoryPanel);
            this.Controls.Add(this.criteriahistoryPanel);
            this.Controls.Add(this.historydetailPanel);
            this.Name = "History";
            this.ResumeLayout(false);

        }

        #endregion

        private MetroFramework.Controls.MetroPanel historydetailPanel;
        private MetroFramework.Controls.MetroPanel criteriahistoryPanel;
        private MetroFramework.Controls.MetroPanel charthistoryPanel;
    }
}