package ISBN::ISBNSearchOrg::Parse;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;
use Log::ger;

use HTML::Entities qw(decode_entities);

our %SPEC;

sub _strip_summary {
    my $html = shift;
    $html =~ s!<a[^>]+>.+?</a>!!sg;
    #$html = replace($html, {
    #    '&nbsp;' => ' ',
    #    '&raquo;' => '"',
    #    '&quot;' => '"',
    #});
    decode_entities($html);
    $html =~ s/\n+/ /g;
    $html =~ s/\s{2,}/ /g;
    $html;
}

$SPEC{parse_isbnsearchorg_isbn_page} = {
    v => 1.1,
    summary => 'Extract information from an isbnsearch.org ISBN page',
    args => {
        page_content => {
            schema => 'str*',
            req => 1,
            cmdline_src => 'stdin_or_file',
        },
    },
};
sub parse_isbnsearchorg_isbn_page {
    require Mojo::DOM;

    my %args = @_;

    my $ct = $args{page_content} or return [400, "Please supply page_content"];

    my $res = {};
    my $resmeta = {};

    my $dom = Mojo::DOM->new($ct);

    # title
    $
    [200, "OK", $res, $resmeta];
}

1;
# ABSTRACT:

=head1 SEE ALSO

C<Business::ISBN::*>

C<WWW::Scraper::ISBN::*>
