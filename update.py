# %%
import os

def getListOfFiles(dirName):
    # create a list of file and sub directories 
    # names in the given directory 
    listOfFile = os.listdir(dirName)
    allFiles = list()
    # Iterate over all the entries
    for entry in listOfFile:
        # Create full path
        fullPath = os.path.join(dirName, entry)
        # If entry is a directory then get the list of files in this directory 
        if os.path.isdir(fullPath):
            allFiles = allFiles + getListOfFiles(fullPath)
        else:
            allFiles.append(fullPath)
                
    return allFiles


all_files = getListOfFiles('.')

link = []
for file in all_files:
    if file[0:2] == './' and file[-10:] == '/readme.md':
        link.append(file)
title = []

for l in link:
    f = open(l, "r")
    title.append(f.readline()[2:-1])

text = []
for i in range(len(link)):
    text.append('# [' + title[i] + '](' + link[i] + ')\n')
f = open('./README.md', 'w', encoding='utf-8')
f.writelines(text)
f.close()


# %%
