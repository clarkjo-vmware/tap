# TAP Install Script

This repository contains scripts that automate the installation process for TAP (Tanzu Application Platform) utilizing an existing tap values file. The script performs the necessary steps to set up the Harbor project, pull the images, push the images, create the Tanzu repository, and install TAP.

## Instructions

1. Set Environmental Variables:
   - Open the `configs/variables.env` file.
   - Set the required environmental variables for the installation, updating the values accordingly.
   - Save the file.

2. Execute the Script:
   - Open a terminal or command prompt.
   - Navigate to the directory where the `tap-install-script.sh` file is located.
   - Make the script executable by running the following command:
     ```
     chmod +x tap-install-script.sh
     ```
   - Run the script using the following command:
     ```
     ./tap-install-script.sh
     ```
   - The script will execute the necessary steps for the TAP installation process.

## Script Overview

The following tasks are executed by the script:

- **Set Environmental Variables:** Sets the required environmental variables for the installation.
- **Check Harbor Project Existence:** Verifies if the "tap" Harbor project already exists. If it does, the script skips the project creation step.
- **Create Harbor Project:** Creates a public Harbor project named "tap".
- **Pull TAP Images and Package:** Pulls TAP images from the registry and pushes them to an internal repository using the `imgpkg` command.
- **Check Namespace Existence:** Checks if the "tap-install" namespace already exists in the Kubernetes cluster. If not, the script creates the namespace.
- **Create Registry Secret:** Creates a registry secret named "tap-registry" to authenticate with the Harbor registry using the provided credentials.
- **Check Package Repository Existence:** Checks if the "tanzu-tap-repository" package repository exists in the "tap-install" namespace. If it does not exist, the script adds the repository.
- **Verify Package Repository:** Verifies the successful installation of the package repository.
- **Verify App Package Availability:** Ensures the availability of the TAP app package.
- **Install TAP:** Installs TAP using the provided "tap-full" values file and specified version.
- **Uninstall TAP:** (Commented out) Provides a reference for uninstalling TAP if necessary in the future.

Make sure to set the appropriate values for the environmental variables before running the script.

Note: The script includes the `set -e` option to immediately exit on any error encountered during execution.

## Additional Configuration

The `configs` folder contains some basic configuration files for post-installation configuration. Modify these files as needed for your specific setup.

Please ensure you have the necessary dependencies and permissions to execute the script successfully.

