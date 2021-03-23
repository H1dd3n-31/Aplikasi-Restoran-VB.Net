Public Class Menu_Makanan

    Dim total, bayar, kembali As Double
    Dim tharga As TextBox()
    Dim cb As CheckBox()
    Dim jm As ComboBox()

    Sub data()
        cb = New CheckBox() {cb1, cb2, cb3, cb4, cb5, cb6, cb7, cb8, cb9, cb10}
        tharga = New TextBox() {TextBox1, TextBox2, TextBox3, TextBox4, TextBox5, TextBox6, TextBox7, TextBox8, TextBox9, TextBox10}
        jm = New ComboBox() {ComboBox1, ComboBox2, ComboBox3, ComboBox4, ComboBox5, ComboBox6, ComboBox7, ComboBox8, ComboBox9, ComboBox10}
    End Sub

    Private Sub Menu_Makanan_Load(sender As Object, e As EventArgs) Handles MyBase.Load

        Call data()

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

            Dim i As Integer
            total = 0


            For i = 0 To 9
            If cb(i).Checked = True Then
                total = total + (Val(tharga(i).Text)) * Val(jm(i).Text)
            End If

            Next

            TextBox21.Text = "Rp." & Format(total, "#,#.##")

    End Sub

 
    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Call KonfirmasiMenu.ShowDialog()


    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        TextBox11.Text = ""
        TextBox12.Text = ""
        TextBox13.Text = ""


        If cb1.Checked = True Then
            TextBox11.Text = TextBox11.Text & cb1.Text & vbCrLf
            TextBox12.Text = TextBox12.Text & TextBox1.Text & vbCrLf
            TextBox13.Text = TextBox13.Text & ComboBox1.Text & vbCrLf
        End If

        If cb2.Checked = True Then
            TextBox11.Text = TextBox11.Text & cb2.Text & vbCrLf
            TextBox12.Text = TextBox12.Text & TextBox2.Text & vbCrLf
            TextBox13.Text = TextBox13.Text & ComboBox2.Text & vbCrLf
        End If

        If cb3.Checked = True Then
            TextBox11.Text = TextBox11.Text & cb3.Text & vbCrLf
            TextBox12.Text = TextBox12.Text & TextBox3.Text & vbCrLf
            TextBox13.Text = TextBox13.Text & ComboBox3.Text & vbCrLf
        End If

        If cb4.Checked = True Then
            TextBox11.Text = TextBox11.Text & cb4.Text & vbCrLf
            TextBox12.Text = TextBox12.Text & TextBox4.Text & vbCrLf
            TextBox13.Text = TextBox13.Text & ComboBox4.Text & vbCrLf
        End If

        If cb5.Checked = True Then
            TextBox11.Text = TextBox11.Text & cb5.Text & vbCrLf
            TextBox12.Text = TextBox12.Text & TextBox5.Text
            TextBox13.Text = TextBox13.Text & ComboBox5.Text
        End If

        ' Menu minuman


       
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click

        TextBox14.Text = ""
        TextBox15.Text = ""
        TextBox16.Text = ""


        If cb6.Checked = True Then
            TextBox14.Text = TextBox14.Text & cb6.Text & vbCrLf
            TextBox15.Text = TextBox15.Text & TextBox6.Text & vbCrLf
            TextBox16.Text = TextBox16.Text & ComboBox6.Text & vbCrLf
        End If

        If cb7.Checked = True Then
            TextBox14.Text = TextBox14.Text & cb7.Text & vbCrLf
            TextBox15.Text = TextBox15.Text & TextBox7.Text & vbCrLf
            TextBox16.Text = TextBox16.Text & ComboBox7.Text & vbCrLf
        End If

        If cb8.Checked = True Then
            TextBox14.Text = TextBox14.Text & cb8.Text & vbCrLf
            TextBox15.Text = TextBox15.Text & TextBox8.Text & vbCrLf
            TextBox16.Text = TextBox16.Text & ComboBox8.Text & vbCrLf
        End If

        If cb9.Checked = True Then
            TextBox14.Text = TextBox14.Text & cb9.Text & vbCrLf
            TextBox15.Text = TextBox15.Text & TextBox9.Text & vbCrLf
            TextBox16.Text = TextBox16.Text & ComboBox9.Text & vbCrLf
        End If

        If cb10.Checked = True Then
            TextBox14.Text = TextBox14.Text & cb10.Text & vbCrLf
            TextBox15.Text = TextBox15.Text & TextBox10.Text & vbCrLf
            TextBox16.Text = TextBox16.Text & ComboBox10.Text & vbCrLf
        End If

    End Sub

    'Private Sub Button5_Click(sender As Object, e As EventArgs)
    '    DataGridView1.Rows.Add(1)
    '    DataGridView1.Rows(DataGridView1.RowCount - 2).Cells(0).Value = TextBox17.Text
    '    DataGridView1.Rows(DataGridView1.RowCount - 2).Cells(1).Value = TextBox18.Text
    '    DataGridView1.Rows(DataGridView1.RowCount - 2).Cells(2).Value = TextBox19.Text
    '    DataGridView1.Rows(DataGridView1.RowCount - 2).Cells(3).Value = TextBox20.Text
    '    DataGridView1.Update()
    'End Sub
End Class