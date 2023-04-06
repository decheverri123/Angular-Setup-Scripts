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

# Install Tailwind CSS and dependencies
npm install -D tailwindcss postcss autoprefixer daisyui

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

# Instructions for starting the project
echo -e "Project setup complete. To start, run:\ncd $PROJECT_NAME\nng serve"
