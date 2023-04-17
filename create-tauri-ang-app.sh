#!/bin/bash

# Check if a project name is provided
if [ -z "$1" ]; then
  echo "Usage: ./create-tauri-tailwind-app.sh <projectname>"
  exit 1
fi

PROJECT_NAME=$1

# Create a new Tauri app with the specified project name
yarn create tauri-app $PROJECT_NAME

# Change to the newly created project directory
cd $PROJECT_NAME

# Add the required packages
yarn add tailwindcss@latest daisyui@latest @tauri-apps/cli @tauri-apps/api

# Initialize TailwindCSS
npx tailwindcss init
cat > tailwind.config.js <<- EOF
module.exports = {
  content: ["./src/**/*.{html,ts}"],
  theme: { extend: {} },
  plugins: [require("daisyui")],
}
EOF

# Replace src/styles.css with TailwindCSS files
echo '@tailwind base;' > src/styles.css
echo '@tailwind components;' >> src/styles.css
echo '@tailwind utilities;' >> src/styles.css

# Print a success message
echo "Tauri app with TailwindCSS and DaisyUI has been created successfully."

echo "Opening VS Code..."

# Open the project in VS Code
code .

# Running Yarn
yarn 