class Derivon < Formula
  desc "Stateless CLI for weighted directed B-hypergraphs"
  homepage "https://docs.derivon.net/cli/"
  url "https://static.crates.io/crates/derivon-cli/derivon-cli-0.1.0.crate"
  sha256 "e1e9ac4db1be00cd0c7c06fe7570156553ea8098c916e30641c7036425c57c13"
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
