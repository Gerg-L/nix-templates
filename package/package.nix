{
  lib,
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation (
  finalAttrs: {
    pname = "hello";
    version = "2.12.1";

    src = fetchurl {
      url = "mirror://gnu/hello/hello-${finalAttrs.version}.tar.gz";
      sha256 = "sha256-jZkUKv2SV28wsM18tCqNxoCZmLxdYH2Idh9RLibH2yA=";
    };

    meta = {
      description = "A program that produces a familiar, friendly greeting";
      longDescription = ''
        GNU Hello is a program that prints "Hello, world!" when you run it.
        It is fully customizable.
      '';
      homepage = "https://www.gnu.org/software/hello/manual/";
      changelog = "https://git.savannah.gnu.org/cgit/hello.git/plain/NEWS?h=v${finalAttrs.version}";
      license = lib.licenses.gpl3Plus;
      maintainers = [lib.maintainers.eelco];
      platforms = lib.platforms.all;
    };
  }
)
