$handle = sub {

my $delayInSeconds = 60 * 5;

#load the Lib_past with current time on first run
if(!$Lib_firstrun){
     $Lib_firstrun = true;
     print $streamout "Seeding timestamp generator\n";
     $Lib_past = time;
}

#if we have elapsed $delayInSeconds then print a time stamp
if($Lib_past < (time - ($delayInSeconds))){
     $Lib_past = time;
     print $streamout "--" . localtime time . "\n\n";
     print $streamout "\n";
}

#this allows TTYtter to handle displaying the tweet normally
return 1;
#my $ref = shift;
#&defaulthandle($ref);
#
#return 1;

};
