# Printing

Printing seems to be a complicated issue with my Canon G7050 and Linux, so here are some instructions how I got it working:

1. Install [these packages](https://github.com/endeavouros-team/EndeavourOS-packages-lists/blob/master/printing). If you installed EndeavourOS and ticked the box to install printing packages, these should already be installed.
2. Start (and enable) `cups.service` (or `cups.socket`), if it is not already running.
3. Go [here](http://localhost:631/admin) and click *Add Printer*. Make sure to add the printer annotated with *(driverless)*, as it worked best for me and without any further steps.
4. Now, printing should be ready. If it does not work, check if any error messages appear [here](http://localhost:631/printers/). If CUPS is *Unable to locate printer "..."*, use the solution provided [here](https://wiki.archlinux.org/title/CUPS/Troubleshooting#Unable_to_locate_printer).
