<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Submitting the Kshana plugin to OpenCPN's plugin catalogue

Nothing here has been submitted. The catalogue is the OpenCPN project's
[OpenCPN/plugins](https://github.com/OpenCPN/plugins) repository; adding a plugin is a pull request
(PR) to it, which only the maintainer of Kshana can open, by hand, after the release is public. The
release workflow does everything else: it builds the plugin, writes the metadata with the tarball's real
checksum and URL, checks it, attests it and attaches both to the GitHub Release.

## What the release provides (for a tag `vX.Y.Z`)

| Release asset | What it is |
|---|---|
| `kshana_pi-X.Y.Z-1_ubuntu-wx32-24.04-x86_64.tar.gz` | the plugin tarball in the catalogue's layout: `metadata.xml`, `lib/opencpn/libkshana_pi.so`, `share/opencpn/plugins/kshana_pi/data/` |
| `kshana_pi-X.Y.Z-ubuntu-wx32-x86_64-24.04.xml` | the catalogue metadata for that tarball: its release URL and `sha256:` checksum |
| `kshana-opencpn-plugin-X.Y.Z-source.tar.gz` | the plugin's complete source (GPL-3.0-or-later) |

The plugin is built on Ubuntu 24.04 against wxWidgets 3.2 (GTK3) for x86-64, so the catalogue `target` is
`ubuntu-wx32-x86_64`, `target-version` `24.04`. It links the system's glibc (2.39 or newer) and wxWidgets 3.2.
**That is the only platform built.** There is no macOS, Windows, Flatpak or Arm build, and the metadata makes no
claim for them.

## Before you open the PR

1. Check the assets against the release, from a clean directory:
   ```sh
   gh release download vX.Y.Z --repo ashfordeOU/kshana \
     --pattern 'kshana_pi-*' --pattern SHA256SUMS
   sha256sum --ignore-missing -c SHA256SUMS
   gh attestation verify kshana_pi-X.Y.Z-1_ubuntu-wx32-24.04-x86_64.tar.gz --repo ashfordeOU/kshana
   grep tarball-checksum kshana_pi-X.Y.Z-ubuntu-wx32-x86_64-24.04.xml   # equals the tarball's sha256
   ```
2. Try the tarball in OpenCPN itself (Options, then Plugins, **Import plugin**) on an Ubuntu 24.04 machine with
   OpenCPN built for wxWidgets 3.2. This has not been done with the tarball: the plugin library itself was run
   inside OpenCPN 5.8.4 (`integrations/opencpn/evidence/`), the packaged tarball was not. Do it first; if the
   import fails, the layout needs fixing before any PR.

## The PR

The steps are those of the OpenCPN/plugins README; check it for changes first, because the schema occasionally
changes.

1. Fork `OpenCPN/plugins` and clone your fork. Install Python 3.6 or later, `tar` and `xmllint`
   (`libxml2-utils`). Copy the repository's `pre-commit` file into `.git/hooks`.
2. Pick the target branch. The README lists `master` (regular users), `Beta` (reasonably stable test plugins) and
   `Alpha` (experimental). **A first submission of a new plugin is usually best made to `Beta`; ask the
   OpenCPN plugin maintainers** (the OpenCPN forum's plugin developers section) which they want.
3. Branch from the chosen branch, then copy the metadata file into the `metadata/` directory unchanged:
   ```sh
   cp /path/to/kshana_pi-X.Y.Z-ubuntu-wx32-x86_64-24.04.xml metadata/
   ```
4. Validate it against the project's schema, and check the URL:
   ```sh
   ./validate_xml.sh kshana_pi X.Y.Z
   python tools/check-metadata-urls metadata/kshana_pi-X.Y.Z-ubuntu-wx32-x86_64-24.04.xml
   ```
   (`scripts/check-opencpn-metadata.py` in the Kshana repository applies the same schema rules to this file and
   the release workflow runs it, and the file validates against `ocpn-plugin.xsd` with
   `xmllint --noout --schema ocpn-plugin.xsd <file>`. The project's own scripts are the check that decides.)
5. **Do not generate or edit `ocpn-plugins.xml`.** It is generated when the PR is merged.
6. Commit, push to your fork and open the PR against the branch from step 2. Suggested text:

   > Add kshana_pi X.Y.Z (Kshana GNSS receiver-trust panel), Ubuntu 24.04 / wxWidgets 3.2 / x86-64.
   > GPL-3.0-or-later; source: https://github.com/ashfordeOU/kshana (release vX.Y.Z, source tarball attached).
   > A floating panel that shows a GNSS trust score from the `$PKSHT` sentence on OpenCPN's NMEA stream; it never
   > changes a fix and never transmits. Advisory only. Plugin API 1.18. Only this platform is built for now.

7. After the merge, check the plugin appears in OpenCPN's Plugin Manager and installs from there.

## Each later release

The new version's metadata file is generated the same way. Add it beside the old one (or replace it, as the
project's maintainers prefer) in a new PR. The tarball URL always points at that version's GitHub Release.

## What the metadata does and does not say

* It names one platform. Do not add targets that were not built.
* The description carries the advisory statement: not type-approved navigation equipment, the operator remains
  responsible. Keep it if the text is shortened.
* Names, URLs and the checksum come from the release; if one is wrong, fix the release workflow
  (`scripts/package-opencpn-plugin.sh`, `packaging/opencpn/kshana_pi.metadata.xml.in`) and re-release, not the PR.
