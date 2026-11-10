class Takokey < Formula
  desc "Extra-light deterministic multi-language shortcut"
  homepage "https://takokey.potapenko.ai"
  url "https://github.com/bvpotapenko/takokey/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "9906cbb9096e34a19021e47e28c67006dd2e03680f0f432d718426b49fde0bd3"
  license "GPL-3.0-or-later"

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
