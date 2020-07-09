namespace calculator
{
    partial class FormAbout
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormAbout));
            this.labeIcon8 = new System.Windows.Forms.Label();
            this.labelVersion = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.linkicon8 = new System.Windows.Forms.LinkLabel();
            this.buttonOk = new System.Windows.Forms.Button();
            this.w = new System.Windows.Forms.Button();
            this.linkLabelUsermanual = new System.Windows.Forms.LinkLabel();
            this.SuspendLayout();
            // 
            // labeIcon8
            // 
            this.labeIcon8.AutoSize = true;
            this.labeIcon8.Font = new System.Drawing.Font("맑은 고딕", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.labeIcon8.Location = new System.Drawing.Point(101, 30);
            this.labeIcon8.Name = "labeIcon8";
            this.labeIcon8.Size = new System.Drawing.Size(69, 20);
            this.labeIcon8.TabIndex = 0;
            this.labeIcon8.Text = "버전공유";
            // 
            // labelVersion
            // 
            this.labelVersion.AutoSize = true;
            this.labelVersion.Font = new System.Drawing.Font("맑은 고딕", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.labelVersion.Location = new System.Drawing.Point(101, 54);
            this.labelVersion.Name = "labelVersion";
            this.labelVersion.Size = new System.Drawing.Size(83, 20);
            this.labelVersion.TabIndex = 0;
            this.labelVersion.Text = "버전:0.6.2.0";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(102, 89);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(130, 15);
            this.label3.TabIndex = 0;
            this.label3.Text = "(C)2020 오지후,all";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("맑은 고딕", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.label4.Location = new System.Drawing.Point(58, 172);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(436, 20);
            this.label4.TabIndex = 0;
            this.label4.Text = "이 프로그렙에서 사용한 이미지는 icon8 사이트의 이미지입니다";
            this.label4.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // linkicon8
            // 
            this.linkicon8.AutoSize = true;
            this.linkicon8.Font = new System.Drawing.Font("맑은 고딕", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.linkicon8.Location = new System.Drawing.Point(58, 214);
            this.linkicon8.Name = "linkicon8";
            this.linkicon8.Size = new System.Drawing.Size(152, 23);
            this.linkicon8.TabIndex = 1;
            this.linkicon8.TabStop = true;
            this.linkicon8.Text = "https://icons8.com";
            this.linkicon8.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkicon8_LinkClicked);
            // 
            // buttonOk
            // 
            this.buttonOk.Location = new System.Drawing.Point(419, 234);
            this.buttonOk.Name = "buttonOk";
            this.buttonOk.Size = new System.Drawing.Size(75, 23);
            this.buttonOk.TabIndex = 2;
            this.buttonOk.Text = "OK";
            this.buttonOk.UseVisualStyleBackColor = true;
            this.buttonOk.Click += new System.EventHandler(this.buttonOk_Click);
            // 
            // w
            // 
            this.w.Location = new System.Drawing.Point(338, 234);
            this.w.Name = "w";
            this.w.Size = new System.Drawing.Size(75, 23);
            this.w.TabIndex = 2;
            this.w.Text = "Cancel";
            this.w.UseVisualStyleBackColor = true;
            this.w.Click += new System.EventHandler(this.buttonOk_Click);
            // 
            // linkLabelUsermanual
            // 
            this.linkLabelUsermanual.AutoSize = true;
            this.linkLabelUsermanual.Font = new System.Drawing.Font("맑은 고딕", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(129)));
            this.linkLabelUsermanual.Location = new System.Drawing.Point(342, 27);
            this.linkLabelUsermanual.Name = "linkLabelUsermanual";
            this.linkLabelUsermanual.Size = new System.Drawing.Size(118, 23);
            this.linkLabelUsermanual.TabIndex = 3;
            this.linkLabelUsermanual.TabStop = true;
            this.linkLabelUsermanual.Text = "사용자 메뉴얼";
            this.linkLabelUsermanual.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.linkLabelUsermanual_LinkClicked);
            // 
            // FormAbout
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(512, 269);
            this.Controls.Add(this.linkLabelUsermanual);
            this.Controls.Add(this.w);
            this.Controls.Add(this.buttonOk);
            this.Controls.Add(this.linkicon8);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.labelVersion);
            this.Controls.Add(this.labeIcon8);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FormAbout";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "버전공유";
            this.Load += new System.EventHandler(this.FormAout_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labeIcon8;
        private System.Windows.Forms.Label labelVersion;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.LinkLabel linkicon8;
        private System.Windows.Forms.Button buttonOk;
        private System.Windows.Forms.Button w;
        private System.Windows.Forms.LinkLabel linkLabelUsermanual;
    }
}