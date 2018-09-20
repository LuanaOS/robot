# Robot

## IDE
I choose [Pycharm](https://www.jetbrains.com/pycharm/download/).

### Installing Pycharm
if you are in Linux you will have to:
* extract the folder
* enter the folder pycharm-community-2018.V.X and then on the folder bin:
```
$   cd pycharm-community-2018.V.X/bin
```
* after that execute:
```
$   ./pycharm.sh
```

## Getting Started

Please check out the if you have all the Prerequisites so the project can run on you local machine.

### Prerequisites
* Python
* Web driver for the browser you would like to use.

#### Installing Python
If you do not have Python on your computer, you will need to install it using the command bellow or [downloading it](https://www.python.org/downloads/). 

```
$   sudo apt-get install python
```

#### Downloading Web driver
* Chrome: http://chromedriver.chromium.org/downloads
* Firefox: https://github.com/mozilla/geckodriver/releases

Extract to a folder. (PS.: YOUR/PATH/TO/WEBDRIVER)

### Setting up
Install pip
```
$   sudo apt-get install python-dev
$   pip install virtualenv
```

Creating Virtual Environment
```
$   virtualenv robotframework
$   source robotframework/bin/activate
$   pip install robotframework
$   pip install robotframework-ride
$   pip install robotframework-selenium2library
```


## To execute robot
Everytime you restart your machine you will have to give this command:
```
$   export PATH="YOUR/PATH/TO/WEBDRIVER":$PATH
```
where YOUR/PATH/TO/WEBDRIVER is the path to your web driver folder


To execute all the tests on the file run:
```
$   pybot -d results tests/tester.robot
```

If you would like to run just one or another test you can use:
```
$   pybot -d results -i TAG tests/tester.robot
```
where TAG is the [Tags]'s name of the test you would like to execute.