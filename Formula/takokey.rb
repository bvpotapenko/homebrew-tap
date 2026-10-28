class Takokey < Formula
  desc "Extra-light deterministic multi-language shortcut"
  homepage "https://github.com/bvpotapenko/takokey"
  url "https://github.com/bvpotapenko/takokey/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b9571a68d9cd7975314bb6514579a520c2fb72d3b25b5d28bcc36560b9c6a5fa"
  license "GPL-3.0-or-later"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    system "./build.sh", "--app-only"
    prefix.install "build/dmg/TakoKey.app"
  end

  def caveats
    <<~EOS
      Start TakoKey:
        open #{opt_prefix}/TakoKey.app
      To start it at login: TakoKey menu > Settings > Start TakoKey at login.
      After an upgrade, restart it:
        pkill -x TakoKey; sleep 1; open #{opt_prefix}/TakoKey.app
    EOS
  end

  test do
    assert_path_exists prefix/"TakoKey.app/Contents/MacOS/TakoKey"
  end
end
