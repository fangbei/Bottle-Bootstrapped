### ==========================================
### Install Python Virtual Environment
### ==========================================

1. Arch Linux virtualenv Install

$   pacman -S python-virtualenv

2. Create a local Virtual Environment

virtualenv --python=/usr/bin/python3.3 virtual-environment --verbose 

./virtual-environmen/bin/pip-3.3 freeze

./virtual-environment/bin/pip-3.3 install "bottle==0.11.6"
./virtual-environment/bin/pip-3.3 install "Mako==0.5.0"
./virtual-environment/bin/pip-3.3 install "Beaker==1.6.4"
./virtual-environment/bin/pip-3.3 install "py-postgresql"

### ==========================================
### CSS
### ==========================================

Bootstrap
Bootstrap Datatables

### ==========================================
### javascript
### ==========================================

jQuery
Bootstrap
Datatables - A nice advanced table

Knockoutjs - Model View
Momentjs - Time and Dates

### ==========================================
### Python 3.3
### ==========================================

Bottlepy - Microframwork for webapplications
Beaker - Sessionhandling

### =========================================
### Create zip file
### =========================================

$   zip -r wwwproject.zip . -x "*ENV*"


### =========================================
### d3 - Data-Driven Documents
### =========================================

http://nlpviz.bpodgursky.com/home
https://www.dashingd3js.com/svg-basic-shapes-and-d3js
http://knowledgestockpile.blogspot.se/2012/01/understanding-selectall-data-enter.html
http://bl.ocks.org/mbostock/raw/4063570/



### Working with data files ###

### ==========================================
### sed
### ==========================================

sed -n '77,152p' nodes.js | sort -u | sed 's/^/"/' | sed 's/$/",/'

### ==================================
### tr "translate"
### ==================================
cat categories.txt | tr "[:upper:]" "[:lower:]" > catergories_lower.txt

Create a list of the words in /path/to/file, one per line, enter:
tr -cs "[:alpha:]" "\n" < /path/to/file

Where,

-c : Complement the set of characters in string1
-s : Replace each input sequence of a repeated character that is listed in SET1 with a single occurrence of that character




