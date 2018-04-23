#!/bin/python
import subprocess
#import os
from itertools import product
from string import ascii_uppercase
from string import ascii_lowercase
numeric = '1234567890'

ASCII = ascii_uppercase + ascii_lowercase + numeric
#ASCII = ''.join(chr(x) for x in range(33,126))

#print ASCII
list = []

for combo in product(ASCII, repeat=2):
        list += [''.join(combo)]
    #list += [combo]
'''
for x in list:
    print x 
'''

def func():
    x=0
    pw=''
    while x < 8:
        #os.system(r'./rand.pl combolist')
        s=subprocess.check_output(["./rand.pl", "combolist"])
        pw+=s.rstrip()
        x+=1
    print pw

y=0
while y < 100000:
    func()
    y+=1




