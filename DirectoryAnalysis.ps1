param
(
	[string]$path = '.'
)

$totalCount = 0

$fileTypeDict = @{}

$rawListing = (ls -r $path)

foreach($item in $rawListing)
{
    if (-not ($item.Attributes.HasFlag([System.IO.FileAttributes]::Directory)))
    {
        $totalCount++
        if ($fileTypeDict.Contains($item.Extension))
        {
            $fileTypeDict[$item.Extension] = ($fileTypeDict[$item.Extension] + 1)
        }
        else
        {
            $fileTypeDict.Add($item.Extension, 1)
        }
    }
}

echo "Total file count was : $totalCount"

foreach($extension in $fileTypeDict.Keys)
{
    $count = $fileTypeDict[$extension]
    echo "$extension : $count"
}
