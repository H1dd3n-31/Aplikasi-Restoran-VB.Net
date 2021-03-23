Imports System.Data.Odbc
Public Class KonfirmasiMenu

    Dim chk As CheckBox


    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Me.Close()

    End Sub


    Sub kodeotomatisorder()

        Call koneksi()
        cmd = New OdbcCommand("select * from tbl_order where KodePesan in(select max(KodePesan) from tbl_order)", conn)
        dr = cmd.ExecuteReader
        Dim urutan As String
        Dim hitung As Long
        dr.Read()
        If Not dr.HasRows Then

            kodepesanan.Text = "2020" + "0001"




        Else

            hitung = Microsoft.VisualBasic.Right(dr.GetString(0), 8) + 1
            urutan = "2020" + Microsoft.VisualBasic.Right("0001" & hitung, 8)

        End If

        kodepesanan.Text = hitung

    End Sub

    Private Sub KonfirmasiMenu_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Call kodeotomatisorder()
        NmPelanggan.Text = Form_Pilih_Meja.TextBox1.Text
        NMeja.Text = Form_Pilih_Meja.ComboBox1.Text

        TextBox1.Text = Menu_Makanan.TextBox11.Text + Menu_Makanan.TextBox14.Text
        TextBox2.Text = Menu_Makanan.TextBox12.Text + Menu_Makanan.TextBox15.Text
        TextBox3.Text = Menu_Makanan.TextBox13.Text + Menu_Makanan.TextBox16.Text
        TextBox4.Text = Menu_Makanan.TextBox21.Text

        

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim insert As String = "insert tbl_order values( '" & kodepesanan.Text & "','" & NmPelanggan.Text & "','" & NMeja.Text & "','" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox4.Text & "')"
        cmd = New OdbcCommand(insert, conn)
        cmd.ExecuteNonQuery()
        MsgBox("Data anda sudah di simpan")
        Me.Close()

    End Sub


End Class