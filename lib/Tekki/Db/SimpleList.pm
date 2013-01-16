# reduced list for sample application
package Tekki::Db::SimpleList;

sub next {
  my ($self) = @_;
  my $rv = 0;
  if ($self->{content}) {
    $self->{position}++;
    if ($self->{position} <= @{$self->{content}}) {
      $rv = 1;
    } else {
      $self->{position} = @{$self->{content}} + 1;
    }
  }
  return $rv;
}

sub position {
  return $_[0]->{position};
}

sub _get_string {
  my ($self, $field) = @_;
  return $self->{content}->[$self->{position} - 1]->{$field};
}

1;
