echo $PWD/tests
docker run --rm --name=selenium-auto-test -v $PWD/tests:/test selenium-chrome-testing
