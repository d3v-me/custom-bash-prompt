# Custom Bash Prompt Installer

![user](https://github.com/user-attachments/assets/fab0826f-34d1-4bfa-8b50-6c81b64e86b1)![root](https://github.com/user-attachments/assets/3686096b-c845-4071-8a36-1ea43edeb9f3)

## Description

This project provides a script to install a custom Bash prompt on Debian-based systems. The prompt is designed to be visually appealing and informative, featuring color-coded elements such as the username, host, and current working directory. It also indicates when the last command failed.

## Features

- **Color-Coded Information**: The prompt displays the username, host, and current working directory with distinct colors.
- **Error Indicator**: A red `[✗]` is shown if the last command did not succeed.
- **Root User Indicator**: The prompt color and symbol change when logged in as the root user.

## Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/d3v-me/custom-bash-prompt.git
    cd custom-bash-prompt
    ```

2. **Make the Script Executable**:
    ```bash
    chmod +x install_prompt.sh
    ```

3. **Run the Installation Script**:
    ```bash
    ./install_prompt.sh
    ```

4. **Open a New Terminal**: The custom Bash prompt will be active in any new terminal session.

## How It Works

- The script creates a `.bash_prompt` file in your home directory with the custom prompt configuration.
- It modifies your `.bashrc` to source the `.bash_prompt` file on each new terminal session, ensuring the prompt is consistently applied.

## Example

Here is what the prompt looks like:

┌─[user@home]-[~]

└──╼ $

┌─[root@home]-[~]

└──╼ $

- The username is in light blue (or bright red if you're the root user).
- The hostname is in blue.
- The current working directory is in light purple.
- A `[✗]` symbol appears in red if the last command failed.

## Customization

You can customize the colors and prompt structure by editing the `.bash_prompt` file in your home directory after installation.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request or open an Issue for any suggestions, bug reports, or enhancements.

---

Feel free to share this project with others or contribute to make it even better!
