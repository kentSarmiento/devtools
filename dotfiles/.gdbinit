# .gdbinit v1.0
# Set of default commands for gdb
#

# Modifications:
# (1.00) NCAPNET - Creation

# This prevents nca.exe program execution from being interrupted by some signals
ha SIGUSR1 noprint nostop
ha SIGUSR2 noprint nostop
