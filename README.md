# phpcs docker image with Magento 2 Code Quality Ruleset

## Compilation

    docker login

    docker build -t domw/phpcs:7.1-cli ./

    docker push domw/phpcs:7.1-cli 

## Test

    docker-compose run --rm phpcs
    
    docker-compose run --rm phpcs -i
    
## Usage
    
    docker pull domw/phpcs
    
    docker run --rm --volume /local/path:/project domw/phpcs [<options>]
    
    docker run --rm --volume /local/path:/project domw/phpcs --standard=Magento2 app/code/Xigen