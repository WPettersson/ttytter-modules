use Term::ANSIColor;

foreach $i (qw(bright_black bright_red bright_green bright_yellow bright_blue bright_magenta bright_cyan bright_white  black  red  green  yellow  blue  magenta  cyan  white)){
  print colored($i,$i),"\n";
}

foreach $i (qw(bright_black bright_red bright_green bright_yellow bright_blue bright_magenta bright_cyan bright_white  black  red  green  yellow  blue  magenta  cyan  white)){
  foreach $j (qw(on_bright_black on_bright_red on_bright_green on_bright_yellow on_bright_blue on_bright_magenta on_bright_cyan on_bright_white on_black on_red on_green on_yellow on_blue on_magenta on_cyan on_white)){
    $c = "$i $j";
    print colored($c,$c),"\n";
  }
}
