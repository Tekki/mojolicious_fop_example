package MojoFop::Composer;
use Mojo::Base 'Mojolicious::Controller';
use Ragtime::ComposerList;
use File::Basename 'dirname';
use File::Spec::Functions 'catdir';

sub list {
  my $self = shift;

  my $composers = Ragtime::ComposerList->load;
  $self->title('Mojolicious FOP Example');
  $self->stash(subtitle => 'Ragtime Composers');
  $self->stash(list => $composers);
  
  $self->respond_to(
    html => {},
    pdf=> sub {
      my $base = catdir(dirname(__FILE__), '../../tmp');

      my $fofile = "$base/composers.fo";
      open my $out, '>', $fofile;
      print $out $self->render_partial(format => 'fo');
      close $out;

      my $pdffile = "$base/composers.pdf";
      system 'fop', $fofile, $pdffile;

      $self->stash(pdffile => $pdffile);
      $self->res->headers->content_disposition('attachment; filename=composers.pdf;');
      $self->render_static("../tmp/composers.pdf");
    },
  );

}

1;
