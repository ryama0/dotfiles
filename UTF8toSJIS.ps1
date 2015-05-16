#$in:�ϊ��Ώ�
#$out:�o�̓p�X
#�p�X�͑��΃p�X
param(
	[String]$in = "c:\tmp\convert",	
	[String]$out = "c:\tmp\converted"
)

$in = [String](Get-Location) + "/" + $in
$out = [String](Get-Location) + "/" + $out
[String]$from = "UTF-8"
[String]$to = "Shift_JIS"

# ����$from�A$to����A�����R�[�h��\��Encoding�I�u�W�F�N�g�𐶐�
$enc_f = [Text.Encoding]::GetEncoding($from)
$enc_t = [Text.Encoding]::GetEncoding($to)

$reader = New-Object IO.StreamReader($in,$enc_f)
$writer = New-Object IO.StreamWriter($out,$enc_t)
while(!$reader.EndOfStream){$writer.WriteLine($reader.ReadLine())}
$reader.Close()
$writer.Close()

