# Dotfiles

thaitani's personal dotfiles for macOS development environment setup.

## どんなプロジェクト？ (What kind of project?)

This is a comprehensive dotfiles repository that automatically sets up a complete macOS development environment. It includes configurations for popular development tools, shell enhancements, and productivity applications.

### 🛠️ Included Tools & Configurations

**Shell & Terminal:**
- Zsh with [Zinit](https://github.com/zdharma-continuum/zinit) plugin manager
- [Starship](https://starship.rs/) prompt configuration
- iTerm2 terminal emulator

**Development Tools:**
- Version managers: [asdf](https://asdf-vm.com/) (Node.js 18.10.0, Python 3.11.0, Terraform 1.3.2, Deno 2.2.2)
- Editors: Vim, Visual Studio Code
- Git configuration and [GitHub CLI](https://cli.github.com/)
- Development containers: OrbStack
- Cloud tools: Google Cloud SDK

**Package Managers:**
- [Homebrew](https://brew.sh/) with curated package list
- npm, pnpm configuration
- 1Password integration

**Productivity Apps:**
- Browser: Brave Browser, Google Chrome
- IDE: Android Studio, Xcode
- Utilities: Raycast, Notion, Obsidian, DeepL
- System tools: Karabiner Elements for keyboard customization

**System Optimizations:**
- macOS defaults configuration (Dock, Finder, Safari settings)
- XDG Base Directory compliance
- Screenshot organization
- Dark mode setup

## 📋 Prerequisites

- macOS (Darwin)
- Internet connection for downloading tools
- Administrative privileges for some installations

## 🚀 Quick Install

Run this one-liner in your terminal:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/thaitani/dotfiles/main/install.sh)"
```

This will:
1. Clone the repository to `~/ghq/github.com/thaitani/dotfiles`
2. Run the complete setup process automatically

## 🎯 Manual Installation

If you prefer step-by-step installation:

```bash
# Clone the repository
git clone https://github.com/thaitani/dotfiles ~/ghq/github.com/thaitani/dotfiles
cd ~/ghq/github.com/thaitani/dotfiles

# Run all setup steps
make all

# Or run individual steps
make init      # Install Homebrew and Zinit
make link      # Create symbolic links for config files
make homebrew  # Install Homebrew packages
make mac       # Configure macOS defaults
```

## 📁 Project Structure

```
.
├── README.md           # This file
├── Makefile           # Automation scripts
├── install.sh         # One-line installer
├── config/            # Configuration files
│   ├── zsh/          # Zsh configuration
│   ├── vim/          # Vim configuration
│   ├── git/          # Git configuration
│   ├── homebrew/     # Brewfile for package management
│   ├── asdf/         # Runtime version definitions
│   └── starship.toml # Starship prompt config
└── setup_scripts/     # Installation scripts
    ├── init.bash     # Initial setup (Homebrew, Zinit)
    ├── links.bash    # Symlink creation
    ├── homebrew.bash # Package installation
    └── mac.bash      # macOS system preferences
```

## 🔧 Additional Setup (Optional)

After the main installation, you can run these additional commands:

```bash
# Install additional runtime versions
make asdf

# Install commit message tools
make cz
```

## ⚙️ Customization

The configuration files are modular and can be customized:

- Edit `config/homebrew/Brewfile` to modify installed packages
- Modify `config/asdf/.tool-versions` for different runtime versions
- Customize `config/zsh/.zshrc` for shell behavior
- Adjust `setup_scripts/mac.bash` for different macOS preferences

## 🔍 What Gets Installed

**Command Line Tools:**
act, bluetoothconnector, dust, fd, fzf, gibo, git, gh, ghq, jq, mas, shellcheck, procs, vim

**Desktop Applications:**
1Password, Android Studio, Brave Browser, Visual Studio Code, iTerm2, Notion, Obsidian, Raycast, and many more

**Development Runtimes:**
- Node.js 18.10.0
- Python 3.11.0  
- Terraform 1.3.2
- Deno 2.2.2

## 📄 License

Personal dotfiles repository - feel free to fork and customize for your own use.

---

## スクリプトの実行 (Script Execution)

ワンライナーでの実行:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/thaitani/dotfiles/main/install.sh)"
```
