#! /usr/bin/env perl
$latex='platex -kanji=utf8 -guess-input-enc -synctex=1 -interaction=nonstopmode %S';
$latex_silent='platex -synctex=1 -guess-input-enc -kanji=utf8 -interaction=batchmode';
$bibtex='pbibtex -kanji=utf8 %B';
$dvipdf='dvipdfmx -f ptex-ipaex.map %S';
$pdf_mode=3
