using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class EmailConfiguration : System.Web.UI.Page
{
    String filename = @"\\EQUIPOC02\Users\gcastillos\Desktop\ETL\project_integration_services\ETL Interface\toMails.txt";

    protected void Page_Load(object sender, EventArgs e)
    {
        readEmail();        
    }
    /*
     * Remove the cell that is the same with the button's ID
     */
    void btnClickDelete(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        //Save all emails in a array
        String[] emails = File.ReadAllLines(filename);
        //Delete all of information
        using (StreamWriter sw = File.CreateText(filename))
        {
            sw.Write("");
        }
        //Write all of emails except that one
        //has to be removed.
        for (int i = 0; i < emails.Length; i++)
        {  
            if (!emails[i].Equals(btn.ID.ToString()))
            {
                using (StreamWriter sw = File.AppendText(filename))
                {
                    sw.WriteLine(emails[i]);
                    sw.Close();
                }
            }
        }
        //Refresh
        readEmail();
    }
    /*
     * Read the file with the emails
     * and shows it in a table.
     */
    private void readEmail()
    {
        String[] emails = File.ReadAllLines(filename);
        //Clear table
        tableemail.Controls.Clear();
        for (int i = 0; i < emails.Length; i++)
        {
            //Crete new cells, one for the info and the other for the button 'Delete'
            TableCell cellemail = new TableCell();
            TableCell cellbtn = new TableCell();
            cellemail.Text = emails[i];
            Button btn = new Button();
            btn.Text = "Delete";
            //Create an ID for the button
            btn.ID = emails[i];
            //Create the listener at the button
            btn.Attributes.Add("onclick", "javascript:return " + "Confirm('Do you want to delete " + btn.ID.ToString() + "?')");
            btn.Click += new EventHandler(btnClickDelete);
            cellbtn.Controls.Add(btn);
            //Show the components
            TableRow row = new TableRow();
            row.Controls.Add(cellemail);
            row.Controls.Add(cellbtn);
            tableemail.Controls.Add(row);
        }
        
    }
    /*
     * Add a new email at the list.
     */
    protected void Button1_Click(object sender, EventArgs e)
    {
        String newemail = txtemail.Text;
        //opens the file, writes the new email
        //and calls the method
        //'readEmail() to show refresh the info'
        using (StreamWriter sw = File.AppendText(filename))
        {
            sw.WriteLine(newemail);
            sw.Close();
            readEmail();
        }
    }
}