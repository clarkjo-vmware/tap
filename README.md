

## TAP Install Script

This bash script automates the installation process for TAP (Tanzu Application Platform) utilizing an existing tap values file. The script performs the necessary steps to set up the harbor project, pull the images, push the images, create the tanzu repo and install TAP. The following tasks are executed by the script:

1. Set Environmental Variables: Sets the required environmental variables for the installation.
2. Check Harbor Project Existence: Verifies if the "tap-packages" Harbor project already exists. If it does, the script skips the project creation step.
3. Create Harbor Project: Creates a public Harbor project named "tap-packages".
4. Pull TAP Images and Package: Pulls TAP images from the registry and packages them into a TAR bundle using `imgpkg` command.
5. Check Namespace Existence: Checks if the "tap-install" namespace already exists in the Kubernetes cluster. If not, the script creates the namespace.
6. Create Registry Secret: Creates a registry secret named "tap-registry" to authenticate with the Harbor registry using the provided credentials.
7. Check Package Repository Existence: Checks if the "tanzu-tap-repository" package repository exists in the "tap-install" namespace. If it does not exist, the script adds the repository.
8. Verify Package Repository: Verifies the successful installation of the package repository.
9. Verify App Package Availability: Ensures the availability of the TAP app package.
10. Install TAP: Installs TAP using the provided "tap-full" values file and specified version.
11. Uninstall TAP: (Commented out) Provides a reference for uninstalling TAP if necessary in the future.

Make sure to set the appropriate values for the environmental variables before running the script.

**Note:** The script includes the `set -e` option to immediately exit on any error encountered during execution.

To execute the script, save it to a file (e.g., `tap-install-script.sh`), and make it executable using `chmod +x tap-install-script.sh`. Run the script using `./tap-install-script.sh` in a bash environment.

Ensure you have the necessary dependencies and permissions to execute the script successfully.
