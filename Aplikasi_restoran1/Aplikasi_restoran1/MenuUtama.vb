Imports System.Data.Odbc
Public Class MenuUtama


    Sub kondisiawal()

        PelayanToolStripMenuItem.Enabled = False
        KasirToolStripMenuItem.Enabled = False
        ManagerToolStripMenuItem.Enabled = False
        LogoutToolStripMenuItem.Enabled = False
        'AdminToolStripMenuItem.Enabled = False
        'PelangganToolStripMenuItem.Enabled = False
        LoginToolStripMenuItem.Enabled = True


        ToolStripStatusLabel2.Text = ""
        ToolStripStatusLabel4.Text = ""
        ToolStripStatusLabel6.Text = ""

        ToolStripStatusLabel2.Enabled = False
        ToolStripStatusLabel4.Text = TimeOfDay
        ToolStripStatusLabel6.Enabled = False


    End Sub

    Private Sub LoginToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles LoginToolStripMenuItem.Click
        Call Login.ShowDialog()

    End Sub

    Private Sub LogoutToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles LogoutToolStripMenuItem.Click
        Call kondisiawal()

    End Sub

    Private Sub MenuUtama_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Call kondisiawal()


    End Sub

    Private Sub KeluarToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles KeluarToolStripMenuItem.Click
        Me.Close()

    End Sub

    Private Sub PilihMejaToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PilihMejaToolStripMenuItem.Click
        Call Form_Pilih_Meja.ShowDialog()

    End Sub

    Private Sub PembayaranToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PembayaranToolStripMenuItem.Click
        Call Form_Pemabayaran.ShowDialog()
    End Sub

 
    Private Sub LaporanToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles LaporanToolStripMenuItem.Click
        Call Form_Laporan.ShowDialog()
    End Sub
End Class
