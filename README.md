
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
