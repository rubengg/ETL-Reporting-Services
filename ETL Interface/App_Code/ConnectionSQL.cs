using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// This class has the connection to SQL Server
/// and methods to excecute querys
/// </summary>
public class ConnectionSQL
{
    String connection = "Data Source=EQUIPOC02;Integrated Security=SSPI;Initial Catalog=\"ETL Reporting Services\"";
    SqlConnection SQLConect;

	public ConnectionSQL(){}
    /*Open and close connection*/
    public void openConnection()
    {
        SQLConect = new SqlConnection(connection);
        try { SQLConect.Open(); }
        catch (Exception ex){   throw (ex); }
    }
    public void closeConnection()
    {
        try { SQLConect.Close(); }
        catch (Exception ex) { throw (ex); }
    }
    /*Querys*/
    public String addCustomer(String query, String customer)
    {
        String response = null;
        SqlCommand cmd = new SqlCommand(query, SQLConect);
        try
        {
            cmd.ExecuteNonQuery();
            response = "The " + customer + " was saved successfully";
            closeConnection();
        }
        catch (SqlException)
        {
            response = "Had and error saving " + customer;
            closeConnection();
        }
        return response;
    }
    public String deleteCustomer(String q1, String q2, String customer)
    {
        String response = null;
        try
        {
            SqlCommand cmd1 = new SqlCommand(q1, SQLConect);
            SqlCommand cmd2 = new SqlCommand(q2, SQLConect);
            cmd1.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            response = "The " + customer + " was deleted successfully";
            closeConnection();
        }
        catch (SqlException)
        {
            response = "Had an error saving " + customer;
            SQLConect.Close();
        }
        return response;
    }
    public String addLocation(String query, String location)
    {
        String response = null;
        SqlCommand cmd = new SqlCommand(query, SQLConect);
        try
        {
            cmd.ExecuteNonQuery();
            response = "The " + location + " was saved successfully";
            closeConnection();
        }
        catch (SqlException)
        {
            response = "Had an error saving " + location;
            closeConnection();
        }
        return response;
    }
    public String addGroup(String query, String group)
    {
        String response = null;
        try
        {
            SqlCommand cmd = new SqlCommand(query, SQLConect);
            cmd.ExecuteNonQuery();
            response = "The " + group + " was saved successfully";
            SQLConect.Close();
        }
        catch(SqlException)
        {
            response = "The group " + group + " already exist.\nMake sure it isn't hide";
            closeConnection();
        }
        return response;
    }
    public int countGroupNull(String query)
    {
        int response = 0;
        try
        {
            openConnection();
            SqlCommand cmd = new SqlCommand(query, SQLConect);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            response = Convert.ToInt32(reader["counter"]);
            SQLConect.Close();
        }
        catch (SqlException){   closeConnection();  }
        return response;
    }
}