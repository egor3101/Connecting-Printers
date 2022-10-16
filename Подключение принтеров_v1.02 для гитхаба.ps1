Write-Host "Введите ID принтера, который хотите подключить (5 цифр)"-ForegroundColor Black -BackgroundColor White
$printer_id = Read-Host ">"

#Нужен для цикла
$x = $true 


While ($x){
  try {


    #Добавляем принтер с принт сервера
    (New-Object -ComObject WScript.Network).AddWindowsPrinterConnection("\\название принтсервера\префикс принтера-$printer_id")

    #Меняем значение на false, если не вызван блок catch 
    $x = $false

    #Выводим сообщение, если не вызван блок catch
    Write-Host "Принтер усепешно подключен!`n"-ForegroundColor Black -BackgroundColor White
        

        

  }

  catch{

    Write-Host "Неверно указано ID принтера"-ForegroundColor Black -BackgroundColor White
    $printer_id = Read-Host ">"

  }



}

#Выясняем надо ли установить принтер по умолчанию          
Write-Host "Установить принтер $printer_id по умолчанию?"-ForegroundColor Black -BackgroundColor White
Write-Host "1-Да"-BackgroundColor Green -ForegroundColor Black
Write-Host "2-Нет"-BackgroundColor Red -ForegroundColor Black




#Чтбы занчение было либо 1 либо 2
While ($true){

  $answer_default = Read-Host ">"

  if (($answer_default -eq 1) -or ($answer_default -eq 2)){
    
    break 
    
  }

  else {
    
    Write-Host "Неверное значение!`nВведите 1 или 2"-ForegroundColor Black -BackgroundColor White
    
  }

}



#Если принтер надо сделать по умолчанию
if ($answer_default -eq 1) {
        
  #Устанавливаем принтер по умолчанию      
  (New-Object -ComObject WScript.Network).SetDefaultPrinter("\\название принтсервера\префикс принтера-$printer_id")
  Write-Host "Принтер префикс принтера-$printer_id установлен по умолчанию"-ForegroundColor Black -BackgroundColor White
        
        
}

#Если принтер не надо устанавливать по умолчанию        
else {
        
        
  Write-Host "Скрипт выполнен успешно!"-ForegroundColor Black -BackgroundColor White
        
        
}

#Для EXE файла
Start-Sleep -Seconds 1.5