{ lib, buildGoModule, fetchFromGitHub, fetchpatch }:

buildGoModule rec {
  pname = "jcli";
  version = "0.0.41";

  src = fetchFromGitHub {
    owner = "jenkins-zh";
    repo = "jenkins-cli";
    rev = "v${version}";
    hash = "sha256-oZtbjfquCYMMYgKe7sclRQDXnkNwAEY/GvwenGBnVk4=";
  };

  vendorHash = "sha256-bmPnxFvdKU5zuMsCDboSOxP5f7NnMRwS/gN0sW7eTRA=";

  doCheck = false;

  postInstall = ''
    mv $out/bin/{jenkins-cli,jcli}
  '';

  meta = with lib; {
    description = "Jenkins CLI allows you to manage your Jenkins in an easy way";
    homepage = "https://jcli.jenkins-zh.cn/";
    license = licenses.mit;
    maintainers = with maintainers; [ sikmir ];
  };
}
