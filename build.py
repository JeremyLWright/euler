from jinja2 import Template
import os
import re

m = re.compile('p[0-9]+.hs')
fs = []
for (dirpath, dirnames, filenames) in os.walk('src'):
    for f in filenames:

        match = m.match(f)
        if match:
            fs.append(f.split('.')[0])

template = Template(file("cabal.tmpl", "r").read())
with open("cabal.progs", "w") as f:
    f.write(template.render(exes=sorted(fs)))

template = Template(file("make.tmpl", "r").read())
with open("make.progs", "w") as f:
    f.write(template.render(exes=sorted(fs)))
