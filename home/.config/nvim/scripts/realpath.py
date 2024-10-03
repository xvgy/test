import os, sys
    
fzf = sys.argv[1]
cwd = os.path.realpath(os.curdir)

rel = os.path.relpath(fzf, cwd)

sys.stdout.write(rel)
sys.stdout.flush()
