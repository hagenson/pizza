#!/bin/perl

$inCode = 0;
$match = "";
$match2 = "";

# What action are we performing?
$action = shift();

if ("$action" eq "tables")
{
  $match = "m/^\\s*create table /i";
}
elsif ("$action" eq "constraints")
{
  $match = "m/^\\s*alter table \\S+\\s*\$/i";
  $match2 = "m/^\\s+add constraint/i";
}
else
{
  print 'schemaSlice.pl
  Extracts the desired commans from a sql schema creation script
Usage:
  schemaSlide.pl <action> [Sql Script]
Parameters:
  <action>      tables | constraints
  [Sql Script]  Sql Schema create script
Notes:
  If "tables" is specified, the table drop and create commands are extracted
  from the script.
  If "constraints" in specified, the constraint create commands are extracted
  from the script.';
  exit 1;
}

while (<>)
{
  if ($inCode eq 2)
  {
    print;
    if (m/^go\s*$/s)
    {
      $inCode = 0;
    }
  }
  elsif ($inCode eq 1 && eval($match2))
  {
    print $save;
    print;
    $inCode = 2;
  }
  elsif (eval($match))
  {
    if ($match2 eq "")
    {
      print;
      $inCode = 2;
    }
    else
    {
      $save = $_;
      $inCode = 1;
    }
  }
}

