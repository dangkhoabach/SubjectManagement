using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using Newtonsoft.Json;
using static TheArtOfDevHtmlRenderer.Adapters.RGraphicsPath;

namespace SubjectManagement_Server
{
    public partial class TCPServer : Form
    {
        private TcpListener server;
        private Thread listenerThread;
        string connectionString = "data source=DANGKHOABACH;initial catalog=SubjectManagementDB;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework";

        public TCPServer()
        {
            InitializeComponent();
        }

        private void btnServerStart_Click(object sender, EventArgs e)
        {
            server = new TcpListener(IPAddress.Any, 12345);
            listenerThread = new Thread(new ThreadStart(ListenForClients));
            listenerThread.Start();

            UpdateStatus("Server đã bắt đầu lắng nghe kết nối...");

            btnServerStart.Enabled = false;
        }

        private void ListenForClients()
        {
            server.Start();

            while (true)
            {
                TcpClient client = server.AcceptTcpClient();
                Thread clientThread = new Thread(new ParameterizedThreadStart(HandleClientComm));
                clientThread.Start(client);
            }
        }

        private void HandleClientComm(object clientObj)
        {
            TcpClient tcpClient = (TcpClient)clientObj;
            NetworkStream clientStream = tcpClient.GetStream();
            byte[] message = new byte[4096];
            int bytesRead;

            while (true)
            {
                bytesRead = 0;

                try
                {
                    bytesRead = clientStream.Read(message, 0, 4096);
                }
                catch
                {
                    break;
                }

                if (bytesRead == 0)
                    break;

                //Xử lý dữ liệu nhận được từ client (message)
                string data = Encoding.UTF8.GetString(message, 0, bytesRead);
                string[] request = data.Split('|');

                if (request.Length >= 3 && request[0] == "LOGIN")
                {
                    string studentID = request[1];
                    string password = request[2];

                    bool loginSuccess = CheckLoginFromDatabase(studentID, password);

                    string response = loginSuccess ? "LOGIN_SUCCESS" : "LOGIN_FAILED";
                    byte[] responseData = Encoding.UTF8.GetBytes(response);
                    clientStream.Write(responseData, 0, responseData.Length);
                    clientStream.Flush();
                }
                else if (request[0] == "QUERY")
                {
                    string studentID = request[1];
                    string query = request[2];
                    string response = ProcessQueryRequest(studentID, query);

                    byte[] responseData = Encoding.UTF8.GetBytes(response);
                    clientStream.Write(responseData, 0, responseData.Length);
                    clientStream.Flush();
                }
                else if (request[0] == "REGISTER")
                {
                    string studentID = request[1];
                    string subjectID = request[2];
                    string response = ProcessRegistrationRequest(studentID, subjectID);

                    byte[] responseData = Encoding.UTF8.GetBytes(response);
                    clientStream.Write(responseData, 0, responseData.Length);
                    clientStream.Flush();
                }
                else if (request[0] == "QUERY_REGISTERED_COURSES")
                {
                    string studentID = request[1];
                    DataTable registeredCourses = GetRegisteredCoursesFromDatabase(studentID);
                    DataTable courses = GetCoursesFromDatabase(registeredCourses);

                    //Chuyển đổi DataTable thành JSON và gửi về client
                    string response = JsonConvert.SerializeObject(courses);
                    byte[] responseData = Encoding.UTF8.GetBytes(response);
                    clientStream.Write(responseData, 0, responseData.Length);
                    clientStream.Flush();
                }
                else
                {
                    byte[] responseData = Encoding.UTF8.GetBytes("INVALID_REQUEST");
                    clientStream.Write(responseData, 0, responseData.Length);
                    clientStream.Flush();
                }
            }

            tcpClient.Close();
        }

        private void UpdateStatus(string message)
        {
            if (txtStatus.InvokeRequired)
            {
                txtStatus.Invoke(new Action<string>(UpdateStatus), new object[] { message });
            }
            else
            {
                txtStatus.AppendText(message + Environment.NewLine);
            }
        }

