require 'formula'

class Pcsclite < Formula
  homepage 'http://pcsclite.alioth.debian.org/'
  url 'http://alioth.debian.org/frs/download.php/file/3862/pcsc-lite-1.8.8.tar.bz2'
  sha256 'fe66354a7e738d3ef8b4e572c7e447b85894da9262381fbf004e8abcc12885e7'

  head 'svn://anonscm.debian.org/pcsclite/trunk/'

  option :universal

  def install
    ENV.universal_binary if build.universal?

    args = ["--prefix=#{prefix}"]

    system "./autogen.sh" if build.head?
    system "./configure", *args
    system "make install"
  end
end
