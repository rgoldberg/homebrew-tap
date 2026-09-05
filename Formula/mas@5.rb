class MasAT5 < Formula
  desc "Mac App Store command-line interface"
  homepage "https://github.com/mas-cli/mas"
  url "https://github.com/mas-cli/mas.git",
      tag:      "v5.2.0",
      revision: "e84c0658e1dfff2fd1eaf0fc8ef338a2a99b8f67"
  license "MIT"
  head "https://github.com/mas-cli/mas.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/mas-cli/homebrew-tap/releases/download/mas-5.2.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "b6791f3e8f1ce976ea6e9d605cb8dee9786ea637e74a0fc5eab4a5402da713c4"
    sha256 cellar: :any_skip_relocation, ventura:       "1bfe9aad61ce75ce29527d0344331051eb3ee05be7ace62853f699801f4ac111"
  end

  conflicts_with "mas", "mas@prerelease", *(1..4).map { "mas@#{_1}" }, because: "both install `mas` binaries"

  depends_on :macos

  uses_from_macos "swift" => :build, since: :sequoia # swift 6.2+

  on_sequoia :or_newer do
    depends_on xcode: ["26.0", :build]
  end

  def install
    ENV["MAS_DIRTY_INDICATOR"] = ""
    system "Scripts/build", "#{tap&.name}/#{name}", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/mas"
    system "swift", "package", "--disable-sandbox", "generate-manual"
    man1.install ".build/plugins/GenerateManual/outputs/mas/mas.1"
    bash_completion.install "contrib/completion/mas-completion.bash" => "mas"
    fish_completion.install "contrib/completion/mas.fish"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/mas version").chomp
    assert_includes shell_output("#{bin}/mas info 497799835"), "Xcode"
  end
end
