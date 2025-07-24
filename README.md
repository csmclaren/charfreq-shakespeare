# Charfreq Shakespeare

The purpose of this project is to analyze [n-gram](https://en.wikipedia.org/wiki/N-gram) frequency (for orders 1, 2 and 3) in the [works of William Shakespeare](https://www.gutenberg.org/ebooks/100).

This project downloads the complete works from https://www.gutenberg.org/ebooks/100.txt.utf-8 and processes it to produce the following twelve tab-separated, LF-terminated, and UTF-8 encoded files, where {n} is 1, 2, and 3:

- `{n}-grams.tsv`

  A table of all unique {n}-grams and their total number of occurrences (the *count*). Column 1 is the {n}-gram and column 2 is the count. All {n}-grams are escaped as described below. Rows are sorted in descending order of count (i.e., highest count first).

- `{n}-grams-uc.tsv`

  {n}-grams.tsv, but for all unique {n}-grams converted to uppercase.

- `{n}-grams-with-c-and-p.tsv`

  {n}-grams.tsv, but with three columns appended to each row, representing cumulative count, percentage count, and cumulative percentage count.

- `{n}-grams-uc-with-c-and-p.tsv`

  {n}-grams-uc.tsv, but with three columns appended to each row, representing cumulative count, percentage count, and cumulative percentage count.

### Escaped strings

Escaped strings are strings in which specific Unicode code points are replaced with *escape sequences* - alternate representations used to ensure safe and unambiguous encoding - as follows:

- Code points with values 0 through 31 (inclusive) or 127 are replaced with `\x##`, where `##` is the value represented as two uppercase hexadecimal digits.
- `\` is replaced with `\\`.

## Author and copyright

This project was written and copyrighted in 2025 by Chris McLaren ([@csmclaren](https://www.github.com/csmclaren)).

## License

Unless otherwise noted, all files in this project are licensed under the [MIT License](https://choosealicense.com/licenses/mit/). See the [LICENSE](LICENSE.txt) file for details.