        private bool CheckLoginFromDatabase(string studentID, string password)
        {
            bool loginSuccess = false;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM Student WHERE StudentID = @StudentID AND Password = @Password";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StudentID", studentID);
                    command.Parameters.AddWithValue("@Password", password);

                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        loginSuccess = true;
                    }
                }
            }
            return loginSuccess;
        }

        private string ProcessQueryRequest(string studentID, string query)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string modifiedQuery = @"SELECT c.SubjectID, c.SubjectName, m.MajorsName, c.Credits, c.Lessons, c.Day, c.StartSlot, r.RoomName, i.InstructorName, c.PeriodStart
                                    FROM Courses c
                                    INNER JOIN Room r ON c.RoomID = r.RoomID
                                    INNER JOIN Instructors i ON c.InstructorID = i.InstructorID
                                    INNER JOIN Majors m ON c.MajorsID = m.MajorsID
                                    WHERE c.MajorsID = (SELECT MajorsID FROM Student WHERE StudentID = @studentid)
                                    ORDER BY c.PriorityLevel ASC";

                    using (SqlCommand command = new SqlCommand(modifiedQuery, connection))
                    {
                        command.Parameters.AddWithValue("@studentid", studentID);

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            DataTable dataTable = new DataTable();
                            dataTable.Load(reader);

                            // Chuyển DataTable thành chuỗi JSON để gửi về client
                            string jsonResult = JsonConvert.SerializeObject(dataTable);
                            return jsonResult;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return "ERROR: " + ex.Message;
            }
        }


        private string ProcessRegistrationRequest(string studentID, string subjectID)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string checkQuery = "SELECT COUNT(*) FROM RegisteredCourses WHERE StudentID = @StudentID AND SubjectID = @SubjectID";
                    using (SqlCommand checkCommand = new SqlCommand(checkQuery, connection))
                    {
                        checkCommand.Parameters.AddWithValue("@StudentID", studentID);
                        checkCommand.Parameters.AddWithValue("@SubjectID", subjectID);

                        int existingRegistrations = (int)checkCommand.ExecuteScalar();
                        if (existingRegistrations > 0)
                        {
                            return "Môn học này bạn đã đăng ký rồi!";
                        }
                    }

                    string query = "INSERT INTO RegisteredCourses (StudentID, SubjectID) VALUES (@StudentID, @SubjectID)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@StudentID", studentID);
                        command.Parameters.AddWithValue("@SubjectID", subjectID);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            return "REGISTRATION_SUCCESS";
                        }
                        else
                        {
                            return "REGISTRATION_FAILED";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                return "ERROR: " + ex.Message;
            }
        }

        private void TCPServer_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private DataTable GetRegisteredCoursesFromDatabase(string studentID)
        {
            DataTable registeredCourses = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM RegisteredCourses WHERE StudentID = @StudentID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StudentID", studentID);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    registeredCourses.Load(reader);
                }
            }
            return registeredCourses;
        }

        private DataTable GetCoursesFromDatabase(DataTable registeredCourses)
        {
            DataTable courses = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                List<string> subjectIDs = new List<string>();
                foreach (DataRow row in registeredCourses.Rows)
                {
                    subjectIDs.Add(row["SubjectID"].ToString());
                }

                string query = @"SELECT c.SubjectID, c.SubjectName, m.MajorsName, c.Credits, c.Lessons, c.Day, c.StartSlot, r.RoomName, i.InstructorName, c.PeriodStart 
                         FROM Courses c
                         INNER JOIN Majors m ON c.MajorsID = m.MajorsID
                         INNER JOIN Instructors i ON c.InstructorID = i.InstructorID
                         INNER JOIN Room r ON c.RoomID = r.RoomID
                         WHERE c.SubjectID IN ('" + string.Join("','", subjectIDs) + "') ORDER BY c.PriorityLevel ASC";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    courses.Load(reader);
                }
            }
            return courses;
        }

    }
}