# run at linux command line 
#       xsct setup.tcl
#       vitis --classic --workspace ./workspace
#
file delete -force ./workspace

set hw ../implement/results/top.xsa
set proc "microblaze_0"

setws ./workspace

platform create -name standalone_plat -hw $hw -proc $proc -os standalone 

app create -name i2c_test -platform standalone_plat -domain standalone_domain -template "Empty Application(C)"
file link -symbolic ./workspace/i2c_test/src/test.c               ../../../src/i2c_test/test.c
file link -symbolic ./workspace/i2c_test/src/fpga.h               ../../../src/fpga.h

#app create -name hello1 -platform standalone_plat -domain standalone_domain -template "Empty Application(C)"
#file link -symbolic ./workspace/hello1/src/test.c               ../../../src/hello1/test.c
#file link -symbolic ./workspace/hello1/src/fpga.h               ../../../src/fpga.h

app build all

