Imports System.Data.Odbc
Public Class Form_Laporan


    Sub kodeotomatis()

        Call koneksi()
        cmd = New OdbcCommand("select * from tbl_detailpembayaran where KodePembayaran in(select max(KodePembayaran) from tbl_detailpembayaran)", conn)
        dr = cmd.ExecuteReader
        Dim urutan As String
        Dim hitung As Long
        dr.Read()
        If Not dr.HasRows Then

            TextBox1.Text = "310" + "0001"

        Else

            hitung = Microsoft.VisualBasic.Right(dr.GetString(0), 8) + 1
            urutan = "310" + Microsoft.VisualBasic.Right("0000" & hitung, 1)

        End If

        TextBox1.Text = hitung

    End Sub


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If MessageBox.Show("Apakah ingin membuat laporan...?", "", MessageBoxButtons.YesNo) = Windows.Forms.DialogResult.Yes Then

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

    Private Sub Form_Laporan_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        TextBox2.Enabled = False
        TextBox2.Text = MenuUtama.ToolStripStatusLabel2.Text
        Call kodeotomatis()
        TextBox1.Enabled = False
    End Sub
End Class