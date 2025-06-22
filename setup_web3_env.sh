#!/bin/bash
set -e

echo "🚀 Node.js 설치 중..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v

echo ""
echo "🛠 Foundry 설치 중..."
curl -L https://foundry.paradigm.xyz | bash

# .bashrc가 있으면 source
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# foundryup 명령어가 없다면 다시 로그인하라는 메시지 출력
if ! command -v foundryup &> /dev/null; then
    echo "⚠️  'foundryup'이 현재 쉘에서 인식되지 않습니다."
    echo "❗ 터미널을 새로 열거나 'source ~/.bashrc' 실행 후 아래 명령을 수동으로 실행하세요:"
    echo "   foundryup"
    exit 1
fi

foundryup
forge --version
anvil --version

echo "✅ 설치 완료"
