'final'
Sub stockschallenge():


 For Each ws In Worksheets

 'Defining all the required variables'
 
 'All variables defined as long'
 Dim x, y As Long
 Dim lr As Long 'last row'
 Dim lrd As Long 'last row display'
 Dim oprow As Long 'openning price row'
  
'All variables defined as Double'

 Dim op As Double 'openning price'
 Dim cp As Double 'closing price'
 Dim gd As Double 'greatest decrease'
 Dim gtv As Double 'greatest total value'
 Dim gi As Double 'greatest increase'
 Dim tv As Double 'total value'
 Dim ych As Double 'yearly change'
 Dim pch As Double 'percentage change'
 
 
'All variables defined as String'
 Dim ticker As String
 Dim tck_gi As String 'ticker greatest increase'
 Dim tck_gd As String 'ticker greatest decrease'
 Dim tck_gtv As String 'ticker greatest total value'
 


 'Header Names'
 ws.Range("I1").Value = "Ticker"
 ws.Range("I1").Font.Bold = True
 ws.Range("J1").Value = "Annual Change"
 ws.Range("J1").Font.Bold = True
 ws.Range("K1").Value = "Percent Change"
 ws.Range("K1").Font.Bold = True
 ws.Range("L1").Value = "Total Stock"
 ws.Range("L1").Font.Bold = True
 
 ws.Range("O1").Value = "Ticker"
 ws.Range("O1").Font.Bold = True
 ws.Range("P1").Value = "Data"
 ws.Range("P1").Font.Bold = True
 ws.Range("N4").Value = "Greatest Percentage Increase"
 ws.Range("N4").Font.Bold = True
 ws.Range("N3").Value = "Greatest Percentage Decrease"
 ws.Range("N3").Font.Bold = True
 ws.Range("N2").Value = "Greatest Total Volume"
  ws.Range("N2").Font.Bold = True
 
 tv = 0
 y = 2
oprow = 2
 
 'Looping through the stock data of each year'
 'lr=last row'
 
 lr = ws.Cells(Rows.Count, 1).End(xlUp).Row
 For x = 2 To lr
     
     'comparingg the tickers'
     If ws.Range("A" & x + 1) = ws.Range("A" & x) Then

         'same ticker symble signs'
         tv = tv + ws.Range("G" & x)

     Else
         
         ticker = ws.Range("A" & x)


         'Annual Change and Annual Percentage Change'
         op = ws.Range("C" & oprow)
         cp = ws.Range("F" & x)
         'calculating the yearly changes'
         ych = cp - op

         'Percentage Change'
         If op = 0 Then
            pc = 0
         Else
         'calculating the change in percentage'
            pc = ych / op
    
    End If


'Adding the data into the cells'
         ws.Range("I" & y).Value = ticker
         ws.Range("L" & y).Value = tv + ws.Range("G" & x).Value
         ws.Range("L" & y).NumberFormat = "#,###"
         ws.Range("J" & y).Value = ych
         ws.Range("K" & y).Value = pc
        
         
    'Changing the format of the data to percentage'
          ws.Range("K" & y).NumberFormat = "0.00%"
         
         'Conditional Formating'
         
         If ws.Range("J" & y).Value > 0 Then
            
            ws.Range("J" & y).Interior.ColorIndex = 43 'green'
         Else
            ws.Range("J" & y).Interior.ColorIndex = 3 'red'
         End If


         y = y + 1
         tv = 0
         oprow = x + 1
         
         End If
      Next x
 
 
 
 'Greatest % Increase'
 'Greatest % Decrease'
 'Greatest Total Volume'
 

 'Data'
 gtv = ws.Range("L2" & z).Value
 gi = ws.Range("K2" & 2).Value
 gd = ws.Range("K2" & 2).Value


 'Loop Through Each Row to find the  Greatest Value'
  lrd = ws.Cells(Rows.Count, "I").End(xlUp).Row
  
  'Tickers'
 tck_gtv = ws.Range("I2" & z).Value
 tck_gi = ws.Range("I2" & z).Value
 tck_gd = ws.Range("I2" & z).Value
 
 For z = 2 To lrd:
     If ws.Range("K" & z + 1).Value > gi Then
        gi = ws.Range("K" & z + 1)
        tck_gi = ws.Range("I" & z + 1)
     
     ElseIf ws.Range("K" & z + 1) < gd Then
        gd = ws.Range("K" & z + 1)
        tck_gd = ws.Range("I" & z + 1)
     
     ElseIf ws.Range("L" & z + 1).Value > gtv Then
        gtv = ws.Range("L" & z + 1)
        tck_gtv = ws.Range("I" & z + 1)
     End If
 Next z
 

 'Adding data to the related cells'
 ws.Range("O2") = tck_gtv
 ws.Range("O3") = tck_gi
 ws.Range("O4") = tck_gd
 ws.Range("P2") = gtv
 ws.Range("P2").NumberFormat = "#,###"
 ws.Range("P3") = gi
 ws.Range("P3").NumberFormat = "0.00%"
 ws.Range("P4") = gd
  ws.Range("P4").NumberFormat = "0.00%"
 
 Next ws
 
End Sub


 
