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
    
    docker run --rm -v $PWD:/code:ro domw/phpcs phpcs --version
    
    docker run --rm -v $PWD:/code:ro domw/phpcs phpcs -i
    
    docker run --rm -v $PWD:/code:ro domw/phpcs phpcs /path/to/code
    
    docker run --rm -v $PWD:/code:ro domw/phpcs phpcs --standard=Magento2 /path/to/code
    
    docker run --rm -v $PWD:/code:ro domw/phpcs phpcs --standard=Magento2 --report=full,summary,gitblame /path/to/code
    
    docker run --rm -v $PWD:/code:ro domw/phpcs phpcs --colors --warning-severity=0 --standard=Magento2 --report=full,summary,gitblame /path/to/code
    
    docker run --rm -v $PWD:/code:ro domw/phpcs phpcs --colors --warning-severity=0 --standard=Magento2 --report=full,summary --extensions=php,phtml /path/to/code