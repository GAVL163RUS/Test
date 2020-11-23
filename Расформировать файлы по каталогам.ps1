$folder = 'f:\test'

get-childitem $folder -file | foreach {

    $newdir = "$($folder)\$($_.extension.trim('.'))"
    new-item -type directory  $newdir -ea 0
    move-item "$folder\*$($_.extension)" $newdir
    
    [array] $log += [pscustomobject] @{
        
        Extension = $_.extension
        TotalFiles = (get-childitem $newdir).count
        TotalLength = & { get-childitem $newdir | foreach { $s += $_.length }; $s }
        
     }
    
}

$log | sort extension -unique | ft -auto | out-file result.log -encoding default