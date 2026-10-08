using System;
using System.Drawing;
using System.Windows.Forms;

namespace Quản_lý_vật_tư
{
    public partial class Form1 : Form
    {
        private Panel panelLeft;
        private Panel panelRight;
        private Label lblTitleBrand;
        private Label lblTitleLogin;
        private Label lblUser;
        private Label lblPass;
        private TextBox txtUser;
        private TextBox txtPass;
        private Button btnLogin;
        private Button btnExit;

        public Form1()
        {
            InitializeComponent();
            SetupModernUI();
        }

        private void SetupModernUI()
        {
            // 1. Form chính
            this.Size = new Size(800, 450);
            this.StartPosition = FormStartPosition.CenterScreen;
            this.FormBorderStyle = FormBorderStyle.None;
            this.BackColor = Color.FromArgb(30, 30, 30);

            // 2. Panel Trái (Dock Left)
            panelLeft = new Panel();
            panelLeft.Dock = DockStyle.Left;
            panelLeft.Width = 350;
            panelLeft.BackColor = Color.FromArgb(28, 43, 77);

            lblTitleBrand = new Label();
            lblTitleBrand.Text = "HỆ THỐNG\nQUẢN LÝ KHO VẬT TƯ";
            lblTitleBrand.Font = new Font("Segoe UI", 16, FontStyle.Bold);
            lblTitleBrand.ForeColor = Color.White;
            lblTitleBrand.AutoSize = true;
            lblTitleBrand.Location = new Point(40, 150);
            panelLeft.Controls.Add(lblTitleBrand);

            // 3. Panel Phải (Dock Fill)
            panelRight = new Panel();
            panelRight.Dock = DockStyle.Fill;
            panelRight.BackColor = Color.FromArgb(37, 37, 38);

            lblTitleLogin = new Label();
            lblTitleLogin.Text = "ĐĂNG NHẬP";
            lblTitleLogin.Font = new Font("Segoe UI", 22, FontStyle.Bold);
            lblTitleLogin.ForeColor = Color.White;
            lblTitleLogin.AutoSize = true;
            lblTitleLogin.Location = new Point(120, 50);

            lblUser = new Label();
            lblUser.Text = "Tài khoản (Mã NV):";
            lblUser.Font = new Font("Segoe UI", 10, FontStyle.Regular);
            lblUser.ForeColor = Color.LightGray;
            lblUser.Location = new Point(50, 130);
            lblUser.AutoSize = true;

            txtUser = new TextBox();
            txtUser.Font = new Font("Segoe UI", 14, FontStyle.Regular);
            txtUser.Location = new Point(50, 160);
            txtUser.Width = 330;
            txtUser.BackColor = Color.FromArgb(50, 50, 52);
            txtUser.ForeColor = Color.White;
            txtUser.BorderStyle = BorderStyle.FixedSingle;

            lblPass = new Label();
            lblPass.Text = "Mật khẩu:";
            lblPass.Font = new Font("Segoe UI", 10, FontStyle.Regular);
            lblPass.ForeColor = Color.LightGray;
            lblPass.Location = new Point(50, 220);
            lblPass.AutoSize = true;

            txtPass = new TextBox();
            txtPass.Font = new Font("Segoe UI", 14, FontStyle.Regular);
            txtPass.Location = new Point(50, 250);
            txtPass.Width = 330;
            txtPass.BackColor = Color.FromArgb(50, 50, 52);
            txtPass.ForeColor = Color.White;
            txtPass.BorderStyle = BorderStyle.FixedSingle;
            txtPass.PasswordChar = '•';

            btnLogin = new Button();
            btnLogin.Text = "ĐĂNG NHẬP";
            btnLogin.Font = new Font("Segoe UI", 12, FontStyle.Bold);
            btnLogin.Location = new Point(50, 320);
            btnLogin.Size = new Size(330, 45);
            btnLogin.FlatStyle = FlatStyle.Flat;
            btnLogin.FlatAppearance.BorderSize = 0;
            btnLogin.BackColor = Color.FromArgb(0, 190, 150);
            btnLogin.ForeColor = Color.White;
            btnLogin.Cursor = Cursors.Hand;
            btnLogin.Click += BtnLogin_Click;

            btnExit = new Button();
            btnExit.Text = "THOÁT";
            btnExit.Font = new Font("Segoe UI", 10, FontStyle.Bold);
            btnExit.Location = new Point(50, 380);
            btnExit.Size = new Size(330, 40);
            btnExit.FlatStyle = FlatStyle.Flat;
            btnExit.FlatAppearance.BorderColor = Color.Gray;
            btnExit.BackColor = Color.Transparent;
            btnExit.ForeColor = Color.LightGray;
            btnExit.Cursor = Cursors.Hand;
            btnExit.Click += BtnExit_Click;

            // Nạp các phần tử vào Panel Phải
            panelRight.Controls.Add(lblTitleLogin);
            panelRight.Controls.Add(lblUser);
            panelRight.Controls.Add(txtUser);
            panelRight.Controls.Add(lblPass);
            panelRight.Controls.Add(txtPass);
            panelRight.Controls.Add(btnLogin);
            panelRight.Controls.Add(btnExit);

            // Nạp 2 Panel vào Form (Nạp Panel Trái trước để không bị đè)
            this.Controls.Add(panelLeft);
            this.Controls.Add(panelRight);

            // Ép Panel Trái nổi lên trên cùng để tránh lỗi hiển thị trắng form
            panelLeft.BringToFront();
        }

        private void BtnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUser.Text.Trim();
            string pass = txtPass.Text.Trim();

            if (user == "admin" && pass == "123")
            {
                MessageBox.Show("Đăng nhập thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sai tài khoản hoặc mật khẩu!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void BtnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
}