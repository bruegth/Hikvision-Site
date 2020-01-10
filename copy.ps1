$fileInput = $args[0]
$fileOutput = $args[1]
$startOffset = $args[2]
$endOffset = $args[3]
$len = $endOffset-$startOffset
$buf = new-object byte[] $len

$fsr = new-object IO.FileStream($fileInput, [IO.FileMode]::Open)
$reader = new-object IO.BinaryReader($fsr)
$reader.BaseStream.Seek($startOffset,"Begin")
$reader.Read($buf, 0, $len)
$reader.Close()

$fsw = new-object IO.FileStream($fileOutput, [IO.FileMode]::OpenOrCreate)
$writer = new-object IO.BinaryWriter($fsw)
$writer.BaseStream.Write($buf, 0, $len)
$writer.Close()