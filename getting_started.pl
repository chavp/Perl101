#!/usr/bin/perl

use 5.14.2;
use strict;
use warnings;

say "Hello ChavP!";
say "Hello World!";

# Scalar $ $cents An individual value (number or string)
# Array @ @large A list of values, keyed by number
# Hash % %interest A group of values, keyed by string
# Subroutine & &how A callable chunk of Perl code
# Typeglob * *struck Everything named struck

# $ มีความหมายว่า scalar หรือ ตัวแปรอันเดียว
my $phrase = "Sawaddee, Perl!\n"; # สร้างตัวแปลม 
say $phrase; # แสดงตัวแปลที่สร้างไว้

# @ มีความหมายว่า array หรือ หลายตัวแปร
my @pets = ("ไอดุ๊ก", "ไอแมม", "อีอ่อน");

# % แมายถึงว่าเป้นตัวแปร Hash

my $answer = 42; # an integer
my $pi = 3.14159265; # a "real" number
my $avocados = 6.02e23; # scientific notation
my $pet = "Camel"; # string
my $sign = "I love my $pet"; # string with interpolation
my $cost = 'It costs $100'; # string without interpolation

my $camels = "123";
print $camels + 1, "\n";

my @home = ("couch", "chair", "table", "stove");
# เราสามารถสร้าง 4 scalar จาก array home ด้วยประโยคง่ายๆแบบนี้
my ($potato, $lift, $tennis, $pipe) = @home;

print "$potato, $lift, $tennis, $pipe \n";
# swap
($potato, $lift) = ($lift, $potato);
print "$potato, $lift, $tennis, $pipe \n";
$home[0] = "chavp";
$home[1] = "chavp";
$home[2] = "chavp";
$home[3] = "chavp";

($potato, $lift, $tennis, $pipe) = @home;
print "$potato, $lift, $tennis, $pipe \n";

my %longday = (
	"Sun" => "Sunday",
	"Mon" => "Monday",
	"Tue" => "Tuesday",
	"Wed" => "Wednesday",
	"Thu" => "Thursday",
	"Fri" => "Friday",
	"Sat" => "Saturday",
);

print "$longday{'Sun'} \n";

# complex
$longday{'Sun'} = ['WakeUp', 'Work', 'Sleep'];
print "$longday{'Sun'}[0], $longday{'Sun'}[1], $longday{'Sun'}[2] \n";

my %kids_of_wife;
$kids_of_wife{"Jacob"} = {
	"Leah" => ["Reuben", "Simeon", "Levi", "Judah", "Issachar", "Zebulun"],
	"Rachel" => ["Joseph", "Benjamin"],
	"Bilhah" => ["Dan", "Naphtali"],
	"Zilpah" => ["Gad", "Asher"],
};

say "$kids_of_wife{'Jacob'}{'Leah'}[0]";

my $e = exp(1);
say "exp(1) = $e";

my $readme_file = "readme.txt";open(my $handle, "<", $readme_file);
say <$handle>;

# chomp(my $number = <STDIN>);
# say "input: $number";

my $a = 2;
my $b = 3;
my $ab = $a ** $b;
say "$a pow $b = $ab";
$ab = $a + $b;
say "$a + $b = $ab";
$ab = $a . $b;
say "$a . $b = $ab";
$ab = $a * $b;
say "$a * $b = $ab";
$ab = $a x $b;
say "$a x $b = $ab";
say "-" x 20;

my $val;
$val ||= 2; # คล้าย x = x || 2; ของภาษา java script
say $val;

# Logical operator
my $t1 = 1;
my $t2 = 1;
say "$t1 && $t2 = " , ($t1 and $t2);
say "$t1 || $t2 = " , ($t1 or $t2);
say "!$t1 = " , (not $t2);
say "$t1 Xor $t2 = " , ($t1 xor $t2);

say "-" x 20;#Average
# –e $a 	Exists 		True if file named in $a exists
# –r $a 	Readable 	True if file named in $a is readable
# –w $a 	Writable 	True if file named in $a is writable
# –d $a 	Directory 	True if file named in $a is a directory
# –f $a 	File 		True if file named in $a is a regular file
# –T $a 	Text File 	True if file named in $a is a text file

my $grade_file = "grades.txt";
if(-e $grade_file){
	open(GRADES, "<:utf8", "grades.txt") || die "Can't open grades: $!\n";
	binmode(STDOUT, ':utf8');
	my %grades;
	while (my $line = <GRADES>) {
		my ($student, $grade) = split(" ", $line);
		$grades{$student} .= $grade . " ";	}

	for my $student (sort keys %grades) {
		my $scores = 0;
		my $total = 0;
		my @grades = split(" ", $grades{$student});
		for my $grade (@grades) {
			$total += $grade;
			$scores++;
		}
		my $average = $total / $scores;
		print "$student: $grades{$student}\tAverage: $average\n";	}
	say "-" x 20;
}
# Comparison Oper
# Equal 		== 	eq 	True if $a is equal to $b
# Not equal 		!= 	ne 	True if $a is not equal to $b
# Less than 		< 	lt 	True if $a is less than $b
# Greater than 		> 	gt 	True if $a is greater than $b
# Less than or equal 	<= 	le 	True if $a not greater than $b
# Greater than or equal >= 	ge 	True if $a not less than $b
# Comparison 		<=> 	cmp 	0 if equal, 1 if $a greater, −1 if $b greater

my $city = "New York";
if ($city eq "New York") {
	say "New York is northeast of Washington, D.C.";
}
elsif ($city eq "Chicago") {
	say "Chicago is northwest of Washington, D.C.";
}
elsif ($city eq "Miami") {
	say "Miami is south of Washington, D.C. And much warmer!";
}
else {
	say "I don't know where $city is, sorry.";
}

# The given and when Statements
print "What is your favorite color? ";
chomp(my $answer = <STDIN>);
given ($answer) {
	when ("purple") { say "Me too." }
	when ("green") { say "Go!" }
	when ("yellow") { say "Slow!" }
	when ("red") { say "Stop!" }
	when ("blue") { say "You may proceed." }
	when (/\w+, no \w+/) { die "AAAUUUGHHHHH!" }
	when (42) { say "Wrong answer." }
	when (['gray','orange','brown','black','white']) {
		say "I think $answer is pretty okay too.";
	}
	default {
		say "Are you sure $answer is a real color?";
	}
}

# save point Regular Expressions - 39/Programming Perl 4E Zzzz...