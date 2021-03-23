Imports System.Data.Odbc
Public Class Form_Pemabayaran

    Sub kondisiawal()

        TextBox4.Text = Menu_Makanan.TextBox9.Text

        TextBox2.Enabled = False
        TextBox3.Enabled = False
        TextBox4.Enabled = False
        TextBox6.Enabled = False
        TextBox7.Enabled = False
        TextBox1.Enabled = True
        TextBox11.Enabled = False
        TextBox5.Enabled = False

        ComboBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox11.Text = ""
        TextBox5.Text = ""
        TextBox4.Text = ""
        TextBox7.Text = ""
        TextBox1.Text = ""


    End Sub


    Sub munculaja()


        Call koneksi()
        cmd = New OdbcCommand("Select * from tbl_order where KodePesanan= '" & ComboBox1.Text & "'", conn)
        dr = cmd.ExecuteReader
        dr.Read()
        If dr.HasRows Then


            TextBox2.Text = dr!NamaPelanggan
            TextBox3.Text = dr!NoMeja
            TextBox11.Text = dr!tanggal
            TextBox4.Text = dr!TotalPembelian
            'TextBox5.Text = dr!NamaPelayan
            Call MunculDataPembelian()


        End If

    End Sub

    Sub menumakanan()

        Call koneksi()
        da = New OdbcDataAdapter("select * from tbl_detailorder", conn)
        ds = New DataSet
        da.Fill(ds, "tbl_detailorder")
        DataGridView1.DataSource = (ds.Tables("tbl_detailorder"))

    End Sub

    Sub MunculKodeOtomatis()

        Call koneksi()
        ComboBox1.Items.Clear()
        cmd = New OdbcCommand("select * from tbl_order", conn)
        dr = cmd.ExecuteReader
        Do While dr.Read

            ComboBox1.Items.Add(dr.Item(0))
          
        Loop

    End Sub

    Private Sub Form_Pemabayaran_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        TextBox5.Text = MenuUtama.ToolStripStatusLabel2.Text
        'Call menumakanan()
        Call kondisiawal()
        Call MunculKodeOtomatis()
        Call MunculDataPembelian()
        Call kodeotomatis()
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged
        Call munculaja()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Call koneksi()
        TextBox5.Text = MenuUtama.ToolStripStatusLabel2.Text
        Dim tgl = Format(Today, "yyyy-MM-dd")
        TextBox11.Text = tgl
        Dim insert As String = "insert tbl_pembayaran values('" & TextBox6.Text & "','" & ComboBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox11.Text & "','" & TextBox5.Text & "','" & TextBox4.Text & "','" & TextBox7.Text & "')"
        cmd = New OdbcCommand(insert, conn)
        cmd.ExecuteNonQuery()

        For i As Integer = 0 To DataGridView1.Rows.Count - 1

            Call koneksi()
            Dim detail_insert As String = "insert tbl_detailpembayaran values('" & TextBox6.Text & "','" & ComboBox1.Text & "','" & TextBox2.Text & "','" & TextBox3.Text & "','" & TextBox11.Text & "','" & TextBox5.Text & "','" & DataGridView1.Rows(i).Cells(1).Value & "','" & DataGridView1.Rows(i).Cells(2).Value & "','" & DataGridView1.Rows(i).Cells(3).Value & "','" & DataGridView1.Rows(i).Cells(4).Value & "','" & DataGridView1.Rows(i).Cells(5).Value & "')"
            cmd = New OdbcCommand(detail_insert, conn)
            cmd.ExecuteNonQuery()

        Next

        Call koneksi()
        Dim detail_delete As String = "delete from tbl_detailorder where KodePesanan= '" & ComboBox1.Text & "'"
        cmd = New OdbcCommand(detail_delete, conn)
        cmd.ExecuteNonQuery()


        Call koneksi()
        Dim order_delete As String = "delete from tbl_order where KodePesanan= '" & ComboBox1.Text & "'"
        cmd = New OdbcCommand(order_delete, conn)
        cmd.ExecuteNonQuery()


        MsgBox("Pembayaran anda berhasil")
        DataGridView1.Columns.Clear()
        Call kondisiawal()

        If MessageBox.Show("Apakah ingin cetak nota...?", "", MessageBoxButtons.YesNo) = Windows.Forms.DialogResult.Yes Then

            'struk.CrystalReportViewer1.SelectionFormula = "{tbl_pembayaran.KodePembayaran}='" & (TextBox6.Text) & "'"
            'struk.CrystalReportViewer1.Refresh()
            'struk.Show()
            'AxCrystalReport1.SelectionFormula = "{tbl_pembayaran.KodePembayaran}='" & (TextBox6.Text) & "'" 'and {tbl_detailPembayaran.KodePembayaran}='" & (TextBox6.Text) & "'"
            'AxCrystalReport1.ReportFileName = "Laporanterbaru.rpt"
            'AxCrystalReport1.WindowState = Crystal.WindowStateConstants.crptMaximized
            'AxCrystalReport1.RetrieveDataFiles()
            'AxCrystalReport1.Action = 0


            AxCrystalReport1.ReportFileName = "Laporanterbaru.rpt"
            AxCrystalReport1.WindowState = Crystal.WindowStateConstants.crptMaximized
            AxCrystalReport1.RetrieveDataFiles()
            AxCrystalReport1.Action = 1

        End If

    End Sub


    Sub MunculDataPembelian()

        Call koneksi()
        da = New OdbcDataAdapter("Select  tbl_detailorder.KodePesanan,KodeMakanan,NamaMakanan,HargaMakanan,JumlahMakanan,TotalMakanan from tbl_detailorder,tbl_order where tbl_order.KodePesanan=tbl_detailorder.KodePesanan and tbl_order.KodePesanan= '" & ComboBox1.Text & "'", conn)
        ds = New DataSet
        ds.Clear()
        da.Fill(ds, "Detail")
        DataGridView1.DataSource = ds.Tables("Detail")
        'DataGridView1.Columns(0).Width = 80
        'DataGridView1.Columns(1).Width = 300
        'DataGridView1.Columns()
        DataGridView1.ReadOnly = True

    End Sub


    Sub kodeotomatis()

        Call koneksi()
        cmd = New OdbcCommand("select * from tbl_detailpembayaran where KodePembayaran in(select max(KodePembayaran) from tbl_detailpembayaran)", conn)
        dr = cmd.ExecuteReader
        Dim urutan As String
        Dim hitung As Long
        dr.Read()
        If Not dr.HasRows Then

            TextBox6.Text = "310" + "0001"

        Else

            hitung = Microsoft.VisualBasic.Right(dr.GetString(0), 8) + 1
            urutan = "310" + Microsoft.VisualBasic.Right("0000" & hitung, 1)

        End If

        TextBox6.Text = hitung
    End Sub

    Private Sub TextBox1_KeyPress(sender As Object, e As KeyPressEventArgs) Handles TextBox1.KeyPress
        If e.KeyChar = Chr(13) Then

            TextBox7.Text = Val(TextBox1.Text) - Val(TextBox4.Text)
            TextBox1.Enabled = False
            TextBox7.Enabled = True

        End If
    End Sub

End Class