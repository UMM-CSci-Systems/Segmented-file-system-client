#!/usr/bin/env bats

# Run this from the top level directory, i.e.,
# bats test/client_tests.bats

cd src

# Clean out any previously downloaded files.
rm -f small.txt
rm -f AsYouLikeIt.txt
rm -f binary.jpg

# (Re)compile the code
rm -f segmentedfilesystem/*.class
javac segmentedfilesystem/*.java

# Run the client
java segmentedfilesystem.Main

cd ..

@test "Your client correctly assembled small.txt" {
  run diff ../test/target-files/small.txt small.txt

  [ "$status" -eq 0 ]
}

@test "Your client correctly assembled AsYouLikeIt.txt" {
  run diff ../test/target-files/AsYouLikeIt.txt AsYouLikeIt.txt

  [ "$status" -eq 0 ]
}

@test "Your client correctly assembled binary.jpg" {
  run diff ../test/target-files/binary.jpg binary.jpg

  [ "$status" -eq 0 ]
}
