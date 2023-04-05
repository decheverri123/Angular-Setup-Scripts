# Project Setup Scripts

This repository contains two bash scripts to automate the setup of Angular projects with specific configurations.

## 1. create-ang-tail-app.sh

This script sets up a new Angular project with Tailwind CSS and DaisyUI.

### Usage

```bash
./create-ang-tail-app.sh <project_name>
```
Replace <project_name> with the desired name for your Angular project.

What it does
* Creates a new Angular project with the specified name, CSS styling, and routing enabled.
* Installs Tailwind CSS and its dependencies (PostCSS and Autoprefixer).
* Initializes Tailwind CSS configuration.
* Installs DaisyUI.
* Creates a tailwind.config.js file with the necessary configuration for DaisyUI.
* Updates src/styles.css with Tailwind CSS imports.

## 2. create-tauri-ang-app.sh

This script sets up a new Angular project with Tailwind CSS, DaisyUI, and Tauri integration.

### Usage

```bash
./create-tauri-ang-app.sh <project_name>
```
Replace <project_name> with the desired name for your Angular project.

What it does
* Performs all the steps from create-ang-tail-app.sh.
* Installs Tauri dependencies and CLI.
* Initializes Tauri in the project.
* Adds the "tauri" script to the package.json file.
