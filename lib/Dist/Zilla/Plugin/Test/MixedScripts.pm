package Dist::Zilla::Plugin::Test::MixedScripts;

use v5.14;
use warnings;

use Moose;
use Path::Tiny;
use Sub::Exporter::ForMethods 'method_installer';
use Data::Section 0.004 { installer => method_installer }, '-setup';
use Moose::Util::TypeConstraints 'role_type';
use namespace::autoclean;

with
  'Dist::Zilla::Role::FileGatherer',
  'Dist::Zilla::Role::FileMunger',
  'Dist::Zilla::Role::TextTemplate',
  'Dist::Zilla::Role::PrereqSource';

our $VERSION = 'v0.1.0';

has filename => (
    is      => 'ro',
    isa     => 'Str',
    lazy    => 1,
    default => sub { return 'xt/author/mixed-unicode-scripts.t' },
);

has _file_obj => (
    is  => 'rw',
    isa => role_type('Dist::Zilla::Role::File'),
);

around dump_config => sub {
    my ( $orig, $self ) = @_;
    my $config = $self->$orig;
    $config->{ +__PACKAGE__ } = {
        filename => $self->filename,
        blessed($self) ne __PACKAGE__ ? ( version => $VERSION ) : (),
    };
    return $config;
};

sub gather_files {
    my $self = shift;
    require Dist::Zilla::File::InMemory;
    $self->add_file(
        $self->_file_obj(
            Dist::Zilla::File::InMemory->new(
                name    => $self->filename,
                content => ${ $self->section_data('__TEST__') },
            )
        )
    );
    return;
}

sub munge_files {
    my $self = shift;
    my $file = $self->_file_obj;
    $file->content(
        $self->fill_in_string(
            $file->content,
            {
                dist   => \( $self->zilla ),
                plugin => \$self,
            },
        )
    );
    return;
}

sub register_prereqs {
    my $self = shift;
    $self->zilla->register_prereqs(
        {
            phase => 'develop',
            type  => 'requires',
        },
        'Test::More'         => '1.302200',
        'Test::MixedScripts' => '0',
    );
}

__PACKAGE__->meta->make_immutable;

__DATA__
___[ __TEST__ ]___
use strict;
use warnings;

# This test was generated with {{ ref $plugin }} {{ $plugin->VERSION }}.

use Test::More 1.302200;

use Test::MixedScripts qw( all_perl_files_scripts_ok );

all_perl_files_scripts_ok();

done_testing;
