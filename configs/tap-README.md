# TAP Installation Guide

This guide provides step-by-step instructions for installing TAP (Tanzu Application Platform). Please follow the instructions below to set up the necessary environment variables, create namespaces, configure registry secrets, add repositories, and install or uninstall TAP.

## Prerequisites

Before proceeding with the installation, ensure that you have met the following prerequisites:

- Kubernetes cluster is set up and accessible.
- `kubectl` command-line tool is installed and configured to access the cluster.
- Tanzu CLI (`tanzu`) is installed and properly configured.

## Step 1: Set Environmental Variables

To begin the installation process, set the following environmental variables by running the commands in your shell:

```shell

```
## Pull TAP Images

```shell
imgpkg copy \
  -b registry.tanzu.vmware.com/tanzu-application-platform/tap-packages:$TAP_VERSION \
  --to-tar tap-packages-$TAP_VERSION.tar \
  --include-non-distributable-layers
```
## Push TAP Images

```shell
imgpkg copy \
  --tar tap-packages-$TAP_VERSION.tar \
  --to-repo $IMGPKG_REGISTRY_HOSTNAME/tap-packages \
  --include-non-distributable-layers \
  --registry-ca-cert-path $REGISTRY_CA_PATH
```

## Step 2: Create a Namespace

Create a Kubernetes namespace called `tap-install` using the following command:

```shell
kubectl create ns tap-install
```

## Step 3: Create Registry Secret

Create a registry secret named `tap-registry` for TAP installation. Run the following command:

```shell
tanzu secret registry add tap-registry \
    --server   $IMGPKG_REGISTRY_HOSTNAME \
    --username $IMGPKG_REGISTRY_USERNAME \
    --password $IMGPKG_REGISTRY_PASSWORD \
    --namespace tap-install \
    --export-to-all-namespaces \
    --yes
```

## Step 4: Add TAP Repository

Add the TAP repository to Tanzu using the following command:

```shell
tanzu package repository add tanzu-tap-repository \
  --url $IMGPKG_REGISTRY_HOSTNAME/tap/tap-packages/tap:$TAP_VERSION \
  --namespace tap-install
```

## Step 5: Verify Package Repository

Verify that the package repository has been installed correctly by running the following command:

```shell
tanzu package repository get tanzu-tap-repository --namespace tap-install
```

## Step 6: Verify Available App Packages

Check the availability of the TAP application package by executing the following command:

```shell
tanzu package available list tap.tanzu.vmware.com --namespace tap-install
```

## Step 7: Install TAP

Install TAP using the `tap-full.yaml` values file. Run the following command:

```shell
tanzu package install tap -p tap.tanzu.vmware.com -v $TAP_VERSION --values-file tap-full-github.yaml -n tap-install
```

## Step 8: Uninstall TAP

To uninstall TAP, use the following command:

```shell
tanzu package installed delete tap --namespace tap-install
```

That's it! You have successfully installed and uninstalled TAP using the provided instructions.