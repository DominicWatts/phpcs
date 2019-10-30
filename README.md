# phpcs docker image with Magento 2 Code Quality Ruleset

## Compilation

    docker login

    docker build -t domw/phpcs:7.1-cli ./

    docker push domw/phpcs:7.1-cli 

## Usage

    docker-compose run --rm phpcs
    
    docker-compose run --rm phpcs -i