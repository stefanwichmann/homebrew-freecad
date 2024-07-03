cask "freecad@weekly" do
    arch arm: "arm64", intel: "x86_64"
  
    version :latest
    sha256 :no_check
  
    url "https://github.com/FreeCAD/FreeCAD-Bundle/releases/download/weekly-builds/FreeCAD_weekly-builds-38001-conda-macOS-#{arch}-py311.dmg",
        verified: "github.com/FreeCAD/FreeCAD/"
    name "FreeCAD"
    desc "3D parametric modeller"
    homepage "https://www.freecad.org/"
    license "LGPL-2.1"
  
    # Upstream uses GitHub releases to indicate that a version is released
    # (there's also sometimes a notable gap between the release being created
    # and the homepage being updated), so the `GithubLatest` strategy is necessary.
    livecheck do
      url :url
      strategy :github_latest
    end
  
    depends_on macos: ">= :sierra"
  
    app "FreeCAD.app"
  
    zap trash: [
      "~/Library/Application Support/FreeCAD",
      "~/Library/Caches/FreeCAD",
      "~/Library/Preferences/com.freecad.FreeCAD.plist",
      "~/Library/Preferences/FreeCAD",
    ]
end