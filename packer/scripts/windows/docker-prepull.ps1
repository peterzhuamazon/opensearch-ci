$ErrorActionPreference = "Stop"

& dockerd --register-service
Set-Service -Name docker -StartupType Automatic
Start-Service docker
docker ps

curl.exe -SfLO https://raw.githubusercontent.com/opensearch-project/opensearch-build/refs/heads/main/docker/ci/get-ci-images.sh
$IMAGE = bash.exe -c "chmod 755 ./get-ci-images.sh && ./get-ci-images.sh -p windows2019 -u opensearch -t build | head -1"
Write-Host "Baking image: $IMAGE"

docker pull $IMAGE

bash.exe -c "rm -v ./get-ci-images.sh"
Stop-Service docker
