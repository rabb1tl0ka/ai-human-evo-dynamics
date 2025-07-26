# 🔰 First Time on GitHub? No Problem!

This guide will help you submit your experiment results even if you've never used GitHub before. It's easier than you think!

## 🎯 What is a "Pull Request"?
Think of it like suggesting an edit to a shared document. You're saying "Hey, I have some results to add to your research project!"

## 📱 Two Ways to Do This

### 🌐 Option A: Using GitHub Website (Easiest)
**Time needed: 3-5 minutes**

#### Step 1: Fork the Repository
1. Go to the main page of this repository
2. Click the **"Fork"** button in the top-right corner
3. Click **"Create fork"**
4. Wait a few seconds - you now have your own copy!

#### Step 2: Navigate to the Right Folder
1. In YOUR fork, click on the **"prompts"** folder
2. Click **"current"** 
3. Click **"experiments"**
4. Click the folder for your AI company (e.g., **"openai"** for ChatGPT)
5. Click the folder for your specific model (e.g., **"gpt-4"**)

#### Step 3: Create Your Results File
1. Click **"Add file"** → **"Create new file"**
2. Name your file: `2024-07-26_yourname_result.md` (use today's date and your name)
3. Copy the template from `/templates/experiment-template.md`
4. Paste it in the big text box
5. Fill in your experiment results
6. Scroll down and click **"Commit new file"**

#### Step 4: Create Pull Request
1. You'll see a yellow banner saying "This branch is 1 commit ahead" 
2. Click **"Contribute"** → **"Open pull request"**
3. Add a title like: "Experiment results: GPT-4 response"
4. Click **"Create pull request"**
5. Done! 🎉

### 💻 Option B: Using Git (For Tech-Savvy Users)
```bash
# 1. Fork the repo on GitHub, then clone your fork
git clone https://github.com/YOUR-USERNAME/ai-human-evo-dynamics.git
cd ai-human-evo-dynamics

# 2. Create your results file
mkdir -p prompts/current/experiments/openai/gpt-4
cp templates/experiment-template.md prompts/current/experiments/openai/gpt-4/2024-07-26_yourname_result.md

# 3. Edit the file with your results
# [Use your favorite editor]

# 4. Commit and push
git add .
git commit -m "Add GPT-4 experiment results"
git push origin main

# 5. Go to GitHub and create pull request
```

## 🗂️ Where Should My File Go?

**File path pattern:**
```
prompts/current/experiments/[company]/[model]/YYYY-MM-DD_yourname_result.md
```

**Examples:**
- ChatGPT 4: `prompts/current/experiments/openai/gpt-4/2024-07-26_john_result.md`
- Claude Sonnet: `prompts/current/experiments/anthropic/claude-sonnet-4/2024-07-26_sarah_result.md`
- Gemini: `prompts/current/experiments/google/gemini-pro/2024-07-26_mike_result.md`

**Company folder names:**
- `openai` - for ChatGPT, GPT-4, etc.
- `anthropic` - for Claude models
- `google` - for Gemini, Bard, PaLM
- `meta` - for Llama models
- `other` - for everything else

## ❓ Common Questions

**Q: I made a mistake in my file, how do I fix it?**
A: You can edit files in your fork on GitHub by clicking the pencil icon, then create a new pull request.

**Q: What if the folder for my AI model doesn't exist?**
A: Create it! In GitHub, when creating a new file, you can type `foldername/filename.md` to create folders.

**Q: I'm getting confused with all the clicking**
A: No worries! Watch for the breadcrumb trail at the top (like: `ai-human-evo-dynamics > prompts > current > experiments`) to see where you are.

**Q: What if I accidentally put my file in the wrong place?**
A: Don't worry! The maintainer will help guide you to move it to the right spot.

**Q: Do I need to know how to code?**
A: Nope! You're just creating a text file with your AI's response.

## 🆘 Still Stuck?

1. **Look for existing examples** - check other people's submitted results to see the pattern
2. **Create an issue** - if you're really stuck, create an issue asking for help
3. **Start simple** - don't worry about being perfect, the maintainer can help fix small issues

## 🎉 You Did It!

Once you submit your pull request:
- The maintainer will review it (usually within a few days)
- They might ask for small changes
- Once approved, your results become part of the research!
- You'll get credit in the Git history

**Welcome to open source research! 🚀**

---

*Remember: Everyone was a beginner once. The GitHub community is generally very helpful and patient with newcomers.*