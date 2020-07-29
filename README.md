# python-profile-column
vim plugin to display the kernprof profile results in the sign column

# Installations

Simply using Vundle.

# Functions

* `RunKernprofBackground()` runs the python script in the current buffer using
  `kernprof -l <script>` in the background. The script output is not visible.

* `UpdateProfileColumn()` searches for output file of kernprof in the current
  directory and displays the percentages in Vim's signcolumn. Note that the
  sign-column can display a maximum of two characters and therefore 100 is
  displayed as 10. 

* `RunAndPrint()` runs `RunKernprofBackground()` first and then `UpdateProfileColumn()`.
