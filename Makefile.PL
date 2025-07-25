# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v6.032.
use strict;
use warnings;

use 5.016000;

use ExtUtils::MakeMaker;

my %WriteMakefileArgs = (
  "ABSTRACT" => "author tests to ensure there is no mixed Unicode",
  "AUTHOR" => "Robert Rothenberg <rrwo\@cpan.org>",
  "BUILD_REQUIRES" => {
    "ExtUtils::MakeMaker" => "7.22",
    "Module::Metadata" => "1.000015"
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0
  },
  "DISTNAME" => "Dist-Zilla-Plugin-Test-MixedScripts",
  "LICENSE" => "perl",
  "MIN_PERL_VERSION" => "5.016000",
  "NAME" => "Dist::Zilla::Plugin::Test::MixedScripts",
  "PREREQ_PM" => {
    "Data::Section" => "0.004",
    "Dist::Zilla::File::InMemory" => 0,
    "Dist::Zilla::Role::FileFinderUser" => 0,
    "Dist::Zilla::Role::FileGatherer" => 0,
    "Dist::Zilla::Role::FileMunger" => 0,
    "Dist::Zilla::Role::PrereqSource" => 0,
    "Dist::Zilla::Role::TextTemplate" => 0,
    "List::Util" => "1.45",
    "Moose" => 0,
    "Moose::Util::TypeConstraints" => 0,
    "Path::Tiny" => 0,
    "Sub::Exporter::ForMethods" => 0,
    "namespace::autoclean" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "File::pushd" => 0,
    "FindBin" => 0,
    "Module::Metadata" => "1.000015",
    "Test2::V0" => 0,
    "Test::DZil" => 0,
    "Test::MixedScripts" => "0.3.0",
    "Test::More" => 0,
    "Test::Warnings" => "0.009",
    "strict" => 0
  },
  "VERSION" => "v0.1.5",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Data::Section" => "0.004",
  "Dist::Zilla::File::InMemory" => 0,
  "Dist::Zilla::Role::FileFinderUser" => 0,
  "Dist::Zilla::Role::FileGatherer" => 0,
  "Dist::Zilla::Role::FileMunger" => 0,
  "Dist::Zilla::Role::PrereqSource" => 0,
  "Dist::Zilla::Role::TextTemplate" => 0,
  "ExtUtils::MakeMaker" => "7.22",
  "File::Spec" => 0,
  "File::pushd" => 0,
  "FindBin" => 0,
  "List::Util" => "1.45",
  "Module::Metadata" => "1.000015",
  "Moose" => 0,
  "Moose::Util::TypeConstraints" => 0,
  "Path::Tiny" => 0,
  "Sub::Exporter::ForMethods" => 0,
  "Test2::V0" => 0,
  "Test::DZil" => 0,
  "Test::MixedScripts" => "0.3.0",
  "Test::More" => 0,
  "Test::Warnings" => "0.009",
  "namespace::autoclean" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
