# Script push dự án lên https://github.com/FIT-dev-AI/Lab-2-OOP.git
# Chạy trong PowerShell: .\push-to-github.ps1

$repoUrl = "https://github.com/FIT-dev-AI/Lab-2-OOP.git"
$projectPath = "d:\demo"

Set-Location $projectPath

# Khởi tạo git nếu chưa có
if (-not (Test-Path ".git")) {
    Write-Host "Khoi tao Git repository..." -ForegroundColor Yellow
    git init
}

# Thêm remote (ghi đè nếu đã tồn tại)
git remote remove origin 2>$null
git remote add origin $repoUrl
Write-Host "Da them remote: $repoUrl" -ForegroundColor Green

# Add tất cả file và commit
git add .
$hasChanges = git status --porcelain
if ($hasChanges) {
    git commit -m "Initial commit: Spring Boot demo with Book API"
    Write-Host "Da commit code." -ForegroundColor Green
} else {
    Write-Host "Khong co thay doi de commit (hoac da commit roi)." -ForegroundColor Yellow
}

# Push lên GitHub (branch main)
Write-Host "Dang push len GitHub..." -ForegroundColor Yellow
git branch -M main
git push -u origin main

Write-Host "Hoan thanh! Kiem tra tai: https://github.com/FIT-dev-AI/Lab-2-OOP" -ForegroundColor Green
