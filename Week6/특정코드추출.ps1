# Web.config 경로 지정
$configPath = "C:\경로\Web.config"

# XML 로드
[xml]$xml = Get-Content $configPath

# connectionStrings 노드 추출
$connectionStrings = $xml.configuration.connectionStrings.add

if ($connectionStrings.Count -eq 1) {
    # 이름이 없는 경우 첫 번째 connectionString 사용
    $conn = $connectionStrings[0]
} else {
    # 이름 있는 경우 원하는 targetName을 찾기
    $targetName = "MyConnection"  # 원하는 connection 이름
    $conn = $connectionStrings | Where-Object { $_.name -eq $targetName }

    if (-not $conn) {
        Write-Host "해당 이름의 connectionStrings($targetName)를 찾을 수 없습니다."
        exit
    }
}

$connString = $conn.connectionString

if ($connString -match "User Id=([^;]+)") { $userId = $matches[1] }
if ($connString -match "Password=([^;]+)") { $password = $matches[1] }
if ($connString -match "(Server|Data Source)=([^;]+)") { $server = $matches[2] }
if ($connString -match "(Database|Initial Catalog)=([^;]+)") { $database = $matches[2] }

# 추출된 값 확인
Write-Host "User Id: $userId, Password: $password, Server: $server, Database: $database"

# 연결 문자열 생성
$connectionString = "Server=$server;Database=$database;User Id=$userId;Password=$password;"

try {
    $connection = New-Object System.Data.SqlClient.SqlConnection $connectionString
    $connection.Open()
    Write-Host "DB 접속 성공! 서버: $server, 데이터베이스: $database"
    $connection.Close()
}
catch {
    Write-Host "접속 실패: $_"
}