Imports System.Data.Odbc
Module Module_koneksi

    Public conn As OdbcConnection
    Public da As OdbcDataAdapter
    Public ds As DataSet
    Public dr As OdbcDataReader
    Public cmd As OdbcCommand
    Public mydb As String
    Public gender As String
    Dim regDate As DateTime = DateTime.Now
    Dim strDate As String = regDate.ToString("yyyy-MM-dd HH:mm:ss")



    Sub koneksi()

        mydb = ("Driver={MySQL ODBC 3.51 Driver}; server=localhost; Database=db_restoran; uid=root")
        conn = New OdbcConnection(mydb)
        If conn.State = ConnectionState.Closed Then conn.Open()


    End Sub


End Module
