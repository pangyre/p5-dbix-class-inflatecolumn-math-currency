use inc::Module::Install;

name "DBIx-Class-InflateColumn-Math-Currency";
all_from "lib/DBIx/Class/InflateColumn/Math/Currency.pm";
repository "git://github.com/pangyre/p5-dbix-class-inflatecolumn-math-currency";

requires "strictures" => undef;
requires "Math::Currency" => undef;

system("pod2text lib/DBIx/Class/InflateColumn/Math/Currency.pm > README") == 0
    or die "Couldn't update the README file"
    if $Module::Install::AUTHOR;

auto_install;
WriteAll;
