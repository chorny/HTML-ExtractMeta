#!/usr/bin/env perl
#
use 5.006;
use strict;
use warnings FATAL => 'all';

use Test::More;
use FindBin;
use File::Slurp qw( read_file );

BEGIN {
    use_ok( 'HTML::ExtractMeta' );
}

{
    my $html = read_file( $FindBin::Bin . '/html/techcrunch.html' );

    my $EM = HTML::ExtractMeta->new( html => $html );

    ok( $EM->get_title()       eq "The 10 Best iOS And Android Games Of 2012 | TechCrunch", 'get_title()' );
    ok( $EM->get_description() eq "Editor's note: Stephen Danos is the associate editor for the mobile app discovery site Appolicious. This year’s most captivating games either pushe..", 'get_description()' );
    ok( $EM->get_url()         eq "http://techcrunch.com/2012/12/29/the-10-best-ios-and-android-games-of-2012/", 'get_url()' );
    ok( $EM->get_image_url()   eq "http://tctechcrunch2011.files.wordpress.com/2012/12/app-stores.jpg?w=136", 'get_image_url()' );
    ok( $EM->get_site_name()   eq "TechCrunch", 'get_site_name()' );
    ok( $EM->get_type()        eq "article", 'get_type()' );

    is_deeply( $EM->get_keywords(), [], 'get_keywords()' );
}

{
    my $html = read_file( $FindBin::Bin . '/html/wired.html' );

    my $EM = HTML::ExtractMeta->new( html => $html );

    ok( $EM->get_title()        eq "Pixar Animator Dreams Up a New Superhero \x{2014} For Each Day of the Year", 'get_title()' );
    ok( $EM->get_description()  eq "Most people think losing 10 pounds is an ambitious New Year\'s resolution, but Pixar artist Everett Downing set out to create 365 brand-new superheroes in one year. Downing has brought iconic characters to life in classics like Ratatouille, WALL-E, and Up, so coming up with a bullpen of his own characters seemed like a simple enough task.", 'get_description()' );
    ok( $EM->get_url()          eq "http://www.wired.com/design/2012/12/365-superheroes/", 'get_url()' );
    ok( $EM->get_image_url()    eq "http://www.wired.com/design/wp-content/uploads/2012/12/365-supers-wired-design-350x208.jpg", 'get_image_url()' );
    ok( $EM->get_locale()       eq "en_US", 'get_locale()' );
    ok( $EM->get_author()       eq "Joseph Flaherty", 'get_author()' );
    ok( $EM->get_site_name()    eq "Wired Design", 'get_site_name()' );
    ok( $EM->get_type()         eq "article", 'get_type()' );

    is_deeply( $EM->get_authors(), ['Joseph Flaherty', '@josephflaherty'], 'get_authors()' );
}

{
    my $html = read_file( $FindBin::Bin . '/html/cnn.html' );

    my $EM = HTML::ExtractMeta->new( html => $html );

    # use Data::Dumper;
    # print STDERR Dumper( $EM->get_authors() );

    ok( $EM->get_title()       eq "Charter bus skids on ice, kills 9 in Oregon - CNN.com", 'get_title()' );
    ok( $EM->get_description() eq "A bus in northern Oregon skidded on ice, crashed through a guardrail and tumbled down an embankment Sunday, killing nine people.", 'get_description()' );
    ok( $EM->get_url()         eq "http://www.cnn.com/2012/12/30/us/oregon-bus-crash/index.html", 'get_url()' );
    ok( $EM->get_image_url()   eq "http://i2.cdn.turner.com/cnn/dam/assets/121230105427-oregon-bus-crash-story-top.jpg", 'get_image_url()' );
    ok( $EM->get_locale()      eq "en-US", 'get_locale()' );
    ok( $EM->get_author()      eq "CNN Staff", 'get_author()' );
    ok( $EM->get_site_name()   eq "CNN", 'get_site_name()' );
    ok( $EM->get_type()        eq "article", 'get_type()' );

    is_deeply( $EM->get_authors(), ['CNN Staff', '@CNNI'], 'get_authors()' );
    is_deeply( $EM->get_keywords(), [], 'get_keywords()' );
}

done_testing();