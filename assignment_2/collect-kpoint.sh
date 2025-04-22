#!/bin/bash

grep -e 'kinetic-energy cutoff' -e ! Si.scf.out | \
    awk '/kinetic-energy/ {ecut=$(NF-1)}
         /!/              {print ecut, $(NF-1)}'

