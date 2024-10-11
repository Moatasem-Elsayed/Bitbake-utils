
# Bitbake Utils
-  bitbake-append
- [ ] bitbake-variables
- bitbake-search
- [ ] bitbake-glossery
## BBAppend Creator Script

This script is designed to simplify the process of creating `.bbappend` files in Yocto by automating the layer and recipe selection process. The script searches through the available layers and recipes, allows the user to select one using a Gum-based interactive prompt, and automatically generates the `.bbappend` file in the appropriate directory.

## Requirements

- **Yocto Project**: Ensure you're working in a Yocto Project environment with a valid `BBPATH` set up.
- **Gum**: This script uses [Gum](https://github.com/charmbracelet/gum) for interactive selection. Make sure Gum is installed.

To install Gum, you can use:

> https://github.com/charmbracelet/gum

> go install github.com/charmbracelet/gum@latest  # using Go


## How It Works

1. **Layer Discovery**: The script reads the `bblayers.conf` file and retrieves all defined layers.
2. **Recipe Search**: It searches for a BitBake recipe (`.bb` file) that matches the provided name in the layers.
3. **User Interaction**: Using Gum, it prompts the user to select the appropriate recipe and layer for appending.
4. **BBAppend Creation**: It automatically creates a `.bbappend` file in the selected layer and directory structure, ensuring `FILESEXTRAPATHS` is set.

## Usage

```bash
./create_bbappend.sh <recipe_name>
```

### Example

```bash
./create_bbappend.sh my-recipe
```

### Parameters

- **recipe_name**: The name of the recipe you want to append. The script will search for any recipe that matches this name in the available layers.

### Output

- The script creates a `.bbappend` file in the selected layer, appending the directory structure and creating `FILESEXTRAPATHS` accordingly.

## Important Notes

- The script requires that you have a valid `bblayers.conf` in your Yocto project directory, which defines the available layers.
- The `BBPATH` environment variable should be set correctly, pointing to your project's base directory.

## Example Workflow

![image](https://github.com/user-attachments/assets/48ee2ba8-b513-4bf0-8e67-f9752d919a5d)
![image](https://github.com/user-attachments/assets/c60173d9-c70d-473c-b7cb-a3757e1165e0)
![image](https://github.com/user-attachments/assets/bf572b19-4ab8-47af-8ba4-4689dbbf0b2f)


# Bitbake Layer and Recipe Search Script

This Bash script helps you search for Bitbake layers and recipes within a Yocto Project environment. It can search for distribution configuration files, machine files, and image recipes across different layers in a Yocto build setup. The script also provides an option to display usage help.

## Features

- Search for Bitbake **distro** configuration files.
- Search for Bitbake **machine** configuration files.
- Search for **image** recipes.
- Display a help message that describes usage.

## Prerequisites

This script assumes that you are in a Yocto build environment and have the required Bitbake layers properly configured. The following files are expected to be sourced:
- `bitbake-bblayers.sh`: Script to retrieve Bitbake layers.
- `bitbake-recipes.sh`: Script for handling Bitbake recipes.

Ensure that these scripts are available and contain the necessary functions such as `getbblayers`.

## Usage

```bash
./search-bitbake.sh [options]
Here is a README.md file for your Bash script. It describes what the script does, how to use it, and includes example usage scenarios.

markdown

# Bitbake Layer and Recipe Search Script

This Bash script helps you search for Bitbake layers and recipes within a Yocto Project environment. It can search for distribution configuration files, machine files, and image recipes across different layers in a Yocto build setup. The script also provides an option to display usage help.

## Features

- Search for Bitbake **distro** configuration files.
- Search for Bitbake **machine** configuration files.
- Search for **image** recipes.
- Display a help message that describes usage.

## Prerequisites

This script assumes that you are in a Yocto build environment and have the required Bitbake layers properly configured. The following files are expected to be sourced:
- `bitbake-bblayers.sh`: Script to retrieve Bitbake layers.
- `bitbake-recipes.sh`: Script for handling Bitbake recipes.

Ensure that these scripts are available and contain the necessary functions such as `getbblayers`.

## Usage

```bash
./search-bitbake.sh [options]

Option	Description
-d	Search for distro configuration files.
-m	Search for machine configuration files.
-i	Search for image recipes.
-h	Display this help message.


![image](https://github.com/user-attachments/assets/29504c42-e94d-4192-afbc-b4231cf64bf1)

