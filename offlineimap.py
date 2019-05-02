#! /usr/bin/env python2
from subprocess import check_output


def get_ieee_pass():
    return check_output(
        "gpg -dq ~/.spacemacs.d/ieeepass.gpg", shell=True).strip("\n")
