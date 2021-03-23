Imports System.Data.Odbc
Public Class MenuMakanan2
    Sub kondisiawal()

        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Enabled = False
        TextBox5.Text = ""
        TextBox9.Text = ""


        TextBox1.Enabled = False
        TextBox2.Enabled = False
        TextBox3.Enabled = False
        TextBox5.Enabled = False
        TextBox7.Enabled = False
        TextBox8.Enabled = False


  

        TextBox2.Text = Form_Pilih_Meja.TextBox1.Text
        TextBox3.Text = Form_Pilih_Meja.ComboBox1.Text
        TextBox4.Text = Today
        TextBox5.Text = MenuUtama.ToolStripStatusLabel2.Text

  

    End Sub

    'Sub grtv()

    '    Call koneksi()
    '    da = New OdbcDataAdapter("select * from tbl_menu", conn)
    '    ds = New DataSet
    '    da.Fill(ds, "tbl_menu")
    '    DataGridView2.DataSource = (ds.Tables("tbl_menu"))


    'End Sub


    Sub BuatKolom()
        DataGridView2.Columns.Clear()
        DataGridView2.Columns.Add("Kode", "Kode Makanan")
        DataGridView2.Columns.Add("Nama", "Nama Makanan")
        DataGridView2.Columns.Add("Harga", "Harga Makanan")
        DataGridView2.Columns.Add("Jumlah", "Jumlah Makanan")
        DataGridView2.Columns.Add("Total", "Total Makanan")
    End Sub

    Sub kodeotomatis()

        Call koneksi()
        cmd = New OdbcCommand("select * from tbl_order where KodePesanan in(select max(KodePesanan) from tbl_order)", conn)
        dr = cmd.ExecuteReader
        Dim urutan As String
        Dim hitung As Long
        dr.Read()
        If Not dr.HasRows Then

            TextBox1.Text = "2020" + "0001"

        Else

            hitung = Microsoft.VisualBasic.Right(dr.GetString(0), 10) + 1
            urutan = "2020" + Microsoft.VisualBasic.Right("0000" & hitung, 4)

        End If

        TextBox1.Text = hitung
    End Sub

    Sub menumakanan()

        Call koneksi()
        da = New OdbcDataAdapter("select KodeMakanan,NamaMakanan,Harga from tbl_menu", conn)
        ds = New DataSet
        da.Fill(ds, "tbl_menu")
        DataGridView1.DataSource = (ds.Tables("tbl_menu"))

    End Sub

    Private Sub MenuMakanan2_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Call menumakanan()
        Call kondisiawal()
        Call kodeotomatis()
        'Call grtv()
        Call BuatKolom()
       
    End Sub

    Private Sub TextBox6_KeyPress(sender As Object, e As KeyPressEventArgs) Handles TextBox6.KeyPress
        If e.KeyChar = Chr(13) Then

            Call koneksi()
            cmd = New OdbcCommand("select * from tbl_menu where KodeMakanan='" & TextBox6.Text & "'", conn)
            dr = cmd.ExecuteReader
            dr.Read()
            If dr.HasRows Then

                TextBox7.Text = dr!NamaMakanan
                TextBox8.Text = dr!Harga

            Else

                MsgBox("Kode Makanan yang anda input tidak ada")
                TextBox6.Text = ""

            End If

        End If
    End Sub

    Sub RumusTotal()
        Dim hitungItem As Integer = 0
        'Dim coba As Integer
        For i As Integer = 0 To DataGridView2.Rows.Count - 1
            hitungItem = hitungItem + Val(DataGridView2.Rows(i).Cells(4).Value)
            TextBox9.Text = hitungItem
        Next

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'If TextBox6.Text = "" Or TextBox7.Text = "" Or TextBox8.Text Or TextBox10.Text Then

        '    MsgBox("Data Jumlah wajib di isi")
        'Else
        TextBox9.Text = Val(TextBox8.Text) * Val(TextBox10.Text)
        DataGridView2.Rows.Add(New String() {TextBox6.Text, TextBox7.Text, TextBox8.Text, TextBox10.Text, TextBox9.Text})
        TextBox6.Text = ""
        TextBox7.Text = ""
        TextBox8.Text = ""
        TextBox9.Text = ""
        TextBox10.Text = ""
        Call RumusTotal()

        'End If

    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click


        'For i As Integer = 0 To DataGridView2.Rows.Count - 1

        '    Dim tgl = Format(Today, "yyyy-MM-dd")
        '    Call koneksi()
        '    Dim insert As String = "insert tbl_order values('" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & tgl & "','" & TextBox5.Text & "','" & DataGridView2.Rows(i).Cells(0).Value & "','" & DataGridView2.Rows(i).Cells(1).Value & "','" & DataGridView2.Rows(i).Cells(2).Value & "','" & DataGridView2.Rows(i).Cells(3).Value & "','" & DataGridView2.Rows(i).Cells(4).Value & "')"
        '    cmd = New OdbcCommand(insert, conn)
        '    cmd.ExecuteNonQuery()
        '    MsgBox("Data anda sudah di simpan")

        'Next




        For i As Integer = 0 To DataGridView2.Rows.Count - 1


            Call koneksi()
            Dim detail_insert As String = "insert tbl_detailorder values('" & TextBox1.Text & "','" & DataGridView2.Rows(i).Cells(0).Value & "','" & DataGridView2.Rows(i).Cells(1).Value & "','" & DataGridView2.Rows(i).Cells(2).Value & "','" & DataGridView2.Rows(i).Cells(3).Value & "','" & DataGridView2.Rows(i).Cells(4).Value & "')"
            cmd = New OdbcCommand(detail_insert, conn)
            cmd.ExecuteNonQuery()

        Next


        'inssert ke tbl_detailorder
        Call koneksi()
        Dim tgl = Format(Today, "yyyy-MM-dd")
        Call koneksi()
        Dim insert As String = "insert tbl_order values('" & TextBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & tgl & "','" & TextBox5.Text & "','" & TextBox9.Text & "')"
        cmd = New OdbcCommand(insert, conn)
        cmd.ExecuteNonQuery()



        MsgBox("Data anda sudah di simpan")
        Me.Close()
        Form_Pilih_Meja.TextBox1.Text = ""
        Form_Pilih_Meja.ComboBox1.Text = ""




    End Sub

  
End Class