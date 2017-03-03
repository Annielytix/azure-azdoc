# Install the necessary python libraries.
# Requires Python 3; version 3.6 recommended.
# Chris Joakim, Microsoft, 2017/03/05

echo 'installing/upgrading libs...'
pip install --upgrade pip-tools
pip install --upgrade arrow
pip install --upgrade beautifulsoup4
pip install --upgrade requests

echo 'done'
