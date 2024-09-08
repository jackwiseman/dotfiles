{ buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "git-credential-1password";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "ethrgeist";
    repo = "git-credential-1password";
    rev = "v${version}";
    hash = "sha256-pNZ6ZzD6rE/GgwM7gNRyVyrYlZetMFI/d9m4R2CRuNY=";
  };

  vendorHash = null;

  CGO_ENABLED = "0";

  ldflags = [
    "-s"
    "-w"
  ];
}
