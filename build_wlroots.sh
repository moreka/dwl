#!/usr/bin/env bash

pushd wlroots

CFLAGS="-march=native -O3 -pipe -fno-plt -fexceptions \
    -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security \
    -Wno-error=discarded-qualifiers \
    -fstack-clash-protection -fcf-protection -fno-omit-frame-pointer \
    -mno-omit-leaf-frame-pointer" \
    LDFLAGS="-Wl,-O1 -Wl,--sort-common -Wl,--as-needed -Wl,-z,relro \
    -Wl,-z,now -Wl,-z,pack-relative-relocs -flto=auto" \
    meson setup build && ninja -C build
popd
