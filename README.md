# sploot-nft

sploot-nft draft


Using:
https://www.trufflesuite.com/boxes/react

## To start:
  ### In sploot-nft/
    - npm install -g truffle
    - truffle develop  <- this will start the truffle console locally and start a chain locally
    - compile <- compiles contracts
    - migrate <- deploys contract to local env


  ## Open another terminal window.
  ### In sploot-nft/client/
    - npm run start


  ## To run tests (will fail right now):
  ### In sploot-nft/
    - truffle test
  ### In the truffle console
    - test
  ### In the client directory
    - npm run build
    - npm run test

  ### In the root directory, get the flask app running
    - pip install -r requirements.txt
    - flask app run

  ## If you run into a package dependency tree issue, delete node_modules from sploot-nft root directory and run
  - npm install
  in the client directory

  ## If you run into an issue in the react app that says contract address not set, make sure you're connected to the localhost chain on 9545
