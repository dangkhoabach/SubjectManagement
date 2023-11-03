using Newtonsoft.Json;
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
    public partial class FrmRegisteredCourses : Form
    {
        private TcpClient client;
        public FrmRegisteredCourses()
        {
            InitializeComponent();
        }

        private void FrmRegisteredCourses_Load(object sender, EventArgs e)
        {
            try
            {
                client = new TcpClient(IpServer.ipAddress, IpServer.port);
                NetworkStream clientStream = client.GetStream();

                string query = $"QUERY_REGISTERED_COURSES|{UserSession.StudentID}";
                byte[] data = Encoding.UTF8.GetBytes(query);
                clientStream.Write(data, 0, data.Length);

                data = new byte[4096];
                int bytesRead = clientStream.Read(data, 0, 4096);
                string jsonResponse = Encoding.UTF8.GetString(data, 0, bytesRead);

                //Chuyển chuỗi JSON thành DataTable và gán cho DataSource của DataGridView
                DataTable dataTable = JsonConvert.DeserializeObject<DataTable>(jsonResponse);

                dataTable.Columns["SubjectID"].ColumnName = "Mã học phần";
                dataTable.Columns["SubjectName"].ColumnName = "Tên học phần";
                dataTable.Columns["MajorsID"].ColumnName = "Chuyên nghành";
                dataTable.Columns["Credits"].ColumnName = "Số tín chỉ";
                dataTable.Columns["Lessons"].ColumnName = "Số tiết";
                dataTable.Columns["Day"].ColumnName = "Ngày học";
                dataTable.Columns["StartSlot"].ColumnName = "Tiết bắt đầu";
                dataTable.Columns["RoomID"].ColumnName = "Phòng học";
                dataTable.Columns["InstructorID"].ColumnName = "Giảng viên";
                dataTable.Columns["PeriodStart"].ColumnName = "Thời gian bắt đầu";
                /*dataTable.Columns["PeriodEnd"].ColumnName = "Thời gian kết thúc";
                dataTable.Columns["PriorityLevel"].ColumnName = "Mức độ ưu tiên";*/

                dgvRegisteredCourses.DataSource = dataTable;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi kết nối đến server: " + ex.Message);
            }
        }
    }
}
