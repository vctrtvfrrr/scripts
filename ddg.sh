#!/bin/bash

TERMS=${@// /+}

/usr/bin/elinks "https://duckduckgo.com/?q=$TERMS"
