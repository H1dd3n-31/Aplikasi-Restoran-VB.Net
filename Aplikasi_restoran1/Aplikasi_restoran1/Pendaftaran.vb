Public Class Pendaftaran

    Sub kondisi_awal()

        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        ComboBox1.Text = ""
        DateTimePicker1.Text = ""
        RadioButton1.Checked = False
        RadioButton2.Checked = False

    End Sub


    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        If TextBox1.Text = "" Or TextBox2.Text = "" Or TextBox3.Text = "" Then

            MsgBox("semua data harus di isi broo")

        Else

            If Label11.Text <> TextBox4.Text Then

                MsgBox("Kode yg anda masukan salah broo")
                TextBox4.Text = ""


            Else

                Call Konfirmasi_Pendaftaran.ShowDialog()
                Call kondisi_awal()


            End If

        End If

    End Sub
End Class