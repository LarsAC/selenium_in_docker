FROM python:3.5-stretch

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN apt-get -y update

# install google chrome
RUN apt-get install -y google-chrome-stable
RUN google-chrome --version

# install chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/73.0.3683.68/chromedriver_linux64.zip
# RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# install selenium
RUN pip install selenium==3.141.0 pytest

WORKDIR /test
COPY tests/ .
# CMD ["python3", "test.py"]
CMD ["pytest", "--junitxml=ui_test_report,xml"]