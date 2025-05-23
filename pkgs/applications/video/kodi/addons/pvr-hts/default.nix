{
  lib,
  rel,
  buildKodiBinaryAddon,
  fetchFromGitHub,
}:
buildKodiBinaryAddon rec {
  pname = "pvr-hts";
  namespace = "pvr.hts";
  version = "21.2.6";

  src = fetchFromGitHub {
    owner = "kodi-pvr";
    repo = "pvr.hts";
    rev = "${version}-${rel}";
    sha256 = "sha256-opxNgin+Sz/Nb9IGZ+OFrCzbDc4FXl2LaNKUu5LAgFM=";
  };

  meta = with lib; {
    homepage = "https://github.com/kodi-pvr/pvr.hts";
    description = "Kodi's Tvheadend HTSP client addon";
    platforms = platforms.all;
    license = licenses.gpl2Only;
    teams = [ teams.kodi ];
  };
}
