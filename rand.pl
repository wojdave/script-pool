#!/usr/bin/perl

my $FILE = shift || die "Usage: $0 FILENAME\n";
open(FILE, $FILE) || die "Can't open $FILE";
srand;
rand($.) < 1 && ($line = $_) while <FILE>;
print $line;

# sed -i -- 's/string1/string2/g' file.txt 
