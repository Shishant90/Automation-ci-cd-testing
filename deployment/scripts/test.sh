#!/bin/bash
set -e

echo "Installing dependencies..."
pip install -r src/requirements.txt

echo "Running tests..."
python -m pytest src/tests/ --junitxml=reports/junit.xml --cov=src --cov-report=xml:reports/coverage.xml

echo "Tests completed successfully!"