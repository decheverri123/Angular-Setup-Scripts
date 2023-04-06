#!/bin/bash

# Check if a project name is provided and set the project name
if [ -z "$1" ]; then
  echo "Please provide a project name"
  exit 1
else
  PROJECT_NAME=$1
fi

# Create a new Angular project and navigate to the project directory
ng new $PROJECT_NAME --style=css --routing=true && cd $PROJECT_NAME

# Install Tailwind CSS, Tauri dependencies, and other required packages
npm install -D tailwindcss postcss autoprefixer daisyui @tauri-apps/cli @tauri-apps/api

# Initialize Tailwind CSS and create a tailwind.config.js file
npx tailwindcss init -p
cat > tailwind.config.js <<- EOF
module.exports = {
  content: ["./src/**/*.{html,ts}"],
  theme: { extend: {} },
  plugins: [require("daisyui")],
}
EOF

# Update src/styles.scss
echo -e "@import 'tailwindcss/base';\n@import 'tailwindcss/components';\n@import 'tailwindcss/utilities';" >> src/styles.css

# Initialize Tauri
npx tauri init

# Add the "tauri:tauri" script to the package.json file
jq '.scripts += {"tauri": "tauri"}' package.json > package.json.tmp && mv package.json.tmp package.json

# Instructions for starting the project
echo -e "Project setup complete. To start, run:\ncd $PROJECT_NAME\nnpm run tauri dev"
