# Magisk-kernelsu-template

![Magisk-kernelsu-template](/thumb/thumb.png)

## Magisk & KernelSU Module Template Builder

Welcome to the **Magisk & KernelSU Module Template Builder**, a powerful and elegant Bash script designed to streamline the creation of module templates compatible with both Magisk and KernelSU rooting solutions. Crafted with precision by **revWhiteShadow**, this tool empowers developers to kickstart their projects with a robust, ready-to-use structure.

## Introducing

This script automates the generation of a clean, fully functional module template tailored for Magisk and KernelSU environments. Whether you're building a simple tweak or a complex system modification, this template provides the foundation you need—complete with essential files, directories, and placeholders for your custom logic. Say goodbye to manual setup and hello to a seamless development experience!

### Features
- **Dual Compatibility**: Works flawlessly with both Magisk and KernelSU.
- **Minimalist Design**: Includes only the core files specified by the KernelSU module guide, ensuring a lightweight starting point.
- **User-Friendly**: Interactive prompts guide you through module creation.
- **Ready-to-Extend**: Pre-configured scripts and WebUI folder for easy customization.
- **Open Source**: Free to use, modify, and share.

## Generated Structure
```
<MODULE_NAME>/
├── module.prop              # Module metadata
├── post-fs-data.sh          # Early boot script
├── service.sh              # Late boot script
├── uninstall.sh            # Removal script
├── system/                 # System overlay directory
├── system.prop             # System properties
├── sepolicy.rule           # SELinux rules
├── skip_mount              # Optional: Skip system mounting
├── disable                 # Optional: Disable module
├── remove                  # Optional: Remove module on reboot
├── customize.sh            # Installation script
├── webroot/                # WebUI root
│   └── index.html          # Basic WebUI placeholder
└── META-INF/
    └── com/google/android/
        └── updater-script  # Installer script

```
## Usage
1. Clone or download this repository.
2. Run the script:
   ```bash
   ./build_module_template.sh
   ```
3. Follow the prompts to input your module details (name, description, version, etc.).
4. Find your module template in a folder named `<MODULE_NAME>`—ready for customization!

## Credits
- **Created by**: revWhiteShadow
- **GitHub**: [white9shadow](https://github.com/white9shadow)
- **Telegram**: [@revWhiteShadow](https://t.me/revWhiteShadow)

## Contributing
Feel free to fork, tweak, and submit pull requests. Let’s make this tool even better together!

## License
This project is open-source and free to use under the MIT License. Build, break, and innovate—no limits!
