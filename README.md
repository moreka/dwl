# My build of dwl, dwm for Wayland

[Original dwl repository](https://codeberg.org/dwl/dwl)

## Building

### `wlroots`

This git repo includes [wlroots](https://gitlab.freedesktop.org/wlroots/wlroots) as a submodule (to make sure builds succeed).
You either have to clone this repo like
```sh
git clone --recurse-submodules https://github.com/moreka/dwl
```
or update the submodules:
```sh
git submodule init
git submodule update
```
Then build `wlroots` (see [wlroots dependencies](#wlroots-dependencies) for the required dependencies on ArchLinux) via `./build_wlroots.sh`, or
```sh
meson setup build && ninja -C build
```
(If you want to build the same as I do, you can run).

### dwl
```sh
make
```

### wlroots dependencies

I have made a PKGBUILD (a meta package) to install all dependencies:
```sh
cd dwl-meta
makepkg -si
```

## Installing

Run
```sh
sudo make install
```
