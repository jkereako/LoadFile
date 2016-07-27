# LoadFile
It may seem silly to dedicate an entire XCode project to file loading, but, I
spent over an hour attempting to load JSON into memory. This is normally an easy
operation, except that the JSON file is located in a sibling directory to the
code that tried to load it.

# EDIT

### Well that was easy
So I forgot that when a project compiles, all of project directories are
"bundled" together into the app bundle. At runtime, the path that that the file
is located in before compile-time no longer exists. In short, all I had to do
was search for the file itself and leave off the path.

