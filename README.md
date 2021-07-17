# Split-on-Phrases
Splits text files into groups of files.  It was initially written to break m multiple chapters per file (with paragraph numbers up to about 42) into 15 minute-speakable files for YouTube.  It splits on every 10 paragraphs.

# Prerequisites

* Please download and install SWI-Prolog for your machine at `https://www.swi-prolog.org/build/`.

* You may need to install gawk using Homebrew.

* Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in
```
culturaltranslationtool/ctt.pl
trans_location("../../../gawk/trans").
```
to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>.

# 1. Install manually

Download <a href="http://github.com/luciangreen/Split-on-Phrases/">this repository</a>, the <a href="https://github.com/luciangreen/listprologinterpreter">List Prolog Interpreter repository</a>, the <a href="https://github.com/luciangreen/Languages">Languages repository</a> and <a href="https://github.com/luciangreen/culturaltranslationtool">Cultural Translation Tool</a>.

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","Split-on-Phrases").
halt
```

# What it does

* Takes an input file, e.g.:

```
title1

1. a
2. a2
10. b
11. b
19. c
20. d
21. e
29. c

title2

1. a
2. a2
10. b
11. b
19. c
20. d
21. e
29. c
30. d
31. e
39. c
40. d
41. e
42. f

eof
```

* and the phrases file:

```
title1
title2
```

* and produces the files:

`grand title by Lucian Green title1 1 of 4.txt`
```
grand title
by Lucian Green
title1 1 of 4

1. a
2. a2
10. b
```

`grand title by Lucian Green title1 2 of 4.txt`
```
grand title
by Lucian Green
title1 2 of 4

11. b
19. c
20. d
```

`grand title by Lucian Green title1 3 of 4.txt`
```
grand title
by Lucian Green
title1 3 of 4

21. e
29. c
```

`grand title by Lucian Green title2 1 of 4.txt`
```
grand title
by Lucian Green
title2 1 of 4

1. a
2. a2
10. b
```

`grand title by Lucian Green title2 2 of 4.txt`
```
grand title
by Lucian Green
title2 2 of 4

11. b
19. c
20. d
```

`grand title by Lucian Green title2 3 of 4.txt`
```
grand title
by Lucian Green
title2 3 of 4

21. e
29. c
30. d
```

`grand title by Lucian Green title2 4 of 4.txt`
```
grand title
by Lucian Green
title2 4 of 4

31. e
39. c
40. d
41. e
42. f
```

# Running

* In Shell:
`cd Split-on-Phrases`
`swipl`
`['../listprologinterpreter/listprolog'].`   

* Load the Split on Phrases program by typing:
`['split_on_phrases'].`

* The algorithm is called in the form:
`split_on_phrases1("grand title","phrasesfile.txt","inputfile.txt").`

Where:
grand title - the title at the start of each file.
phrasesfile.txt - the file with the phrases to split the file on.
inputfile.txt - the file with the entitled list of paragraphs to split.

# Append EOF

* Append EOF (for Mac Terminal) appends EOF (the string, not the symbol) to each text file in the Data folder that appendeof.sh is in the same folder with, to the Out folder.

* The Shell script is called in the form:
`./appendeof.sh`

# Text to AIFF

* Text to AIFF (for Mac Terminal) converts text files in the Data folder that t2aiff.sh is in the same folder with, to AIFF files, which can be converted to MP3s, which can be sound tracks added to YouTube.

* The Shell script is called in the form:
`./t2aiff.sh`

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the LICENSE.md file for details
