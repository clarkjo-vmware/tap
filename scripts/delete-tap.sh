#!/bin/bash

# Prompt user for confirmation before proceeding
read -p "Are you currently in the correct Kubernetes context? (y/n): " confirm_context

if [[ $confirm_context != [yY] ]]; then
    echo "Please switch to the correct Kubernetes context and run the script again."
    exit 1
fi

# Prompt user for confirmation before proceeding with deletion
read -p "Are you sure you want to delete the TAP installation in the 'tap-install' namespace? This action cannot be undone. (y/n): " confirm_deletion

if [[ $confirm_deletion != [yY] ]]; then
    echo "Deletion canceled. Exiting script."
    exit 0
fi

# Delete TAP installation
tanzu package installed delete tap --namespace tap-install

