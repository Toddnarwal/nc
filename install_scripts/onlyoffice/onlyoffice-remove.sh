  #!/bin/bash
  
  docker stop onlyoffice
  docker rm onlyoffice
  docker volume purge -f
  
