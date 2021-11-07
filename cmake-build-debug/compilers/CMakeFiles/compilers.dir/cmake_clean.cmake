file(REMOVE_RECURSE
  "libcompilers.a"
  "libcompilers.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/compilers.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
