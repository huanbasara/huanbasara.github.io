#!/bin/bash

# Git commit and push script
# Usage: ./commit.sh "Your commit message"

# Check if commit message is provided
if [ $# -eq 0 ]; then
    echo "❌ Error: Please provide a commit message"
    echo "Usage: ./commit.sh \"Your commit message\""
    echo "Example: ./commit.sh \"Add new movie to watchlist\""
    exit 1
fi

# Get the commit message from the first argument
COMMIT_MESSAGE="$1"

echo "🚀 Starting git operations..."
echo "📝 Commit message: $COMMIT_MESSAGE"
echo ""

# Add all changes
echo "📁 Adding all changes..."
git add .

# Check if there are any changes to commit
if git diff --cached --quiet; then
    echo "ℹ️  No changes to commit"
    exit 0
fi

# Show what will be committed
echo "📋 Changes to be committed:"
git status --short
echo ""

# Commit with the provided message
echo "💾 Committing changes..."
git commit -m "$COMMIT_MESSAGE"

if [ $? -eq 0 ]; then
    echo "✅ Commit successful!"
else
    echo "❌ Commit failed!"
    exit 1
fi

# Push to master branch
echo "🌐 Pushing to GitHub..."
git push origin master

if [ $? -eq 0 ]; then
    echo "🎉 Successfully pushed to GitHub!"
    echo "🔗 Your changes will be live in 2-5 minutes at:"
    echo "   https://huanbasara.github.io/standalone/movie-watchlist.html"
else
    echo "❌ Push failed!"
    exit 1
fi

echo ""
echo "✨ All done! Your movie watchlist has been updated!"
