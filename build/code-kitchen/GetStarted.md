# Code Kitchen - Get Started Guide

## What is Code Kitchen

Code Kitchen is a hosted environment for cloud or web development.


## Creating and using a virtual environment

It is typically recommended that we use a venv for each project we are working on.

Run this to create a python virtual environment:

```bash
# Firstly pull the repo you will be working on or create a folder to house your project
cd ./my-project-folder              # Change directory into the project/repo
python -m venv .venv                # Creates the virtual environment
source .venv/bin/activate           # Activate the VENV

# Now that the VENV is active, you can proceed to install any needed packages in it
pip3 install flask
```

## Adding local python package path to $PATH

To allow python to locate local packages, you may need to run this in the terminal window.

```bash
export PATH=/home/coder/.local/bin:$PATH
```

## How to access a port

Any port you open in the container will be forwarded by proxy to an externally accessable URL, so you can access it from your browser.

```
https://code-kitchen.foodyfood.cloud/user/<user-name>/proxy/<port-number>

For example, dash could be accessed on it's default port like this:
https://code-kitchen.foodyfood.cloud/user/foodyfood/proxy/8050
```

## How to use dash

Since there is a proxy between you and dash, we must reformat the dash URLs slightly for them to work remotely.

Add this code to your dash app where 8050 is the port your dash app is running on:

```python
# For accessing dash from local browser
app.config.suppress_callback_exceptions = True
app.config.update({
    # remove the default of '/'
    'routes_pathname_prefix': '',
    # remove the default of '/'
    'requests_pathname_prefix': '8050/' # The / after 8050 is required
})
```

