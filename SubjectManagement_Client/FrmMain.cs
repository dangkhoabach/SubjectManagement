using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SubjectManagement_Client
{
    public partial class FrmMain : Form
    {
        public FrmMain()
        {
            InitializeComponent();
        }

        private void menuitRegistration_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FrmRegistration());
        }

        private void FrmMain_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        //ChildForm
        private Form currentFromChild;
        private void OpenChildForm(Form childForm)
        {
            if (currentFromChild != null)
            {
                currentFromChild.Close();
            }
            currentFromChild = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            pnlChild.Controls.Add(childForm);
            pnlChild.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }

        private void FrmMain_Load(object sender, EventArgs e)
        {
            lbStudentID.Text = UserSession.StudentID;

            int originalWidth = picLogo.Image.Width;
            int originalHeight = picLogo.Image.Height;
            int newWidth = originalWidth * 25 / 100;
            int newHeight = originalHeight * 25 / 100;

            picLogo.Image = new Bitmap(picLogo.Image, new Size(newWidth, newHeight));
            picLogo.SizeMode = PictureBoxSizeMode.CenterImage;
        }

        private void menuitMyCourses_Click(object sender, EventArgs e)
        {
            OpenChildForm(new FrmRegisteredCourses());
        }
    }
}
