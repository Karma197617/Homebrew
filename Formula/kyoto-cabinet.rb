class KyotoCabinet < Formula
  desc "Library of routines for managing a database"
  homepage "https://dbmx.net/kyotocabinet/"
  url "https://dbmx.net/kyotocabinet/pkg/kyotocabinet-1.2.80.tar.gz"
  sha256 "4c85d736668d82920bfdbdb92ac3d66b7db1108f09581a769dd9160a02def349"
  license "GPL-3.0-or-later"

  livecheck do
    url "https://dbmx.net/kyotocabinet/pkg/"
    regex(/href=.*?kyotocabinet[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    sha256 arm64_ventura:  "3f771335b64a4362f2b48aba77a2599e342725aee13c066830a713cd19dd1bcd"
    sha256 arm64_monterey: "dc57e5dd4befc2604e975c32e31387b892ac9a1d328ef20d15bbc2c7020c45bd"
    sha256 arm64_big_sur:  "48787ff1ea4af71c49229e67fe4e147229f8bac86376f1f54057edde098020db"
    sha256 ventura:        "90c2584ed35710ac0d4827dd373f533e313b1c562057aa76a727d2c1d963f772"
    sha256 monterey:       "362b63259bb9f6d81d8320f741b8d4238cfbd1800bb7c4b1a7653abdba172bcb"
    sha256 big_sur:        "c6572ef13f91e704d480f0a4ad4353168160a3b8d33d05b299e97c4c9f5399b7"
    sha256 x86_64_linux:   "e5da4592e6cd893f7c1955a3d07b28e1ab97fc39ef1a41ea0550cdd4f84d3d0f"
  end

  uses_from_macos "zlib"

  patch :DATA

  def install
    ENV.cxx11
    system "./configure", "--disable-debug", "--prefix=#{prefix}"
    system "make" # Separate steps required
    system "make", "install"
  end
end


__END__
--- a/kccommon.h  2013-11-08 09:27:37.000000000 -0500
+++ b/kccommon.h  2013-11-08 09:27:47.000000000 -0500
@@ -82,7 +82,7 @@
 using ::snprintf;
 }

-#if __cplusplus > 199711L || defined(__GXX_EXPERIMENTAL_CXX0X__) || defined(_MSC_VER)
+#if __cplusplus > 199711L || defined(__GXX_EXPERIMENTAL_CXX0X__) || defined(_MSC_VER) || defined(_LIBCPP_VERSION)

 #include <unordered_map>
 #include <unordered_set>
