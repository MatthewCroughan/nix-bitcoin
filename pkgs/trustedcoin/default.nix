{ lib, buildGoModule, fetchFromGitHub }:
buildGoModule {
  name = "trustedcoin";
  src = fetchFromGitHub {
    owner = "fiatjaf";
    repo = "trustedcoin";
    rev = "v0.5.2";
    sha256 = "sha256-s8zgY+TDABK96BehY+SVl86wCMd+e8BKdxw0kGV1jAI=";
  };
  vendorSha256 = "sha256-wpK5SW9nOMO/e4DoEk8LRxLykxYt06LoBBxjeEujOiU=";
  meta = with lib; {
    description = "A lightningd plugin that replaces bitcoind with trusted public explorers.";
    homepage = "https://github.com/fiatjaf/trustedcoin";
    license = licenses.mit;
    maintainers = with maintainers; [ nixbitcoin ];
    platforms = platforms.linux;
  };
}
