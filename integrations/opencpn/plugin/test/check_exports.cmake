# SPDX-License-Identifier: GPL-3.0-or-later
# Fails unless the plugin library exports create_pi and destroy_pi (nm -D).
execute_process(COMMAND nm -D --defined-only ${LIB} OUTPUT_VARIABLE out RESULT_VARIABLE rc)
if(NOT rc EQUAL 0)
  message(FATAL_ERROR "nm failed on ${LIB}")
endif()
foreach(sym create_pi destroy_pi)
  if(NOT out MATCHES " T ${sym}\n")
    message(FATAL_ERROR "${LIB} does not export ${sym}")
  endif()
endforeach()
