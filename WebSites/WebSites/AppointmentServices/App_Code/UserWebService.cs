using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for UserWebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class UserWebService : System.Web.Services.WebService
{

    public UserWebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public List<String> adminLoginCheck(String name, String password)
    {

        List<String> adminInfo = null;
        String n = null;
        String p = null;
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("Select * from Admin where Username='" + name + "' and Password='" + password + "'", conn);
            int ID = (int)cmd.ExecuteScalar();
            String id = ID.ToString();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                //String id = (String)reader[0];
                adminInfo = new List<string>();
                n = (String)reader[1];
                p = (String)reader[2];
                adminInfo.Add(id);
                adminInfo.Add(n);
                adminInfo.Add(p);
                adminInfo.Add("success");
                return adminInfo;
            }
            else
            {
                adminInfo = new List<string>();
                adminInfo.Add("fail");
                return adminInfo;
            }
        }
        catch (Exception ex)
        {
            adminInfo = new List<string>();
            adminInfo.Add("fail");
            return adminInfo;
        }

    }

    [WebMethod]
    public int changeAdminPassword(int id, String oldpassword, String newpassword)
    {


        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        SqlCommand cm = new SqlCommand("update Admin set Password ='" + newpassword + "' where ID = '" + id + "' and Password= '" + oldpassword + "'", conn);
        int n = cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();

        return n;
    }
    [WebMethod]
    public int lecturerChangePassword(int id, String oldpassword, String newpassword)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        SqlCommand cm = new SqlCommand("update ProfessorAccount set Password ='" + newpassword + "' where LecturerID = '" + id + "' and Password= '" + oldpassword + "'", conn);
        int n = cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();

        return n;
    }

    [WebMethod]
    public int studentChangePassword(int id, String oldpassword, String newpassword)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        SqlCommand cm = new SqlCommand("update StudentAccount set Password ='" + newpassword + "' where StudentID = '" + id + "' and Password= '" + oldpassword + "'", conn);
        int n = cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();

        return n;
    }

    [WebMethod]
    public Boolean checkSUsername(String username)
    {
        Boolean b = false;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "select * from StudentAccount where Username ='" + username + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        if (reader.HasRows)
        {
            b = true;
            return b;
        }
        else
        {

            return b;
        }
    }

    [WebMethod]
    public Boolean checkPUsername(String username)
    {
        Boolean b = false;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "select * from ProfessorAccount where Username ='" + username + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        if (reader.HasRows)
        {
            b = true;
            return b;
        }
        else
        {

            return b;
        }
    }

    [WebMethod]
    public int studentRegistration(int sid, String name, String password)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Insert into StudentAccount values('" + sid + "','" + name + "','" + password + "')";
        SqlCommand cmd = new SqlCommand(query, conn);
        int n = cmd.ExecuteNonQuery();
        return n;
    }

    [WebMethod]
    public int professorRegistration(int pid, String name, String password)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Insert into ProfessorAccount values('" + pid + "','" + name + "','" + password + "')";
        SqlCommand cmd = new SqlCommand(query, conn);
        int n = cmd.ExecuteNonQuery();
        return n;
    }
    [WebMethod]
    public int addStudentInfo(int sid, String name, int cid, String email, String mobile)
    {
        int n = 3;
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
            conn.Open();
            String query = "select * from Student where StudentID='" + sid + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            //String s = (String)cmd.ExecuteScalar();
            SqlDataReader reader = cmd.ExecuteReader();


            reader.Read();
            if (reader.HasRows)
            {
                conn.Dispose();
                //reader.Dispose();
                //reader.Close();
                conn.Close();
                return n;

            }
            else
            {
                reader.Dispose();
                reader.Close();

                //SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
                //conn1.Open();
                String query1 = "Insert into Student values('" + sid + "','" + name + "','" + cid + "','" + email + "','" + mobile + "')";
                SqlCommand cmd1 = new SqlCommand(query1, conn);
                n = cmd1.ExecuteNonQuery();
                conn.Dispose();
                conn.Close();
                //conn1.Dispose();

                // conn1.Close();
                return n;

            }
        }
        catch (Exception ex)
        {
            n = 2;
            return n;
        }
    }


    [WebMethod]
    public int addProfessorInfo(int pid, String name, int did, String email, String mobile)
    {
        int n = 3;
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
            conn.Open();
            String query = "select * from Professor where LecturerID='" + pid + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            //String s = (String)cmd.ExecuteScalar();
            SqlDataReader reader = cmd.ExecuteReader();


            reader.Read();
            if (reader.HasRows)
            {
                conn.Dispose();
                //reader.Dispose();
                //reader.Close();
                conn.Close();
                return n;

            }
            else
            {
                reader.Dispose();
                reader.Close();

                //SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
                //conn1.Open();
                String query1 = "Insert into Professor values('" + pid + "','" + name + "','" + did + "','" + email + "','" + mobile + "')";
                SqlCommand cmd1 = new SqlCommand(query1, conn);
                n = cmd1.ExecuteNonQuery();
                conn.Dispose();
                conn.Close();
                //conn1.Dispose();

                // conn1.Close();
                return n;

            }
        }
        catch (Exception ex)
        {
            n = 2;
            return n;
        }
    }

    [WebMethod]
    public List<String> LecturerLoginCheck(String name, String pwd)
    {
        List<String> list = new List<string>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("Select LecturerID,Username from ProfessorAccount where Username='" + name + "' and Password='" + pwd + "'", conn);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        String id = reader["LecturerID"].ToString();
        String username = reader["Username"].ToString();
        list.Add(id);
        list.Add(username);
        return list;
    }

    [WebMethod]
    public List<String> StudentLoginCheck(String name, String pwd)
    {
        List<String> list = new List<string>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand("Select StudentID,Username from StudentAccount where Username='" + name + "' and Password='" + pwd + "'", conn);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        String id = reader["StudentID"].ToString();
        String username = reader["Username"].ToString();
        list.Add(id);
        list.Add(username);
        return list;
    }


    [WebMethod]
    public int changeLecturerPassword(int id, String oldpassword, String newpassword)
    {


        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        SqlCommand cm = new SqlCommand("update ProfessorAccount set Password ='" + newpassword + "' where ID = '" + id + "' and Password= '" + oldpassword + "'", conn);
        int n = cm.ExecuteNonQuery();
        cm.Dispose();
        conn.Close();

        return n;
    }

    [WebMethod]
    public int setNonWorkingDays(DateTime t)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Insert into Calendar values('" + t + "')";
        SqlCommand cmd = new SqlCommand(query, conn);
        int n = cmd.ExecuteNonQuery();
        return n;
    }

    [WebMethod]
    public int deleteNonWorkingDays(DateTime t)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Delete from Calendar where Nonworkingday='" + t + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        int n = cmd.ExecuteNonQuery();
        return n;
    }
    [WebMethod]
    public List<DateTime> getNonNonWorkingDays()
    {
        List<DateTime> list = new List<DateTime>(); ;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Select * from Calendar";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {

            list.Add((DateTime)reader["Nonworkingday"]);
        }
        return list;
    }
    [WebMethod]
    public List<String> getDepartment(int id)
    {
        List<String> list = new List<String>(); ;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Select Department.DepartmentID,Department.Name  from Department,Professor where Department.DepartmentID = (Select DepartmentID from Professor where LecturerID='" + id + "')";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();

        while (reader.Read())
        {

            list.Add((String)reader["Name"]);
        }
        return list;
    }
    [WebMethod]
    public int setappointmenttime(int id, DateTime date, DateTime starttime, int duration, int vol, String restriction, int sid)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Insert into AppointmentTimeTable values('" + id + "','" + date + "','" + starttime + "','" + duration + "','" + vol + "','" + restriction + "','" + sid + "')";
        SqlCommand cmd = new SqlCommand(query, conn);
        int n = cmd.ExecuteNonQuery();
        return n;
    }

    [WebMethod]
    public int makeStudentAppointment(int aid, int sid, String subject, DateTime st, DateTime et, int asid)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Insert into Appointment values('" + aid + "','" + sid + "','" + subject + "','" + st + "','" + et + "','" + asid + "')";
        SqlCommand cmd = new SqlCommand(query, conn);
        int n = cmd.ExecuteNonQuery();
        return n;
    }
    [WebMethod]
    public int getAppointmentID(int pid, DateTime dt)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Select ID from AppointmentTimeTable where LecturerID ='" + pid + "' AND Date = '" + dt + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        int id = Int32.Parse(reader[0].ToString());
        return id;
    }

    [WebMethod]
    public String getStudentNameById(int id)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Select Name from Student where StudentID ='" + id + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        String name = reader[0].ToString();
        return name;
    }

    [WebMethod]
    public List<String> getNonRegisteredStudentId()
    {
        List<String> al = new List<String>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Select StudentAccount.StudentID from StudentAccount Where StudentAccount.StudentID NOT IN (Select Student.StudentID From Student) ";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            
            al.Add(reader[0].ToString());


        }
        return al;
    }

    [WebMethod]
    public List<String> getNonRegisteredProfessorId()
    {
        List<String> al = new List<String>();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["AppointmentDatabase"].ConnectionString);
        conn.Open();
        String query = "Select ProfessorAccount.LecturerID from ProfessorAccount Where ProfessorAccount.LecturerID NOT IN (Select Professor.LecturerID From Professor) ";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {

            al.Add(reader[0].ToString());


        }
        return al;
    }
}
    

    

    

