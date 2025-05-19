# 서버 리스트 로드
$servers = Get-Content ".\servers.txt"
$cred = Get-Credential
$resultList = @()

foreach ($server in $servers) {
    Write-Host "Checking $server ..." -ForegroundColor Cyan

    try {
        # powershell에서 원격 명령 실행을 위한 기본 명령어
        # 명령을 실행할 대상 서버의 이름 or IP주소
        # 인증정보
        # 원격 서버에서 실행할 powershell 코드 블록
        $apps = Invoke-Command -ComputerName $server -Credential $cred -ScriptBlock {
            $officeApps = @("excel.exe", "winword.exe", "powerpnt.exe")
            $appPathsKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths"
            $innerResults = @()

            foreach ($app in $officeApps) {
                $keyPath = Join-Path $appPathsKey $app

                try {
                    $value = Get-ItemProperty -Path $keyPath -ErrorAction Stop
                    $innerResults += [PSCustomObject]@{
                        Server   = $using:server
                        AppExe   = $app
                        FullPath = $value.'(default)'
                    }
                }
                catch {
                    $innerResults += [PSCustomObject]@{
                        Server   = $using:server
                        AppExe   = $app
                        FullPath = "Not Found"
                    }
                }
            }

            return $innerResults
        }

        $resultList += $apps
    }
    catch {
        $resultList += [PSCustomObject]@{
            Server   = $server
            AppExe   = "N/A"
            FullPath = "Connection Failed or WinRM Error"
        }
    }
}

# 결과 출력
$resultList | Format-Table -AutoSize

# CSV 저장
$resultList | Export-Csv -Path ".\Office_AppPaths_AllServers.csv" -NoTypeInformation -Encoding UTF8