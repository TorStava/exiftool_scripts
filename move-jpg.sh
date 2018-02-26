#!/bin/bash

dir=${1:-.}
images_root="${2:-.}"

#/media/tom/4Tb_Seagate/Images/

images_dirirectory='%%le/%Y/%m/%Y-%m-%d'
file_name="%Y-%m-%d_%H-%M-%S"
full_name="${images_root}/${images_dirirectory}/${file_name}"

exit_param="-m -r -progress -d ${full_name}" 

camera='${Model;s/EOS//;s/910G/910F/;s/920G/910F/;s/PowerShot//;s/DIGITAL //;s/ IS//;tr/ /_/;s/__+/_/g;s/AF-S_DX_VR_Zoom-//;s/$_/__$_/}'
lens='${LensID;s/ f\/.*$//;s/ DC HSM//;tr/ /_/;s/$_/~~$_/}' # ;s/Unknown/Embedded/;
ms='${SubSectimeOriginal;$_.=0 x(3-length);s/$_/.$_/}'
suffix="${ms}${camera}${lens}"'%+c.%le'


filename="FileName" #  testname  
 
exiftool -ext jpg -ext JPG ${exit_param} '-'"${filename}"'<${FileModifyDate}'"${suffix}" '-'"${filename}"'<${CreateDate}'"${suffix}" '-'"${filename}"'<${DateTimeOriginal}'"${suffix}"  "${dir}"

