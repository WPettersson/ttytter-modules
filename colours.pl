use Term::ANSIColor;

my @colors = qw(bright_red bright_yellow bright_magenta bright_cyan green);

my $numcolors = @colors;


sub simple_hash {
  my ($string) = @_;
  chomp $string;
  my @chars = split //, $string;
  my $counter;

  foreach my $char (@chars) {
    $counter += ord $char;
  }

  $counter = $colors[$counter % $numcolors];

  return $counter;
}

sub underline {
  my ($tweet) = @_;
  my $UNDER = "";
  my $colour = "";
# only do this after the < > portion.
  my $k = index($tweet, ">");
  my $botsub = substr($tweet, $k);
  my $topsub = substr($tweet, 0, $k);
  $botsub =~ s/(^|[^a-zA-Z0-9_])\@([a-zA-Z0-9_\/]+)/\1\@${UNDER}\2${colour}/g;
  $tweet = $topsub . $botsub;
  return $tweet;
}

$handle = sub {
  my $ref = shift;
  my $text = &descape($ref->{'text'});
  my $arrow = "==>";
  if ($text =~ m/$whoami/i) { $arrow = colored ['green on_red'], '==>'; }
  my $name = &descape($ref->{'user'}->{'name'});
  my $coloredname = colored($name, simple_hash($name));
  my $colorid = colored($ref->{'user'}->{'screen_name'}, simple_hash($name));
  print $streamout ($ref->{'menu_select'}, "> ",
    $coloredname, " (@",
    &descape($ref->{'user'}->{'screen_name'}), ") ", $arrow, " ",
    $text, "\n");
  return 0;
};
