#!/bin/bash

TERMS=${@// /+}
ELINKS=$(which elinks)

$ELINKS "https://www.google.com/search?q=$TERMS"
