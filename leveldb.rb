class Leveldb < Formula
  desc "Key-value storage library with ordered mapping"
  homepage "https://github.com/google/leveldb/"
  url "https://github.com/google/leveldb/archive/1.22.tar.gz"
  sha256 "55423cac9e3306f4a9502c738a001e4a339d1a38ffbee7572d4a07d5d63949b2"
  license "BSD-3-Clause"

  bottle do
    sha256 cellar: :any, big_sur:     "410c6f27c9bf8381020c866be9c45e84a41bcb61161061e8219710bb7a5aff0d"
    sha256 cellar: :any, catalina:    "908fb99544bbc0906134bc9677fbd91c6948324c4de6cd1315fc7e5e6f6634cc"
    sha256 cellar: :any, mojave:      "22e4a129bedd5030525f749a5b5ec978bf6da0a9b0625fe829da482a5ab85755"
    sha256 cellar: :any, high_sierra: "b1cf697cad28caac418d2e0ef49bc90863f389402185d3cc0f1f7079516d02c2"
    sha256 cellar: :any, sierra:      "810dbeba5e3f7d72d4772b9eff4d9022a1240c0abc6235afbd343c199741e6f7"
  end

  depends_on "cmake" => :build
  depends_on "gperftools"
  depends_on "snappy"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DBUILD_SHARED_LIBS=ON"
      system "make", "install"
      bin.install "leveldbutil"

      system "make", "clean"
      system "cmake", "..", *std_cmake_args, "-DBUILD_SHARED_LIBS=OFF"
      system "make"
      lib.install "libleveldb.a"
    end
  end

  test do
    assert_match "dump files", shell_output("#{bin}/leveldbutil 2>&1", 1)
  end
end
