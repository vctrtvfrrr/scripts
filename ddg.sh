#!/bin/bash

TERMS=${@// /+}
ELINKS=$(which elinks)

$ELINKS "https://duckduckgo.com/?q=$TERMS"
