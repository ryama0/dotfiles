#$in:変換対象
#$out:出力パス
#パスは相対パス
param(
	[String]$in = "c:\tmp\convert",	
	[String]$out = "c:\tmp\converted"
)

$in = [String](Get-Location) + "/" + $in
$out = [String](Get-Location) + "/" + $out
[String]$from = "UTF-8"
[String]$to = "Shift_JIS"

# 引数$from、$toから、文字コードを表すEncodingオブジェクトを生成
$enc_f = [Text.Encoding]::GetEncoding($from)
$enc_t = [Text.Encoding]::GetEncoding($to)

$reader = New-Object IO.StreamReader($in,$enc_f)
$writer = New-Object IO.StreamWriter($out,$enc_t)
while(!$reader.EndOfStream){$writer.WriteLine($reader.ReadLine())}
$reader.Close()
$writer.Close()

