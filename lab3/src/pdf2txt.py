import subprocess
# Name is the desired name (target name)

def pdf2csv(link, name):
    call(['bash', 'downloadConvert.sh', link, name])

