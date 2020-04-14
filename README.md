# phpcs docker image with Magento 2 Code Quality Ruleset

[Docker_Hub](https://hub.docker.com/r/domw/phpcs)

## Compilation

    docker login

    docker build -t domw/phpcs:latest ./

    docker push domw/phpcs:latest

    docker build -t domw/phpcs:7.1-cli ./

    docker push domw/phpcs:7.1-cli 

## Test

    docker-compose run --rm phpcs
    
    docker-compose run --rm phpcs -i
    
## Usage
    
    docker pull domw/phpcs
    
    docker run --rm -v $PWD:/code domw/phpcs phpcs --version
    
    docker run --rm -v $PWD:/code domw/phpcs phpcs -i
    
    docker run --rm -v $PWD:/code domw/phpcs phpcs /path/to/code
    
    docker run --rm -v $PWD:/code domw/phpcs phpcs --standard=Magento2 /path/to/code
    
    docker run --rm -v $PWD:/code domw/phpcs phpcs --standard=Magento2 --report=full,summary,gitblame /path/to/code
    
    docker run --rm -v $PWD:/code domw/phpcs phpcs --colors --warning-severity=0 --standard=Magento2 --report=full,summary,gitblame /path/to/code
    
    docker run --rm -v $PWD:/code domw/phpcs phpcs --colors --warning-severity=0 --standard=Magento2 --report=full,summary --extensions=php,phtml /path/to/code

## Gitlab

    stages:
      - code-style

    phpcs-magento2:
      image: domw/phpcs
      type: code-style
      tags:
        - docker
      script:
        - phpcs --version
        - phpcs -i
        - phpcs --colors --standard=Magento2 --warning-severity=0 --report=full,summary,gitblame /builds/vendor/module/path/to/code/
        - phpcs --colors --standard=Magento2 --warning-severity=0 --report=full,summary,gitblame /builds/vendor/module/app/design/frontend/Theme/
