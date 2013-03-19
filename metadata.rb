name              "riemann"
maintainer        "Gerhard Lazu"
maintainer_email  "gerhard@lazu.co.uk"
license           "Apache 2.0"
description       "Installs riemann server"
version           "0.1.0"

recipe "riemann::server", "Installs riemann server"

supports "ubuntu"

depends "java"
