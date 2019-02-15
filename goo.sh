#!/bin/bash

TERMS=${@// /+}

/usr/bin/elinks "https://www.google.com/search?q=$TERMS"
