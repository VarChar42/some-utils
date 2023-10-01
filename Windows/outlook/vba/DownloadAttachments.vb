Sub DownloadAttachments()
    Dim selectedItems As Selection
    Set selectedItems = Outlook.Application.ActiveExplorer.Selection
    Dim obj As Object
    Dim downloadPath As String
    Dim folderName As String
    Dim folderPath As String

    ' Get the current user's download folder
    downloadPath = Environ("USERPROFILE") & "\Downloads\"

    ' Create a folder with the current date
    folderName = Format(Now, "yyyy-MM-dd")
    folderPath = downloadPath & folderName

    ' Check if the folder exists, and create it if it doesn't
    If Dir(folderPath, vbDirectory) = "" Then
        MkDir folderPath
    End If

    For Each obj In selectedItems
        If obj.Class = olMail Then
            Dim mail As MailItem
            Set mail = obj
            Dim attachments As attachments
            Set attachments = mail.attachments
            Dim attachment As attachment

            For Each attachment In attachments
                ' Save the attachment to the folder with the current date
                attachment.SaveAsFile folderPath & "\" & attachment.FileName
            Next attachment
        End If
    Next obj

    ' Display a message box to confirm the completion of the download
    MsgBox "Attachments downloaded to: " & folderPath, vbInformation, "Download Complete"
End Sub

