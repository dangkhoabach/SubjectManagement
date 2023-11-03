namespace SubjectManagement_Client
{
    partial class FrmMain
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.menu = new System.Windows.Forms.ToolStripMenuItem();
            this.menuitMyCourses = new System.Windows.Forms.ToolStripMenuItem();
            this.menuitRegistration = new System.Windows.Forms.ToolStripMenuItem();
            this.pnlChild = new Guna.UI2.WinForms.Guna2GradientPanel();
            this.label1 = new System.Windows.Forms.Label();
            this.lbStudentID = new System.Windows.Forms.Label();
            this.picLogo = new Guna.UI2.WinForms.Guna2PictureBox();
            this.menuStrip1.SuspendLayout();
            this.pnlChild.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menu});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Padding = new System.Windows.Forms.Padding(4, 1, 0, 1);
            this.menuStrip1.Size = new System.Drawing.Size(1264, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // menu
            // 
            this.menu.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.menuitMyCourses,
            this.menuitRegistration});
            this.menu.Name = "menu";
            this.menu.Size = new System.Drawing.Size(50, 22);
            this.menu.Text = "Menu";
            // 
            // menuitMyCourses
            // 
            this.menuitMyCourses.Name = "menuitMyCourses";
            this.menuitMyCourses.Size = new System.Drawing.Size(183, 22);
            this.menuitMyCourses.Text = "Môn học đã đăng ký";
            this.menuitMyCourses.Click += new System.EventHandler(this.menuitMyCourses_Click);
            // 
            // menuitRegistration
            // 
            this.menuitRegistration.Name = "menuitRegistration";
            this.menuitRegistration.Size = new System.Drawing.Size(183, 22);
            this.menuitRegistration.Text = "Đăng ký môn học";
            this.menuitRegistration.Click += new System.EventHandler(this.menuitRegistration_Click);
            // 
            // pnlChild
            // 
            this.pnlChild.Controls.Add(this.picLogo);
            this.pnlChild.Location = new System.Drawing.Point(12, 27);
            this.pnlChild.Name = "pnlChild";
            this.pnlChild.Size = new System.Drawing.Size(1240, 590);
            this.pnlChild.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold);
            this.label1.Location = new System.Drawing.Point(12, 639);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(86, 19);
            this.label1.TabIndex = 4;
            this.label1.Text = "Sinh viên:";
            // 
            // lbStudentID
            // 
            this.lbStudentID.AutoSize = true;
            this.lbStudentID.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbStudentID.Location = new System.Drawing.Point(98, 639);
            this.lbStudentID.Name = "lbStudentID";
            this.lbStudentID.Size = new System.Drawing.Size(44, 18);
            this.lbStudentID.TabIndex = 5;
            this.lbStudentID.Text = "mssv";
            // 
            // picLogo
            // 
            this.picLogo.Image = global::SubjectManagement_Client.Properties.Resources.Hutech_LOGO;
            this.picLogo.ImageRotate = 0F;
            this.picLogo.Location = new System.Drawing.Point(0, 110);
            this.picLogo.Name = "picLogo";
            this.picLogo.Size = new System.Drawing.Size(1240, 366);
            this.picLogo.TabIndex = 0;
            this.picLogo.TabStop = false;
            // 
            // FrmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(1264, 681);
            this.Controls.Add(this.lbStudentID);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.pnlChild);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.MaximizeBox = false;
            this.Name = "FrmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "HUTECH XIN CHÀO";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.FrmMain_FormClosed);
            this.Load += new System.EventHandler(this.FrmMain_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.pnlChild.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picLogo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem menu;
        private System.Windows.Forms.ToolStripMenuItem menuitMyCourses;
        private System.Windows.Forms.ToolStripMenuItem menuitRegistration;
        private Guna.UI2.WinForms.Guna2GradientPanel pnlChild;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lbStudentID;
        private Guna.UI2.WinForms.Guna2PictureBox picLogo;
    }
}