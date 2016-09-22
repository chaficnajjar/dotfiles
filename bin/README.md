# Custom scripts

Bash scripts to get things done, fast.

## Description

### Snippet

+ *snippet* snips the last 10 seconds of several MP4 files and merges them together into one file. **The output directory is ~/output/**.
    + Dependencies: [avconv](http://libav.org/) and [MP4Box](http://gpac.wp.mines-telecom.fr/mp4box/).
    + Usage: `./snippet path/to/input/directory`

## Bugs

*snippet*: I tried having avconv keep the same codecs during the snipping using `-vcodec copy -acodec copy` right after `-ss $((${array[$i]}-10)) -t 10` but it resulted in broken videos for some reason.

## License and Credits

```
The MIT License (MIT)

Copyright (c) 2016 Chafic Najjar

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

Created by [Chafic Najjar](https://github.com/chaficnajjar).
