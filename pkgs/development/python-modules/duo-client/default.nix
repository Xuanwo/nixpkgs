{ lib
, buildPythonPackage
, fetchFromGitHub
, freezegun
, mock
, nose2
, pytz
, setuptools
, six
}:

buildPythonPackage rec {
  pname = "duo-client";
  version = "4.7.0";

  src = fetchFromGitHub {
    owner = "duosecurity";
    repo = "duo_client_python";
    rev = "refs/tags/${version}";
    hash = "sha256-FA2ThWQ6VUKYXHgeAy31LcMJGtyvteSzVUcfYtWMSK4=";
  };

  postPatch = ''
    substituteInPlace requirements-dev.txt \
      --replace "dlint" "" \
      --replace "flake8" ""
  '';

  propagatedBuildInputs = [
    setuptools
    six
  ];

  nativeCheckInputs = [
    freezegun
    mock
    nose2
    pytz
  ];

  pythonImportsCheck = [
    "duo_client"
  ];

  meta = with lib; {
    description = "Python library for interacting with the Duo Auth, Admin, and Accounts APIs";
    homepage = "https://github.com/duosecurity/duo_client_python";
    changelog = "https://github.com/duosecurity/duo_client_python/releases/tag/${version}";
    license = licenses.bsd3;
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}
