class Derivon < Formula
  desc "Stateless CLI for weighted directed B-hypergraphs"
  homepage "https://docs.derivon.net/cli/"
  url "https://static.crates.io/crates/derivon-cli/derivon-cli-0.1.1.crate"
  sha256 "7fd590ac0653a8d2cd217e375c1427bc223c4fa8f0ace84612f2784f7f982555"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "derivon #{version}", shell_output("#{bin}/derivon --version")
    input = "{\"points\":[],\"hyperedges\":[]}\n"
    expected = "{\"hyperedges\":[],\"points\":[]}\n"
    assert_equal expected, pipe_output("#{bin}/derivon validate", input)
  end
end
