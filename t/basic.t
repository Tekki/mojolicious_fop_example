use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('MojoFop');
$t->get_ok('/')->status_is(200)->content_like(qr/Joseph F\. Lamb/i);
$t->get_ok('/?format=pdf')->status_is(200)->content_type_is('application/pdf');

done_testing();
