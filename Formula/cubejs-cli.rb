require "language/node"

class CubejsCli < Formula
  desc "Cube.js command-line interface"
  homepage "https://cube.dev/"
  url "https://registry.npmjs.org/cubejs-cli/-/cubejs-cli-0.32.29.tgz"
  sha256 "5e14485eeb1672e38ae1affbafc20a54399cee172eca631eae8ad317fdced841"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "b232efaf88c7ba1f65d913a1e37ea7774c2a0a410d623eb3af5ee13e39ded4ec"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "b232efaf88c7ba1f65d913a1e37ea7774c2a0a410d623eb3af5ee13e39ded4ec"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "b232efaf88c7ba1f65d913a1e37ea7774c2a0a410d623eb3af5ee13e39ded4ec"
    sha256 cellar: :any_skip_relocation, ventura:        "0198044acb83bf47100ce6c051a35f223080a62c65384de076ca239086b65463"
    sha256 cellar: :any_skip_relocation, monterey:       "0198044acb83bf47100ce6c051a35f223080a62c65384de076ca239086b65463"
    sha256 cellar: :any_skip_relocation, big_sur:        "0198044acb83bf47100ce6c051a35f223080a62c65384de076ca239086b65463"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "b232efaf88c7ba1f65d913a1e37ea7774c2a0a410d623eb3af5ee13e39ded4ec"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cubejs --version")
    system bin/"cubejs", "create", "hello-world", "-d", "postgres"
    assert_predicate testpath/"hello-world/schema/Orders.js", :exist?
  end
end
