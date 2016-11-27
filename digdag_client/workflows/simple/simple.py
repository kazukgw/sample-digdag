# coding: utf-8

from __future__ import print_function
import digdag
import datetime

def step2():
    with open("simple.txt", "a") as f:
        n = datetime.datetime.now().strftime("[%Y-%m-%d %H:%I:%S] ")
        f.write(n + "write via python !!\n")

    digdag.env.store({"path": "simple.txt"})

def step3(path):
    print("path: " + path)

