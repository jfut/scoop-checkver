Get-ChildItem /scoop/buckets/ | ForEach-Object {
    $bucket = $_
    $checkver = "$bucket/bin/checkver.ps1"
    if (Test-Path $checkver) {
        write-host -f DarkCyan "Check target: $bucket"
        write-host -f Yellow "Updating bucket..."
        & git --git-dir="$bucket/.git" pull
        iex -command "$checkver"
    }
}
