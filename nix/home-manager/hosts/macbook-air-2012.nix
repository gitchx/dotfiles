
{ pkgs, ... }:

# let
#   gtk = pkgs.gtk3;
#
#   fontconfigFile = pkgs.writeText "inkscape-fonts.conf" ''
#     <?xml version="1.0"?>
#     <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
#     <fontconfig>
#       <dir>/System/Library/Fonts</dir>
#       <dir>/Library/Fonts</dir>
#       <dir>/Users/soma/Library/Fonts</dir>
#     </fontconfig>
#   '';
#
#   inkscapeIMCache = pkgs.runCommand "inkscape-immodules.cache" {} ''
#     ${gtk.dev}/bin/gtk-query-immodules-3.0 \
#       ${gtk}/lib/gtk-3.0/3.0.0/immodules/im-quartz.so \
#       > "$out"
#   '';
#
#   inkscapeConfigured = pkgs.runCommand "inkscape-configured" {
#     nativeBuildInputs = [ pkgs.makeWrapper ];
#   } ''
#     mkdir -p "$out/Applications"
#
#     cp -R \
#       "${pkgs.inkscape}/Applications/Inkscape.app" \
#       "$out/Applications/Inkscape.app"
#
#     # コピーしたアプリの書き込み権限を追加
#     chmod -R u+w "$out/Applications/Inkscape.app"
#
#     executable="$out/Applications/Inkscape.app/Contents/MacOS/Inkscape"
#
#     rm "$executable"
#
#     makeWrapper \
#       "${pkgs.inkscape}/Applications/Inkscape.app/Contents/MacOS/Inkscape" \
#       "$executable" \
#       --set FONTCONFIG_FILE "${fontconfigFile}" \
#       --set GTK_IM_MODULE quartz \
#       --set GTK_IM_MODULE_FILE "${inkscapeIMCache}"
#   '';
#
#
# in
#
{
  imports = [
    ../common.nix
  ];

  home.username = "soma";
  home.homeDirectory = "/Users/soma";
  home.stateVersion = "24.11";

  # home.packages = [
  #   # inkscapeConfigured
  #   pkgs.nodejs_22
  # ];
}

