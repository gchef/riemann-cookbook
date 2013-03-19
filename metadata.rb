name              "riemann"
maintainer        "Gerhard Lazu"
maintainer_email  "gerhard@lazu.co.uk"
license           "Apache 2.0"
description       "Installs and configures riemann"
version           "0.1.0"

recipe "riemann::server"

supports "ubuntu"

depends "java"
