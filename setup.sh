#!/bin/bash
set -e

echo "=== VerseCatch Setup ==="

echo ""
echo "[1/4] Setting up Python virtual environment..."
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip > /dev/null 2>&1
pip install fastapi uvicorn pydantic httpx python-multipart numpy
echo "  ✓ Python dependencies installed"

echo ""
echo "[2/4] Setting up Flutter project..."
if ! command -v flutter &> /dev/null; then
    echo "  ⚠ Flutter not found. Please install Flutter first:"
    echo "     https://docs.flutter.dev/get-started/install/macos"
    echo "     Or on macOS: brew install --cask flutter"
    echo ""
    echo "  Then run the following in the versecatch/ directory:"
    echo "     flutter create --project-name versecatch --platforms android,ios,macos ."
    echo "     flutter pub get"
    exit 1
fi

cd versecatch
flutter create --project-name versecatch --platforms android,ios,macos . 2>/dev/null || true
flutter pub get
echo "  ✓ Flutter project initialized"

echo ""
echo "[3/4] Starting backend..."
echo "  Run this in a separate terminal:"
echo "     cd $(pwd)/backend"
echo "     source ../venv/bin/activate"
echo "     python main.py"
echo ""

echo "[4/4] Running Flutter app..."
echo "  Run this in another terminal:"
echo "     cd $(pwd)"
echo "     flutter run"
echo ""

echo "=== Setup complete! ==="
echo ""
echo "Backend will be at: http://localhost:8000"
echo "API docs at:         http://localhost:8000/docs"
