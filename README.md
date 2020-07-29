# python-profile-column

Vim plugin to display the [kernprof](https://github.com/rkern/line_profiler)
profile results in the sign-column.

# Installations

Simply using Vundle.

# Functions

* `RunKernprofBackground()` runs the python script in the current buffer using
  `kernprof -l <script>` in the background. The script output is not visible.

* `RunKernprofForeground()` runs the python script in the current buffer using
  `!kernprof -l %`. 

* `UpdateProfileColumn()` searches for output file of kernprof in the current
  directory and displays the percentages in Vim's signcolumn. Note that the
  sign-column can display a maximum of two characters and therefore 100 is
  displayed as 10. 

* `RunAndPrintBackground()` runs `RunKernprofBackground()` first and then `UpdateProfileColumn()`.

* `RunAndPrintForeground()` runs `RunKernprofForeground()` first and then `UpdateProfileColumn()`.

# Requirements

* [kernprof](https://github.com/rkern/line_profiler)
* Vim..
