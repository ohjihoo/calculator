using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Globalization;

namespace calculator
{
    public partial class Formmain : Form
    {
        public Formmain()
        {
            InitializeComponent();
        }

        private void Formmain_Load(object sender, EventArgs e)
        {
            this.MinimumSize = this.Size;
            labelDisplay.Text = "";
            labelDisplay.Text = "0";

            // 언어별 CultureInfo
            //en-US   영어(미국)
            //ko-KR   한국어(대한민국)
            //zh-CN   중국어(중국)
            //ja-JP   일본어(일본)
            //MessageBox.Show(CultureInfo.CurrentCulture.TextInfo.CultureName);
            if (CultureInfo.CurrentCulture.TextInfo.CultureName.Equals("ko-KR"))
            {
                comboBox2.SelectedIndex = 1;
            }
            else
            {
                comboBox2.SelectedIndex = 0;
            }
        }

        private void button0_Click(object sender, EventArgs e)
        {
            if (labelDisplay.Text.Equals("0"))
            {
                labelDisplay.Text = "";
            }

            labelDisplay.Text = labelDisplay.Text + ((Button)sender).Text;
            labelDisplay.Text = Int64.Parse(labelDisplay.Text.Trim().Replace(",", "")).ToString("#,##0");
        }

        private void buttonClear_Click(object sender, EventArgs e)
        {
            labelDisplay.Text = "";
            labelDisplay.Text = "0";
        }

        private void buttonDivision_Click(object sender, EventArgs e)
        {
            labelResult.Text = labelDisplay.Text.Replace(",","") + "/";
            labelDisplay.Text = "0";
        }

        private void buttonMultiply_Click(object sender, EventArgs e)
        {
            labelResult.Text = labelDisplay.Text.Replace(",", "") + "*";
            labelDisplay.Text = "0";
        }

        private void buttonPlus_Click(object sender, EventArgs e)
        {
            labelResult.Text = labelDisplay.Text.Replace(",", "") + "+";
            labelDisplay.Text = "0";

        }

        private void buttonMinus_Click(object sender, EventArgs e)
        {
            labelResult.Text = labelDisplay.Text.Replace(",", "") + "-";
            labelDisplay.Text = "0";
        }

        private void buttonResult_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(labelResult.Text) == false)
            {
                char op = labelResult.Text[labelResult.Text.Length - 1];
                string tempA = labelResult.Text.Remove(labelResult.Text.Length - 1);
                string tempB = labelDisplay.Text.Replace(",", "");
                int a = int.Parse(tempA);
                int b = int.Parse(tempB);
                double c = 0;
                if (op == '+')
                {
                    c = a + b;
                }
                else if(op=='-')
                    {

                    c = a - b;
                }
                else if (op == '*')
                {
                    c = a * b;
                }
                else if (op == '/')
                {
                    c = a/ b;
                }

                labelResult.Text = "";
                labelDisplay.Text = c.ToString("#,##0");               
            }
        }

        private void labelResult_Click(object sender, EventArgs e)
        {
            
        }
        private void Formmain_KeyDown(object sender, KeyEventArgs e)
        {
            switch (e.KeyCode)
            {
                case Keys.D0: { button0.PerformClick(); break; }
                case Keys.D1: { button1.PerformClick(); break; }
                case Keys.D2: { button2.PerformClick(); break; }
                case Keys.D3: { button3.PerformClick(); break; }
                case Keys.D4: { button4.PerformClick(); break; }
                case Keys.D5: { button5.PerformClick(); break; }
                case Keys.D6: { button6.PerformClick(); break; }
                case Keys.D7: { button7.PerformClick(); break; }
                case Keys.D8: { button8.PerformClick(); break; }
                case Keys.D9: { button9.PerformClick(); break; }
                default: { System.Console.WriteLine("Unknow keycode;{0}", e.KeyCode); }break;
            }
        }

        private void buttonAbout_Click(object sender, EventArgs e)
        {
            FormAbout f = new FormAbout();
            f.ShowDialog();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (comboBox2.SelectedIndex)
            {
                case 0: // 영어
                    {
                        Thread.CurrentThread.CurrentUICulture = CultureInfo.GetCultureInfo("en-US");
                    }
                    break;
                case 1: // 한국어
                    {
                        Thread.CurrentThread.CurrentUICulture = CultureInfo.GetCultureInfo("ko-KR");
                    }
                    break;
                case 2: // 중국어
                    {
                        Thread.CurrentThread.CurrentUICulture = CultureInfo.GetCultureInfo("zh-CN");
                    }
                    break;
                case 3: // 일본어
                    {
                        Thread.CurrentThread.CurrentUICulture = CultureInfo.GetCultureInfo("ja-JP");
                    }
                    break;
            }

            setLanguage();
        }


        private void setLanguage()
        {
            this.Text = Language.String1;
        }


    }
}
