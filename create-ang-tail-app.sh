#!/bin/bash

# Check if a project name is provided
if [ -z "$1" ]
then
  echo "Please provide a project name"
  exit 1
fi

# Set the project name
PROJECT_NAME=$1

# Create a new Angular project
ng new $PROJECT_NAME --style=css --routing=true
cd $PROJECT_NAME

# Install Tailwind CSS and dependencies
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init
npm i daisyui

# Create a tailwind.config.js file
cat << EOF > tailwind.config.js
module.exports = {
  content: [
    "./src/**/*.{html,ts}",
  ],
  theme: {
    extend: {},
  },
  plugins: [require("daisyui")],
}
EOF

# Update src/styles.scss
echo -e "@import 'tailwindcss/base';\n@import 'tailwindcss/components';\n@import 'tailwindcss/utilities';" >> src/styles.css

echo "Project setup complete. To start, run:"
echo "cd $PROJECT_NAME"
echo "ng serve"
