#!/bin/bash
set -e
detect_env() {
    if [ -n "$TERMUX_VERSION" ]; then
        PKG_INSTALL="pkg install -y"
    else
        PKG_INSTALL="sudo apt-get install -y"
    fi
}
install_deps() {
    echo "Installing dependencies..."
    for dep in git curl zip unzip tar sed; do
        if ! command -v "$dep" &>/dev/null; then
            $PKG_INSTALL "$dep"
        fi
    done
}
prompt_user() {
    clear
    echo "--------------------------------------------------"
    echo "      Magisk & KernelSU Module Template Builder "
    echo "      Created by revWhiteShadow                 "
    echo "      GitHub: white9shadow                     "
    echo "      Telegram: @revWhiteShadow                "
    echo "--------------------------------------------------"
    echo "This script crafts a sleek, ready-to-use module template compatible with both Magisk and KernelSU."
    echo "Unleash your creativity with a structure designed for power and simplicity across rooting platforms!"
    echo "--------------------------------------------------"
    read -p "Enter module name: " MODULE_NAME
    read -p "Enter module description: " MODULE_DESC
    read -p "Enter module version (e.g., 1.2.3): " MODULE_VERSION
    read -p "Enter version code (integer): " VERSION_CODE
    read -p "Enter author name: " AUTHOR_NAME
}
create_structure() {
    mkdir -p "$MODULE_NAME"
    cd "$MODULE_NAME"
    mkdir -p system webroot META-INF/com/google/android
}
generate_module_prop() {
    MODULE_ID=$(echo "$MODULE_NAME" | tr '[:upper:]' '[:lower:]')
    cat << EOF > module.prop
id=$MODULE_ID
name=$MODULE_NAME
version=$MODULE_VERSION
versionCode=$VERSION_CODE
author=$AUTHOR_NAME
description=$MODULE_DESC
EOF
}
create_post_fs_data() {
    cat << 'EOF' > post-fs-data.sh
#!/system/bin/sh
MODDIR=${0%/*}
EOF
    chmod +x post-fs-data.sh
}
create_service_sh() {
    cat << 'EOF' > service.sh
#!/system/bin/sh
MODDIR=${0%/*}
EOF
    chmod +x service.sh
}
create_uninstall_sh() {
    cat << 'EOF' > uninstall.sh
#!/system/bin/sh
MODDIR=${0%/*}
EOF
    chmod +x uninstall.sh
}
create_system_prop() {
    cat << 'EOF' > system.prop
EOF
}
create_sepolicy_rule() {
    cat << 'EOF' > sepolicy.rule
EOF
}
create_skip_mount() {
    touch skip_mount
}
create_disable() {
    touch disable
}
create_remove() {
    touch remove
}
create_customize_sh() {
    cat << 'EOF' > customize.sh
#!/system/bin/sh
MODDIR=${0%/*}
EOF
    chmod +x customize.sh
}
create_updater_script() {
    cat << EOF > META-INF/com/google/android/updater-script
ui_print("=== Installing $MODULE_NAME v$MODULE_VERSION ===");
run_program("/sbin/sh", "$MODDIR/customize.sh");
ui_print("Done!");
EOF
}
scaffold_webroot() {
    cat << 'EOF' > webroot/index.html
<!DOCTYPE html>
<html>
<head>
    <title>$MODULE_NAME WebUI</title>
</head>
<body>
    <h1>$MODULE_NAME Web Interface</h1>
</body>
</html>
EOF
}
echo "Building Magisk & KernelSU Module Template..."
detect_env
install_deps
prompt_user
create_structure
generate_module_prop
create_post_fs_data
create_service_sh
create_uninstall_sh
create_system_prop
create_sepolicy_rule
create_skip_mount
create_disable
create_remove
create_customize_sh
create_updater_script
scaffold_webroot
echo "[✓] Magisk & KernelSU module '$MODULE_NAME' v$MODULE_VERSION created!"
