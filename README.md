# PHP Developer Utility Script

This Bash script provides several useful functions for PHP developers, including:

1. **Create New PHP Project**: Quickly create a new PHP project with the basic directory structure.
2. **Start Local Server**: Run a local PHP server with automatic reloading on file changes.
3. **Check PHP Syntax**: Recursively check the syntax of PHP files in a directory.
4. **Clear Caches**: Clear the Composer and Symfony caches.

## Installation

1. Save the script to a file, for example, `php-dev-utils.sh`.
2. Make the script executable with the command: `chmod +x php-dev-utils.sh`.
3. (Optional) Move the script to a directory in your system's `$PATH` to access it globally.

## Usage

1. **Create New PHP Project**:
   ```bash
   ./php-dev-utils.sh create_new_project my-project
   ```
   This will create a new directory named `my-project` with the basic project structure.

2. **Start Local Server**:
   ```bash
   ./php-dev-utils.sh start_local_server
   ```
   This will start a local PHP server and automatically reload it when files change.

3. **Check PHP Syntax**:
   ```bash
   ./php-dev-utils.sh check_php_syntax
   ```
   This will check the syntax of all PHP files in the current directory.

4. **Clear Caches**:
   ```bash
   ./php-dev-utils.sh clear_caches
   ```
   This will clear the Composer and Symfony caches.

You can also run the script without any arguments to see the list of available functions.

## Dependencies

The script uses the `inotifywait` command to watch for file changes. Make sure you have the `inotify-tools` package installed on your system.

## Customization

You can customize the script by modifying the functions or adding new ones to suit your specific needs.

## Contributing

If you have any suggestions or find any issues, feel free to submit a pull request or open an issue on the project's repository.

## License

This script is licensed under the [MIT License](LICENSE).