Sub Stock():
 For Each ws In Worksheets
 Dim lastrow As Long
 Dim tableRow As Long
 Dim ticker As String
 Dim Ychange As Double
 Dim Pchange As Double
 Dim stockopen As Double
 Dim stockclose As Double
 Dim Vtotal As Double
 Dim oprice_row As Long
 Dim lastRow2 As Long

 ws.Range("I1").Value = "Ticker"
 ws.Range("J1").Value = "Yearly Change"
 ws.Range("K1").Value = "Percent Change"
 ws.Range("L1").Value = "Total Stock Value"
 ws.Range("P1").Value = "Ticker"
 ws.Range("Q1").Value = "Value"
 ws.Range("O2").Value = "Greatest % Increase"
 ws.Range("O3").Value = "Greatest % Decrease"
 ws.Range("O4").Value = "Greatest Total Volume"

 Vtotal = 0
 tableRow = 2
 opriceRow = 2
 lastrow = ws.Cells(Rows.Count, 1).End(xlUp).Row
 
 For i = 2 To lastrow
    Vtotal = Vtotal + ws.Range("G" & i).Value
            If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
                stockopen = ws.Range("C" & opriceRow)
                stockclose = ws.Range("F" & i)
                Ychange = stockclose - stockopen
                
                If stockopen = 0 Then
                Pchange = 0
                Else
                    Pchange = Ychange / stockopen
                End If
                
         ws.Range("I" & tableRow).Value = Cells(i, 1).Value
         ws.Range("J" & tableRow).Value = Ychange
         ws.Range("K" & tableRow).Value = Pchange
         ws.Range("K" & tableRow).NumberFormat = "0.00%"
         Vtotal = Vtotal + ws.Range("G" & i).Value
         ws.Range("L" & tableRow).Value = Vtotal

         If ws.Range("J" & tableRow).Value < 0 Then
            ws.Range("J" & tableRow).Interior.ColorIndex = 3
         Else
            ws.Range("J" & tableRow).Interior.ColorIndex = 4
         End If

         tableRow = tableRow + 1
         opriceRow = i + 1
         Vtotal = 0
         
     End If
 Next i
 

lastRow2 = ws.Cells(Rows.Count, 10).End(xlUp).Row
 For j = 2 To lastRow2
 
 If ws.Cells(j, 11).Value = WorksheetFunction.Max(ws.Range("K2:k" & lastRow2)) Then
   ws.Range("P2").Value = ws.Cells(j, 9).Value
   ws.Range("Q2").Value = ws.Cells(j, 11).Value
   ws.Range("Q2").NumberFormat = "0.00%"
   
   ElseIf ws.Cells(j, 11).Value = WorksheetFunction.Min(ws.Range("K2:k" & lastRow2)) Then
   ws.Range("P3").Value = ws.Cells(j, 9).Value
   ws.Range("Q3").Value = ws.Cells(j, 11).Value
   ws.Range("Q3").NumberFormat = "0.00%"
    
   ElseIf ws.Cells(j, 12).Value = WorksheetFunction.Max(ws.Range("L2:L" & lastRow2)) Then
   ws.Range("P4").Value = ws.Cells(j, 9).Value
   ws.Range("Q4").Value = ws.Cells(j, 12).Value

 End If
 Next j

 
 Next ws
End Sub
