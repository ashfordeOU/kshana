ocpn_plugin.h: the OpenCPN plugin API header, unmodified, from the OpenCPN source tree
(https://github.com/OpenCPN/OpenCPN) at commit ed9476df9338c25c9d93f92ddc0ae7f7f1a56515
(API version 1.22, as declared in the header). It is copyright David S. Register and others and is
distributed under the GNU General Public License, version 2 or (at your option) any later version
(see the header's own notice). It is vendored only so the plugin builds reproducibly without a
network download. The plugin declares API version 1.18, which OpenCPN supports downward-compatibly.

To use a different copy: cmake -DOCPN_PLUGIN_HEADER_DIR=/path/to/dir/containing/ocpn_plugin.h
