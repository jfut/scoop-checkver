write-host -f DarkCyan "Running /scoop/bin/checkver-pre script..."
& /scoop/bin/checkver-pre

Get-ChildItem /scoop/buckets/ | ForEach-Object {
    $bucket = $_
    $checkver = "$bucket/bin/checkver.ps1"
    if (Test-Path $checkver) {
        write-host -f DarkCyan "Target bucket: $bucket"
        write-host -f Yellow "Updating bucket..."
        & git --git-dir="$bucket/.git" pull
        write-host -f Yellow "Checking bucket..."
        Invoke-Expression "pwsh $checkver | /scoop/bin/checkver-handle $bucket"
    }
}

write-host -f DarkCyan "Running /scoop/bin/checkver-post script..."
& /scoop/bin/checkver-post

