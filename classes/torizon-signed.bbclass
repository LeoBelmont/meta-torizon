# Torizon configuration for signed images

# Inherit class to sign BSP related images (bootloader, kernel FIT image or
# UKI): tdx-signed (meta-toradex-security) for the Toradex SoMs, and the
# class that meta-torizon-bsp provides for NVIDIA Jetson (UEFI Secure Boot).
TORIZON_SIGNED_BSP_CLASS ?= "${@'tegra-torizon-signed' if 'tegra' in d.getVar('MACHINEOVERRIDES').split(':') else 'tdx-signed'}"
inherit ${TORIZON_SIGNED_BSP_CLASS}

# Inherit class responsible for the integrity and authenticity of the rootfs
# when using ostree (based on composefs).
inherit cfs-signed

# Override signing class name (informational, may be displayed to users)
TDX_SIGNING_CLASS = "torizon-signed"
