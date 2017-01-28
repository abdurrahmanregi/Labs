#!/bin/bash
# Clean up the repository by removing auxiliary files.

FILES=(PythonEssentials Volume1 Volume2 Volume3 Volume4 ExtraLabs InstructorNotes)

set +e      # Ignore any failures

# Delete .pyc files and Jupyter Notebook checkpoints.
find . -type f -name "*.pyc" -delete
find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} +

# Delete extra files that may have been generated by LaTeX.
find . -type f -name "*.aux"  -delete
find . -type f -name "*.log" -delete
for FILE in ${FILES[@]}
do
    find . -maxdepth 1 -type f -name "$FILE.*" ! -name "$FILE.tex" ! -name "$FILE.pdf" -delete
done