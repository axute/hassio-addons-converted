# HAOS Add-on Converter

This tool is a web-based converter that transforms any Docker image into a Home Assistant add-on.

## Features

### 🚀 Core Converter Features
- **Smart Entrypoint Preservation**: Uses `crane` to automatically detect and preserve the original `ENTRYPOINT` and `CMD` of any Docker image.
- **Package Manager Detection**:
  - **Two-Stage Analysis**: Automatically detects the package manager (`apk`, `apt`, `yum`, etc.) by first checking the image history and then falling back to a deep filesystem scan using `crane export`.
  - **Smart Caching**: Results are cached globally to ensure lightning-fast responses for previously analyzed images.
- **Environment Variables**:
  - **Static Variables**: Fixed within the add-on configuration.
  - **Editable Variables**: Can be changed via the Home Assistant GUI after installation using a universal wrapper script.
  - **Risk Note**: Uses a wrapper script that replaces the entrypoint; includes warning for complex images.
- **Universal Shell Support**: POSIX-compliant `/bin/sh` wrapper script, ensuring compatibility with minimalist images (e.g., Alpine) without `jq` or `bash` dependencies.
- **Clean Dockerfiles**: Minimal generated `Dockerfile`. Standard add-ons use `FROM`, while advanced ones integrate the wrapper logic automatically.
- **Simplified Config**: Clean `config.yaml` that only includes `options` and `schema` when necessary.

### 🔌 Home Assistant Integration
- **Ingress Support**:
  - Seamless access to the web interface via Home Assistant Ingress.
  - Customizable **Panel Icon** (MDI) for the sidebar.
  - **Ingress Stream** support for WebSockets/VNC.
- **Web UI Configuration**: Automatic `webui` URL generation (e.g., `http://[HOST]:[PORT:xxxx]/`) if Ingress is disabled.
- **Storage Mappings (Map)**: Full support for HA storage folders (`config`, `ssl`, `share`, etc.) with `RW`/`RO` modes.
- **Port Mappings**: Easy definition of container-to-host port mappings.
- **Backup Integration**: Automatic `hot` backup mode support.

### 🎨 User Experience & UI
- **Accordion-Based One-Step Form**: Streamlined editing process organized into collapsible sections (Basic Info, Ingress & UI, Advanced Config).
- **Intelligent Docker Image Selection**:
  - Separate inputs for Image Name and Tag.
  - **Manual Tag Fetcher**: Dedicated button (🔍) to fetch available tags directly from the registry using `crane`.
  - **Automatic PM Detection**: Real-time identification of the package manager with a manual refresh option (🔄).
  - **Smart Sorting**: Tags are sorted by version, with `latest` at the top and technical tags (signatures/hashes) at the bottom.
- **Add-on Documentation (Markdown)**:
  - Integrated **EasyMDE** editor with syntax highlighting and live preview.
  - Automatic `README.md` generation for the HA Add-on Store.
- **Version Management**: Dedicated buttons for **Major**, **Minor**, and **Fix updates** with automatic version incrementing.
- **Icon Support**: Custom PNG upload support with preview or use of default icons.
- **Self-Conversion**: Export the converter itself as an HA add-on with one click (includes version selection from GHCR).
- **Management Tools**:
  - List view showing add-on name, description, version, base image, and **detected package manager badge**.
  - Edit and delete created add-ons.
  - Global repository settings (Name, Maintainer).
