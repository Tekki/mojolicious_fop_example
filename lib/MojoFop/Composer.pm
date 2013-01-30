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

      srand;
      my $fileid = time . int rand 10000;
      my $fofile = "$base/$fileid.fo";
      open my $out, '>', $fofile;
      print $out $self->render_partial(format => 'fo');
      close $out;

      my $pdffile = "$base/$fileid.pdf";
      system 'fop', $fofile, $pdffile;

      $self->on(
        finish => sub {
          unlink "$base/$fileid.pdf";
          unlink "$base/$fileid.fo";
        }
      );

      $self->stash(pdffile => $pdffile);
      $self->res->headers->content_disposition('attachment; filename=composers.pdf;');
      $self->render_static("../tmp/$fileid.pdf");
    },
  );

}

1;
