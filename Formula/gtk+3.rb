  url "https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.38.tar.xz"
  sha256 "ce11decf018b25bdd8505544a4f87242854ec88be054d9ade5f3a20444dd8ee7"
    sha256 arm64_ventura:  "12d42f5ba7caa43a83aba5babfee4cc745d8a12a58e108af642f366f2ca37d8f"
    sha256 arm64_monterey: "9c57deb4a8e1360dfd057a58a24e6c7b4ce621ebd5916386cb8c4cd359691763"
    sha256 arm64_big_sur:  "ce48bef582169d1f45bfa828b80214c9dd5204573699d2d97e631d29bdfcda27"
    sha256 ventura:        "87f200d7945307fcb47cb2ea31da643d571c898b752e2e2ddecd62c1c4c64b51"
    sha256 monterey:       "e0a18e7ae38a7ea9d5705e787fa01f3d4215c836e170f060662b85c1c0dd50cf"
    sha256 big_sur:        "ad9c04a5ce0db0751cf1a485d60ec963aae7039c9332e0bcc972e06daacc8cc5"
    sha256 x86_64_linux:   "84b8d60884ca0e11d3d86785415dd9d1d426c4900e9f3b62c71e0dc0ad0b2745"
  depends_on "gettext" => :build
  depends_on "pkg-config" => [:build, :test]
    args = %w[
    system "meson", "setup", "build", *args, *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
    bin.install_symlink bin/"gtk-update-icon-cache" => "gtk3-update-icon-cache"
    man1.install_symlink man1/"gtk-update-icon-cache.1" => "gtk3-update-icon-cache.1"
    flags = shell_output("pkg-config --cflags --libs gtk+-3.0").chomp.split