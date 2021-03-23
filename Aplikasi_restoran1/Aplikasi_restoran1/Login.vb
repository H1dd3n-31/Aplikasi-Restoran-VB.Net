Imports System.Data.Odbc
Public Class Login

    Sub kondisiawal()

        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""

    End Sub


    Sub statustrip()


        MenuUtama.ToolStripStatusLabel2.Text = dr!Nama
        'MenuUtama.ToolStripStatusLabel4.Text = TimeOfDay
        MenuUtama.ToolStripStatusLabel6.Text = dr!Prioritas



    End Sub


   
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Close()

    End Sub


    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Call Pendaftaran.Show()
        Me.Close()
    End Sub

    Private Sub TextBox2_KeyPress(sender As Object, e As KeyPressEventArgs) Handles TextBox2.KeyPress
        If e.KeyChar = Chr(13) Then

            Call koneksi()
            cmd = New OdbcCommand("select * from tbl_daftar where KodePendaftaran='" & TextBox1.Text & "' and Password= '" & TextBox2.Text & "'", conn)
            dr = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then

                TextBox3.Text = dr!Prioritas

            End If

        End If
    End Sub

 


    Private Sub Login_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Call kondisiawal()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If TextBox1.Text = "" Or TextBox2.Text = "" Then

            MsgBox(" Kolom data wajib di isi broo!!")


        Else

            Call koneksi()
            cmd = New OdbcCommand("select * from tbl_daftar where KodePendaftaran='" & TextBox1.Text & "' and Password= '" & TextBox2.Text & "'", conn)
            dr = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then

                If TextBox3.Text = "Pelayan" Then


                    MenuUtama.PelayanToolStripMenuItem.Enabled = True
                    MenuUtama.KasirToolStripMenuItem.Enabled = False
                    MenuUtama.ManagerToolStripMenuItem.Enabled = False
                    MenuUtama.LogoutToolStripMenuItem.Enabled = True
                    MenuUtama.LoginToolStripMenuItem.Enabled = False
                    Call statustrip()
                    Call kondisiawal()
                    Me.Close()

                ElseIf TextBox3.Text = "Manager" Then

                    MenuUtama.PelayanToolStripMenuItem.Enabled = False
                    MenuUtama.KasirToolStripMenuItem.Enabled = False
                    MenuUtama.ManagerToolStripMenuItem.Enabled = True
                    MenuUtama.LogoutToolStripMenuItem.Enabled = True
                    MenuUtama.LoginToolStripMenuItem.Enabled = False
                    Call statustrip()
                    Call kondisiawal()
                    Me.Close()

                ElseIf TextBox3.Text = "Kasir" Then

                    MenuUtama.PelayanToolStripMenuItem.Enabled = False
                    MenuUtama.KasirToolStripMenuItem.Enabled = True
                    MenuUtama.ManagerToolStripMenuItem.Enabled = False
                    MenuUtama.LogoutToolStripMenuItem.Enabled = True
                    MenuUtama.LoginToolStripMenuItem.Enabled = False
                    Call statustrip()
                    Call kondisiawal()
                    Me.Close()


                End If

            Else

                MsgBox("username dan password anda salah broo!!")
                Call kondisiawal()

            End If


        End If
    End Sub

    Private Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            TextBox2.PasswordChar = ""
        Else
            TextBox2.PasswordChar = "*"

        End If
    End Sub
End Class