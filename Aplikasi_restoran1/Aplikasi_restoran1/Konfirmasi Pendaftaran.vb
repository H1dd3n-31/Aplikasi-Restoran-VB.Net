Imports System.Data.Odbc
Public Class Konfirmasi_Pendaftaran
    Sub kodeotomatisUsername()

        Call koneksi()
        cmd = New OdbcCommand("select * from tbl_daftar where KodePendaftaran in(select max(KodePendaftaran) from tbl_daftar)", conn)
        dr = cmd.ExecuteReader
        Dim urutan As String
        Dim hitung As Long
        dr.Read()
        If Not dr.HasRows Then

            Username.Text = "2010" + "1001"

        Else

            hitung = Microsoft.VisualBasic.Right(dr.GetString(0), 8) + 1
            urutan = "2010" + Microsoft.VisualBasic.Right("0000" & hitung, 8)

        End If

        Username.Text = hitung



    End Sub


    Sub kodeotomatisPassword()

        Call koneksi()
        cmd = New OdbcCommand("select * from tbl_daftar where Password in(select max(Password) from tbl_daftar)", conn)
        dr = cmd.ExecuteReader
        Dim urutan1 As String
        Dim hitung1 As Long
        dr.Read()
        If Not dr.HasRows Then

            Password.Text = "2020" + "01"

        Else

            hitung1 = Microsoft.VisualBasic.Right(dr.GetString(0), 7) + 1
            urutan1 = "2020" + Microsoft.VisualBasic.Right("00" & hitung1, 9)

        End If


        Password.Text = hitung1
        Button1.Focus()


    End Sub


    Sub coba()


        Call koneksi()
        cmd = New OdbcCommand("select * from tbl_daftar", conn)
        dr = cmd.ExecuteReader
        dr.Read()
        If dr.HasRows Then


            Kode.Text = dr!KodePendaftaran
            Nama.Text = dr!Nama
            tlp.Text = dr!Telepone
            tgl.Text = dr!Tanggal
            almt.Text = dr!Alamat
            Username.Text = dr!KodePendaftaran
            Password.Text = dr!Password


        End If



    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Call koneksi()
        If Pendaftaran.RadioButton1.Checked = True Then
            gender = Pendaftaran.RadioButton1.Text
        ElseIf Pendaftaran.RadioButton2.Checked = True Then
            gender = Pendaftaran.RadioButton2.Text

        End If

        Dim insert As String = "insert tbl_daftar values( '" & Username.Text & "','" & Pendaftaran.TextBox1.Text & "','" & Pendaftaran.TextBox2.Text & "','" & Format(Pendaftaran.DateTimePicker1.Value, "yyyy-MM-dd") & "','" & Pendaftaran.TextBox3.Text & "','" & gender & "','" & Password.Text & "','" & Pendaftaran.ComboBox1.Text & "')"
        cmd = New OdbcCommand(insert, conn)
        cmd.ExecuteNonQuery()
        MsgBox("Data anda sudah di simpan")
        Me.Close()

    End Sub


    Private Sub KonfirmasiPendaftaran_Load(sender As Object, e As EventArgs) Handles MyBase.Load


        Kode.Text = Username.Text
        Nama.Text = Pendaftaran.TextBox1.Text
        tlp.Text = Pendaftaran.TextBox3.Text
        tgl.Text = Pendaftaran.DateTimePicker1.Text
        almt.Text = Pendaftaran.TextBox2.Text

        Call kodeotomatisUsername()
        Call kodeotomatisPassword()

        Kode.Text = Username.Text


    End Sub
End Class