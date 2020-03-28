# JpgRenamer
BAT file to take all jpg files in current directory, rename them into desired format and put into output directory

## USAGES
*Many (tens, hundreds, thousands, ...) jpg files in a directory that you want to rename in a specific way
Renaming them all would be time consuming.

### Imagine you have files 
0001.jpg
0004.jpg
0008.jpg

### Case 1 : You want to rename them to lets say
image_1.jpg
image_2.jpg
image_3.jpg

### Case 2 : You want to have a step difference (eg.: 4) between them

image_4.jpg
image_8.jpg
image_12.jpg

## Calling

CyclesRename.bat [param_name] [step]

### case 1 
CyclesRename.bat image 1

### case 2
CyclesRename.bat image 4

## RESULT
Output directory with name OUTPUT is created where files are copied into
