# Install the necessary python libraries.
# Requires Python 3; version 3.6 recommended.
# Chris Joakim, Microsoft, 2017/03/12

echo 'installing/upgrading libs...'
pip install --upgrade pip-tools
pip install --upgrade arrow
pip install --upgrade beautifulsoup4
pip install --upgrade requests
pip install --upgrade Jinja2

echo 'done'
