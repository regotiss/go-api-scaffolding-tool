#!/bin/sh

Replace() {
  echo "Replacing $2 with $3"
  find "$1" -type f | LC_ALL=C xargs sed -i '' -e "s+$2+$3+g"
}

read -p 'Please enter api root name. For e.g. users, payment etc. : ' api_name

current_path="$PWD"

service_name="$api_name-api"
caps_api_name=$(echo $api_name | tr 'a-z' 'A-Z')

echo "-----------------------------SERVICE CREATION STARTED-------------------------------"
echo "Creating service $api_name"
cd ..

service_location="$PWD/$service_name"

echo "Creating new $service_name directory"
mkdir "$service_name"

echo "Copying template inside service"
cp -R $current_path/template/ $service_name/

Replace "$service_name/" "{api_name}" "$api_name"
Replace "$service_name/" "{API_NAME}" "$caps_api_name"

echo "$service_name created at $service_location"

echo "initializing git repository"
cd $service_name/
git init
cd ..

echo "-----------------------------SERVICE CREATION COMPLETED-----------------------------"
