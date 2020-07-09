using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace calculator
{
    public partial class FormAbout : Form
    {
        public FormAbout()
        {
            InitializeComponent();
        }

        private void FormAout_Load(object sender, EventArgs e)
        {
            Assembly assembly = Assembly.GetExecutingAssembly();
            AssemblyFileVersionAttribute assemblyFileVersion = assembly.GetCustomAttributes(typeof(AssemblyFileVersionAttribute), false)[0] as AssemblyFileVersionAttribute;
            labelVersion.Text = "Version: " + assemblyFileVersion.Version;

            this.Text = "About " + Language.String1;
            labeIcon8.Text = Language.String1;

            label3.Text = Language.String4 + ": " + assemblyFileVersion.Version;
            label4.Text = Language.String5;
        }

        private void buttonOk_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void linkicon8_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            {
                try
                {
                    VisitLink();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(string.Format("Unable to open link that was clicked.\n{0}", ex.Message), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void VisitLink()
        {
            // Change the color of the link text by setting LinkVisited
            // to true.
            linkicon8.LinkVisited = true;
            //Call the Process.Start method to open the default browser
            //with a URL:
            System.Diagnostics.Process.Start(linkicon8.Text);
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void linkLabelUsermanual_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            // Change the color of the link text by setting LinkVisited
            // to true.
            linkicon8.LinkVisited = true;
            //Call the Process.Start method to open the default browser
            //with a URL:
            System.Diagnostics.Process.Start("https://docs.google.com/presentation/d/e/2PACX-1vRVff26GQM9PRyZj59W-u90qXxaAtlzbZ9Ao0eyOIUw0OYOfTydJz6mhllcgs2-PT2SUgK4QjjkyD8x/pub?start=false&loop=false&delayms=3000");
        }
    }
}
