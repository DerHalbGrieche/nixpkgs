{
  lib,
  buildGoModule,
  fetchFromGitHub,
  testers,
  ginkgo,
}:

buildGoModule rec {
  pname = "ginkgo";
  version = "2.23.4";

  src = fetchFromGitHub {
    owner = "onsi";
    repo = "ginkgo";
    rev = "v${version}";
    sha256 = "sha256-bTgZHO9dArqYKCqruQPzpiLFtzK9RzxOonwl0SmoNQc=";
  };
  vendorHash = "sha256-iwKOgeUbzlfrto5t0utEdKb+PVqcpmViuDhK2PBAzHw=";

  # integration tests expect more file changes
  # types tests are missing CodeLocation
  excludedPackages = [
    "integration"
    "types"
  ];

  __darwinAllowLocalNetworking = true;

  passthru.tests.version = testers.testVersion {
    package = ginkgo;
    command = "ginkgo version";
  };

  meta = with lib; {
    homepage = "https://onsi.github.io/ginkgo/";
    changelog = "https://github.com/onsi/ginkgo/blob/master/CHANGELOG.md";
    description = "Modern Testing Framework for Go";
    mainProgram = "ginkgo";
    longDescription = ''
      Ginkgo is a testing framework for Go designed to help you write expressive
      tests. It is best paired with the Gomega matcher library. When combined,
      Ginkgo and Gomega provide a rich and expressive DSL
      (Domain-specific Language) for writing tests.

      Ginkgo is sometimes described as a "Behavior Driven Development" (BDD)
      framework. In reality, Ginkgo is a general purpose testing framework in
      active use across a wide variety of testing contexts: unit tests,
      integration tests, acceptance test, performance tests, etc.
    '';
    license = licenses.mit;
    maintainers = with maintainers; [
      saschagrunert
      jk
    ];
  };
}
