#!/bin/bash

source exiftool-common.sh

exiftool -ext crw -ext CRW  ${exif_param_NAME_ONLY}  '-'"${TAG}"'<${DateTimeOriginal}'"${camera_lens_ext}"  ${dir}

