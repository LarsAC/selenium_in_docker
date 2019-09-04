import pytest

@pytest.fixture
def driver():
    from selenium import webdriver
    
    options = webdriver.ChromeOptions()
    options.add_argument('headless')
    options.add_argument('no-sandbox')
    options.add_argument('disable-dev-shm-usage')
    driver = webdriver.Chrome(chrome_options=options)

    return driver

def test_title(driver):
    from selenium.webdriver.common.by import By
    driver.get('http://www.google.com')

    q = driver.find_element(By.NAME, 'q')
    q.send_keys('webdriver')
    q.submit()

    print(driver.title)
    print('Success')

    assert len(driver.title) > 0


