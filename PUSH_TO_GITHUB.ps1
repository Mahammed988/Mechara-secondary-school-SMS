# Mechara School SMS - Push to GitHub Script
# This script will help you push the project to GitHub

Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║              MECHARA SCHOOL SMS - GITHUB PUSH                 ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
Write-Host "✓ Checking Git installation..." -ForegroundColor Yellow
$gitVersion = git --version
Write-Host "✓ Git version: $gitVersion" -ForegroundColor Green
Write-Host ""

# Show current status
Write-Host "✓ Current Git status:" -ForegroundColor Yellow
git status --short
Write-Host ""

Write-Host "════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "TO PUSH TO GITHUB, YOU NEED TO AUTHENTICATE" -ForegroundColor Yellow
Write-Host "════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

Write-Host "OPTION 1: GitHub CLI (Easiest)" -ForegroundColor Green
Write-Host "─────────────────────────────────"
Write-Host "1. Install GitHub CLI from: https://cli.github.com"
Write-Host "2. Run: gh auth login"
Write-Host "3. Follow browser login"
Write-Host "4. Run: git push -u origin main"
Write-Host ""

Write-Host "OPTION 2: Personal Access Token" -ForegroundColor Green
Write-Host "────────────────────────────────"
Write-Host "1. Go to: https://github.com/settings/tokens"
Write-Host "2. Generate new token (classic)"
Write-Host "3. Select scopes: repo, workflow"
Write-Host "4. Copy the token"
Write-Host "5. Run this command (replace TOKEN with your actual token):"
Write-Host ""
Write-Host "   git remote set-url origin https://Mahammed988:TOKEN@github.com/Mahammed988/Mechara-secondary-school-SMS.git"
Write-Host "   git push -u origin main"
Write-Host ""

Write-Host "OPTION 3: SSH Key" -ForegroundColor Green
Write-Host "─────────────────"
Write-Host "1. Generate key: ssh-keygen -t ed25519"
Write-Host "2. Add to GitHub: https://github.com/settings/keys"
Write-Host "3. Update remote: git remote set-url origin git@github.com:Mahammed988/Mechara-secondary-school-SMS.git"
Write-Host "4. Push: git push -u origin main"
Write-Host ""

Write-Host "════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "AFTER AUTHENTICATION, YOUR REPO WILL BE AT:" -ForegroundColor Yellow
Write-Host "https://github.com/Mahammed988/Mechara-secondary-school-SMS" -ForegroundColor Cyan
Write-Host "════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

Write-Host "Current remote:" -ForegroundColor Yellow
git remote -v
Write-Host ""

Write-Host "Files ready to push:" -ForegroundColor Yellow
git diff --cached --name-only
Write-Host ""

Write-Host "Ready? Choose an authentication method above!" -ForegroundColor Green
