$username = [System.Environment]::UserName
$bytes = [System.Text.Encoding]::UTF8.GetBytes($username)
$hasher = [System.Security.Cryptography.MD5]::Create()
$hashBytes = $hasher.ComputeHash($bytes)
$hash = -join ($hashBytes | ForEach-Object { $_.ToString('x2') })
$seed = [System.Convert]::ToInt32($hash.Substring(0,4),16)
if ($args[ 0 ] -eq "/seed") {
    $seed = [System.Convert]::ToInt32($hash.Substring(0,4),16)
    Write-Output $seed
}
else {
    Write-Output $hash.Substring(0, 8)
}