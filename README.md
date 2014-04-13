Bottle-Bootstrapped
===================

Bottle-Bootstrapped is Bottle.py with twitter Bootstrap and jQuery redy to run.
Its a complete template site with working backend and frontend,
just run it! Perfect for new web projects.


Directory Structure
====================

bbsite.py

css/

js/

views/

Install
====================

 A. Fetch the repository.

git clone https://github.com/thedemz/Bottle-Bootstrapped.git

 B. Install a virtual environment. Use python 3.3+

virtualenv --python=/usr/bin/python3.3 virtual-environment --verbose

 C. Install python modules to your environment.

./virtual-environment/bin/pip install bottle
./virtual-environment/bin/pip install beaker
./virtual-environment/bin/pip install mako

 D. Run the server.

./virtual-environment/bin/python3.3 bbsite.py debug=True            

Bottle v0.12.5 server starting up (using WSGIRefServer())...
Listening on http://localhost:8081/
Hit Ctrl-C to quit.

 E. Start your browser and enter the url:

http://localhost:8081/
