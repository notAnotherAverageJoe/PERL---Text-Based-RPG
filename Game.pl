#!/usr/bin/perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/lib";
use Term::ANSIColor;
use Adventurers;
use Quest;  
use Harpy;
use Inventory;

use feature 'say';
# Create a new adventurer based on user input
print color('bold green');
print "\t\t\t\tWelcome Adventurer to your epic quest.\n\n";
print color('reset');

my $adventurer = Adventurer->create_adventurer();
$adventurer->display();
print"\n\n It is a pleasure to meet you ", $adventurer->get_name()," !";
print"\n\n Just so you know...we don't often get ", $adventurer->get_race(),"'s around here 
.... try and keep a low profile...\n";

Inventory::backpack_management($adventurer);
print"\n\nbut...anyway..let's get started...
\tGreetings, brave adventurer! 
\t\tWe're truly honored to have you join us.
\t\tWe've been facing considerable challenges as we navigate through the treacherous annual harpy migration. ;
\t\t\t\tYour presence here is a beacon of hope in these trying times.\n\n";
print"\n Will you stay and help us fight off these harpies and save our villages? ";
print "\nType (yes/no) to continue... please choose quickly, we don't have much time: ";
chomp(my $intro = <STDIN>);
$intro = lc($intro);  # Convert input to lowercase

if ($intro eq "yes" || $intro eq "y") {
    print "Working...\n";
    Quest::start_quest($adventurer);  # Pass the existing Adventurer object
} else {
    print color('bold red');
    print "We needed you, ", $adventurer->get_name(), ", you are a sorry excuse of a ", $adventurer->get_race(), "...\n";
    print color('reset');
}
