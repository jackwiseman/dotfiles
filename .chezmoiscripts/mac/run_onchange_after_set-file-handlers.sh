#!/bin/sh

# Make kitty (which routes files to nvim via ~/.config/kitty/open-actions.conf)
# the default macOS handler for text/code/config files. Requires `duti` (in Brewfile).
#
# Note: extensions without a system-declared UTI (e.g. .go .toml .lua .conf) get
# dynamic `dyn.*` UTIs that Finder can't bind a default app to. Those still open in
# nvim via `open -a kitty <file>`, drag-onto-dock, or `kitty +open` (open-actions.conf),
# just not via a Finder double-click.

command -v duti >/dev/null 2>&1 || { echo "duti not installed, skipping file handlers"; exit 0; }

KITTY="net.kovidgoyal.kitty"

# Broad coverage by UTI (catches anything LaunchServices tags as these types)
for uti in public.plain-text public.text public.source-code public.shell-script \
           public.yaml public.json net.daringfireball.markdown; do
  duti -s "$KITTY" "$uti" all
done

# Concrete extensions. Those with a real system UTI take effect; ones with only a
# dynamic (dyn.*) UTI fail with error -50 (macOS won't bind a default app to them) —
# expected and harmless, so stderr is discarded.
for ext in txt md markdown yml yaml toml json conf ini lua fish vim \
           go py js ts jsx tsx sh rs c h hpp cpp rb; do
  duti -s "$KITTY" ".$ext" all 2>/dev/null
done
