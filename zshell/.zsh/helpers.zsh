#!/bin/zsh
reload() {
  . ~/.zshrc
}

install() {
  SILENT=false
  SUPRESS=false
  package_name=""
  binary_name=""
  package_manager="brew"
  binary_path=""
  install_cmd=""

  # Help message function
  show_help() {
    echo "Usage: install [OPTIONS] PACKAGE [BINARY_NAME] [PACKAGE_MANAGER]"
    echo ""
    echo "Install packages across different package managers"
    echo ""
    echo "Arguments:"
    echo "  PACKAGE          Name of the package to install"
    echo "  BINARY_NAME      Name of the binary to check (defaults to PACKAGE)"
    echo "  PACKAGE_MANAGER  Package manager to use (brew/apt/pacman/dnf/yum) (defaults to brew)"
    echo ""
    echo "Options:"
    echo "  -h, --help      Show this help message and exit"
    echo "  -s, --silent    Suppress all output except errors"
    echo "  -su, --suppress Suppress only 'already installed' messages"
    echo ""
    echo "Examples:"
    echo "  install bat"
    echo "  install -s bat"
    echo "  install python-pip pip apt"
    echo "  install --silent python-pip pip apt"
  }

  # Parse flags
  while [[ "$#" -gt 0 ]]; do
    case "$1" in
    -h | --help)
      show_help
      return 0
      ;;
    -s | --silent)
      SILENT=true
      ;;
    -su | --suppress)
      SUPRESS=true
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo "Unknown option: $1"
      echo "Try 'install --help' for more information."
      return 1
      ;;
    *)

      # Assign positional parameters to variables
      if [ -z "$package_name" ]; then
        package_name=$1
        binary_name=$1
      elif [ -z "$binary_name" ]; then
        binary_name=$1
      else
        package_manager=$1
      fi
      ;;

    esac
    shift
  done

  # Validate required parameters
  if [ -z "$package_name" ]; then
    echo "Error: Package name is required."
    echo "Try 'install --help' for more information."
    return 1
  fi

  # Set the binary path and install command based on package manager
  case $package_manager in
  "brew")
    binary_path="$BREW_PREFIX/bin/$binary_name"
    install_cmd="$BREW_PREFIX/bin/brew install $package_name"
    ;;
  "apt")
    binary_path="/usr/bin/$binary_name"
    install_cmd="sudo apt install -y $package_name"
    ;;
  "yay")
    binary_path="/usr/bin/$binary_name"
    install_cmd="yay -S --noconfirm $package_name"
    ;;
  "pacman")
    binary_path="/usr/bin/$binary_name"
    install_cmd="sudo pacman -S --noconfirm $package_name"
    ;;
  "dnf")
    binary_path="/usr/bin/$binary_name"
    install_cmd="sudo dnf install -y $package_name"
    ;;
  "yum")
    binary_path="/usr/bin/$binary_name"
    install_cmd="sudo yum install -y $package_name"
    ;;
  *)
    echo "Error: Unsupported package manager: $package_manager"
    echo "Supported package managers: brew, apt, pacman, dnf, yum"
    return 1
    ;;
  esac

  # Check if the binary is already installed
  if [ ! -f $binary_path ]; then
    [ "$SILENT" = false ] && echo "(1/2) Installing $package_name..."
    if eval $install_cmd; then
      [ "$SILENT" = false ] && echo "(2/2) Successfully installed $package_name."
    else
      echo "(2/2) Error: Failed to install $package_name."
      return 1
    fi
  else
    [ "$SILENT" = false ] && [ "$SUPRESS" = false ] && echo "(1/1) $package_name is already installed."
  fi
}


ensure_package() {
  SILENT=false
  SUPPRESS=false
  package_name=""
  binary_name=""
  package_manager=""
  FLAGS=""

  # Help message function
  show_help() {
    echo "Usage: ensure_package [OPTIONS] PACKAGE"
    echo ""
    echo "Ensure a package is installed, installing it if necessary"
    echo ""
    echo "Arguments:"
    echo "  PACKAGE          Name of the package to ensure"
    echo ""
    echo "Options:"
    echo "  -h, --help      Show this help message and exit"
    echo "  -s, --silent    Suppress all output"
    echo "  -su, --suppress Suppress only 'already installed' messages"
    echo "  -b, --binary    Specify binary name (defaults to package name)"
    echo "  -p, --package-manager  Package manager to use (defaults to auto-detect)"
    echo ""
    echo "Examples:"
    echo "  ensure_package bat"
    echo "  ensure_package -s bat"
    echo "  ensure_package python-pip -b pip -p apt"
  }

  if [[ "$ENSURE_PACKAGES" == "false" ]]; then
    return 0
  fi

  # Parse flags
  while [[ "$#" -gt 0 ]]; do
    case $1 in
    -h | --help)
      show_help
      return 0
      ;;
    -s | --silent)
      SILENT=true
      FLAGS="$FLAGS -s"
      ;;
    -su | --suppress)
      SUPPRESS=true
      FLAGS="$FLAGS -su"
      ;;
    -b | --binary)
      shift
      binary_name=$1
      ;;
    -p | --package-manager)
      shift
      package_manager=$1
      ;;
    --)
      shift
      break
      ;;
    -*)
      echo "Unknown option: $1"
      echo "Try 'ensure_package --help' for more information."
      return 1
      ;;
    *)
      if [ -z "$package_name" ]; then
        package_name=$1
      else
        echo "Error: Unexpected argument: $1"
        echo "Try 'ensure_package --help' for more information."
        return 1
      fi
      ;;
    esac
    shift
  done

  # Validate required parameters
  if [ -z "$package_name" ]; then
    echo "Error: Package name is required"
    echo "Try 'ensure_package --help' for more information."
    return 1
  fi

  # Set binary name to package name if not specified
  if [ -z "$binary_name" ]; then
    binary_name=$package_name
  fi

  # First check if the command already exists
  if command -v "$binary_name" >/dev/null 2>&1; then
    [ "$SILENT" = false ] && [ "$SUPPRESS" = false ] && echo "Package $package_name is already installed"
    return 0
  fi

  # Auto-detect package manager if not specified
  if [ -z "$package_manager" ]; then
    if command -v brew >/dev/null 2>&1; then
      package_manager="brew"
    elif command -v apt >/dev/null 2>&1; then
      package_manager="apt"
    elif command -v yay >/dev/null 2>&1; then
      package_manager="yay"
    elif command -v pacman >/dev/null 2>&1; then
      package_manager="pacman"
    elif command -v dnf >/dev/null 2>&1; then
      package_manager="dnf"
    else
      echo "Error: Could not detect package manager"
      return 1
    fi
  fi

  # Only install if the command doesn't exist
  install $FLAGS "$package_name" "$binary_name" "$package_manager"
}