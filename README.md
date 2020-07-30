# python-profile-column

Vim plugin to display the [kernprof](https://github.com/rkern/line_profiler)
profile results in the sign-column.

# Installation

Simply use Vundle.

# Functions

TLDR: `RunAndPrintForeground()` to save, execute (+profile) python script, and
print output to the sign-column.

IMPORTANT: Python functions that you want profiled need to be annotated with
`@profile`. Read the [kernprof documentation](https://github.com/rkern/line_profiler)
for details.

* `RunKernprofBackground()` runs the python script in the current buffer using
  `kernprof -l <script>` in the background. The script output is not visible.

* `RunKernprofForeground()` runs the python script in the current buffer using
  `!kernprof -l %`. 

* `UpdateProfileColumn()` searches for output file of kernprof in the current
  directory and displays the percentages in Vim's signcolumn. The largest
  number is printed in a different color. Note that the sign-column can display
  a maximum of two characters and therefore 100 is displayed as 10. 

* `RunAndPrintBackground()` runs `RunKernprofBackground()` first and then `UpdateProfileColumn()`.

* `RunAndPrintForeground()` runs `RunKernprofForeground()` first and then `UpdateProfileColumn()`.

# Requirements

* [kernprof](https://github.com/rkern/line_profiler)
* Vim..

# TODOs

* create custom colors for better highlighting of profile results
* catch handle functions in functions
* functions without profile. e.g., when using joblib
* make it faster
* add docs
