#sample: pwsh .\decompress.ps1 -filePath ".\includes\sigawin.ch" > .\sigawin.ch

param (
    [string]$filePath
)

Add-Type -AssemblyName System.IO.Compression

$bytes = [System.IO.File]::ReadAllBytes($filePath)
$compressedContent = $bytes[14..($bytes.Length - 1)]
$stream = New-Object System.IO.MemoryStream
$stream.Write($compressedContent, 0, $compressedContent.Length)
$stream.Position = 0

$decompressor = New-Object System.IO.Compression.DeflateStream($stream, [System.IO.Compression.CompressionMode]::Decompress)
$reader = New-Object System.IO.StreamReader($decompressor, [System.Text.Encoding]::UTF8)

$inflated = $reader.ReadToEnd()
$reader.Close()

Write-Output ($inflated.Trim())
