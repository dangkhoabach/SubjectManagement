using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SubjectManagement_Client
{
    public partial class FrmLogin : Form
    {
        private TcpClient client;

        public FrmLogin()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                client = new TcpClient(IpServer.ipAddress, 12345);

                NetworkStream clientStream = client.GetStream();
                byte[] message = Encoding.ASCII.GetBytes($"LOGIN|{txtStudentID.Text}|{txtPassword.Text}");
                clientStream.Write(message, 0, message.Length);
                clientStream.Flush();

                byte[] buffer = new byte[4096];
                int bytesRead = clientStream.Read(buffer, 0, 4096);
                string response = Encoding.ASCII.GetString(buffer, 0, bytesRead);

                //Xử lý kết quả từ server
                if (response == "LOGIN_SUCCESS")
                {
                    UserSession.StudentID = txtStudentID.Text;

                    FrmMain frmMain = new FrmMain();
                    frmMain.Show();
                    this.Hide();
                }

                else
                {
                    MessageBox.Show("Sai thông tin đăng nhập. Vui lòng thử lại.");
                }

                client.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi kết nối đến server: " + ex.Message);
            }
        }

        private void txtStudentID_KeyPress(object sender, KeyPressEventArgs e)
        {
            //Chỉ cho phép nhập các ký tự số
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void FrmLogin_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
