#!/bin/sh -l

BUILD=$( cd ${HOME} && ant )
echo "::set-output name=build::${BUILD}"
