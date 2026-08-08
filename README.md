<a href="https://codeberg.org/ideumi/dfn-mounter/releases"><img src="https://img.shields.io/gitea/v/release/ideumi/dfn-mounter?gitea_url=https%3A%2F%2Fcodeberg.org&label=release" alt="Latest release"/></a>

# dfn-mounter

dfn-mounter is a [boxflinger](https://codeberg.org/ideumi/boxflinger) based, fast and minimalist disk mounter program for Linux designed for parallel use with [depthfinder](https://codeberg.org/ideumi/depthfinder), since that cannot mount anything by itself. It follows the same TUI paradigms that depthfinder follows. Its backend is `udisksctl` from `udisks2` and `lsblk`.

dfn-mounter operates independently from depthfinder and can be used standalone if so desired.

This was originally meant to be an integrated component of depthfinder itself, however I did not feel comfortable pulling `udisks2` as a dependency into depthfinder proper, as it would increase complexity, and reduce portability. Thus I decided to spin it off as its own thing.

### [Get dfn-mounter](#getting-dfn-mounter)

## Features

- Easy to use
- Minimalist
- Two-panel layout with a grouped disks sidebar and a volume browser for the selected disk
- Disk and volume info dialogs (fstype, serial, UUID, model, etc.)
- Mount / unmount partitions
- Unlock / lock LUKS containers
- LVM logical volume support (with LUKS-on-LVM)
- Eject / power-off removable devices
- Extensive safety guards

## Getting dfn-mounter

1. Install [Chippy](https://codeberg.org/ideumi/chippy#installation-for-supported-platforms-supported-platforms).

2. Download the latest release bundle `dfn-mounter` from the [releases page](https://codeberg.org/ideumi/dfn-mounter/releases) or [build](#building) one yourself.

3. Copy / install it to any preferred location, e.g. `/usr/bin/`:

```bash
sudo install -m 755 dfn-mounter /usr/bin/dfn-mounter
```

4. Run `dfn-mounter` in your preferred terminal:

```bash
dfn-mounter
```

5. You may want to change the **accent color**, by default it is a pure blue (because i like it). If you don't like it or it doesn't match the theme you are going for, you can set your own RGB color: change `DFNCOLORACCENT` in [`constants.chh`](src/constants.chh) and [build](#building) again.

## Requirements

- [Chippy](https://codeberg.org/ideumi/chippy) >= 1.1.0
- make
- git

## Building

```bash
git clone https://codeberg.org/ideumi/dfn-mounter
cd dfn-mounter
mkdir out

make
```

### Installation on FHS-Distros

```bash
sudo make install
```

### Uninstallation on FHS-Distros

```bash
sudo make uninstall
```

## Security

dfn-mounter can **never** see your LUKS passphrase and thus cannot save it, e.g. for "convenience", as this would be a security risk. Unlocking is entirely done via `udisksctl`, which reads your passphrase directly. See the implementation of `UnlockLuks(dev)` in [`udisks.chh`](src/udisks.chh). Your passphrase must be entered every time. This is intentional.

## Known Issues

- Window resizing logic does not trigger when a dialog is opened, only after it is closed
	- This is intentional for now

- The mounter cannot see MTP (Media Transfer Protocol) or PTP (Picture Transfer Protocol) devices
	- I have no plans to fix this

## License

dfn-mounter is licensed under the 2-Clause BSD License. See `LICENCE.txt`.
