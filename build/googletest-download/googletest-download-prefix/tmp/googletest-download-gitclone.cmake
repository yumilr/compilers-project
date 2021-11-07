
if(NOT "/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-download/googletest-download-prefix/src/googletest-download-stamp/googletest-download-gitinfo.txt" IS_NEWER_THAN "/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-download/googletest-download-prefix/src/googletest-download-stamp/googletest-download-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-download/googletest-download-prefix/src/googletest-download-stamp/googletest-download-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone --no-checkout --config "advice.detachedHead=false" "https://github.com/google/googletest.git" "googletest-src"
    WORKING_DIRECTORY "/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/google/googletest.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout master --
  WORKING_DIRECTORY "/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "/usr/bin/git"  submodule update --recursive --init 
    WORKING_DIRECTORY "/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-download/googletest-download-prefix/src/googletest-download-stamp/googletest-download-gitinfo.txt"
    "/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-download/googletest-download-prefix/src/googletest-download-stamp/googletest-download-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/home/jlr/Desktop/CICLO6/Compiladores/LABs/Lab2/cs3402-lab1-lab2/build/googletest-download/googletest-download-prefix/src/googletest-download-stamp/googletest-download-gitclone-lastrun.txt'")
endif()

