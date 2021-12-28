# JpgRenamer
## REASONS OF CREATION
Turbosquid is a platform where you can sell 3D models. They require turntable model previews but you need to use specific naming convention like "hello_00.jpeg; hello_01.jpeg;" with leading zero necessary.
You are also allowed to have only 72 images at max, forcing me to use step 5 during 360 render which results in output like "0001.jpg; 0005.jpg;"

Summed up. Didn't want to do renaming by hand every time I needed to fullfil  these:

- uploading pictures somewhere where naming format required
- leading zeroes required "name_01"
- unwanted steps in original naming "0001" -> "0005"

## DESCRIPTION
BAT file to take all jpg files in current directory, rename them into desired format and put into output directory

## USAGES
Many (tens, hundreds, thousands, ...) jpg files in a directory that you want to rename in a specific way

Renaming them all BY HAND would be really time consuming.

### Imagine you have files 
0001.jpg
0004.jpg
0008.jpg
...

### Case 0: Turbosquid turntable requires 12 - 72 jpegs
model_01.jpg
model_02.jpg
model_03.jpg
...

### Case 1 : You want to rename them to lets say
image_1.jpg
image_2.jpg
image_3.jpg
...

### Case 2 : You want to have a step difference (eg.: 4) between them

image_4.jpg
image_8.jpg
image_12.jpg
...

## Calling

CyclesRename.bat [param_name] [step]

### case 0 
CyclesRename.bat model 1 true

### case 1 
CyclesRename.bat image 1

### case 2
CyclesRename.bat image 4

## RESULT
Output directory with name OUTPUT is created where files are copied into
