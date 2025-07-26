#!/bin/bash

# Script to create a pre-filled experiment template file
# Usage: ./create-experiment.sh [company] [model]
# Example: ./create-experiment.sh openai gpt-4

# Check if correct number of arguments provided
if [ $# -ne 2 ]; then
    echo "❌ Usage: $0 [company] [model]"
    echo ""
    echo "📋 Available companies and models:"
    if command -v tree &> /dev/null; then
        tree prompts/versions/stable/experiments -L 2 -d
    else
        echo "   (tree command not found, showing manual listing)"
        find prompts/versions/stable/experiments -mindepth 1 -maxdepth 2 -type d | sort | sed 's|prompts/versions/stable/experiments/||' | awk -F/ '{if(NF==1) print "  " $1 ":"; else print "    " $2}'
    fi
    echo ""
    echo "📝 Example: $0 openai gpt-4"
    exit 1
fi

COMPANY=$1
MODEL=$2

# Get current date
CURRENT_DATE=$(date +%Y-%m-%d)

# Ask user for their GitHub username
echo -n "🔑 Enter your GitHub username: "
read -r GITHUB_USER

if [ -z "$GITHUB_USER" ]; then
    echo "❌ Username cannot be empty."
    exit 1
fi

echo "📝 Creating experiment template..."
echo "   Company: $COMPANY"
echo "   Model: $MODEL"
echo "   Date: $CURRENT_DATE"
echo "   GitHub User: $GITHUB_USER"

# Create target directory path
TARGET_DIR="prompts/versions/stable/experiments/$COMPANY/$MODEL"
FILENAME="${CURRENT_DATE}_${GITHUB_USER}_result.md"
FILEPATH="$TARGET_DIR/$FILENAME"

# Check if target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ Directory $TARGET_DIR does not exist."
    echo "💡 Available folders:"
    find prompts/versions/stable/experiments -type d -mindepth 2 -maxdepth 2 | sort
    exit 1
fi

# Check if file already exists
if [ -f "$FILEPATH" ]; then
    echo "⚠️  File already exists: $FILEPATH"
    echo "🤔 Do you want to overwrite it? (y/N)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "❌ Aborted."
        exit 1
    fi
fi

# Create the pre-filled experiment file by copying and customizing the template
if [ ! -f "templates/experiment-template.md" ]; then
    echo "❌ Template file not found: templates/experiment-template.md"
    exit 1
fi

# Copy template and replace placeholders
cp templates/experiment-template.md "$FILEPATH"

# Replace placeholders with actual values (works on both macOS and Linux)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i '' "s/YYYY-MM-DD/$CURRENT_DATE/g" "$FILEPATH"
    sed -i '' "s/\[GitHub username\]/$GITHUB_USER/g" "$FILEPATH"
    sed -i '' "s/\[e\.g\., GPT-4, Claude Sonnet 4, Gemini Pro, etc\.\]/$MODEL/g" "$FILEPATH"
    sed -i '' "s/\[e\.g\., current, v1\.0\]/stable/g" "$FILEPATH"
else
    # Linux
    sed -i "s/YYYY-MM-DD/$CURRENT_DATE/g" "$FILEPATH"
    sed -i "s/\[GitHub username\]/$GITHUB_USER/g" "$FILEPATH"
    sed -i "s/\[e\.g\., GPT-4, Claude Sonnet 4, Gemini Pro, etc\.\]/$MODEL/g" "$FILEPATH"
    sed -i "s/\[e\.g\., current, v1\.0\]/stable/g" "$FILEPATH"
fi

echo "✅ Experiment template created: $FILEPATH"
echo ""
echo "📋 Next steps:"
echo "1. Copy the prompt from: prompts/versions/stable/prompt.md"
echo "2. Submit it to your AI model ($MODEL)"
echo "3. Edit $FILEPATH and paste the response"
echo "4. Commit and create a PR:"
echo "   git add \"$FILEPATH\""
echo "   git commit -m \"Add $MODEL experiment results\""
echo "   git push"