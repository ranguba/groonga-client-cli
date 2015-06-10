# -*- mode: ruby; coding: utf-8 -*-
#
# Copyright (C) 2013  Haruka Yoshihara <yoshihara@clear-code.com>
# Copyright (C) 2014-2015  Kouhei Sutou <kou@clear-code.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

remove_link = lambda do |entry|
  entry.gsub(/\[(.+?)\]\(.+?\)/, "\\1")
end

clean_white_space = lambda do |entry|
  entry.gsub(/(\A\n+|\n+\z)/, '') + "\n"
end

normalize = lambda do |entry|
  clean_white_space.call(remove_link.call(entry))
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
require "groonga-client-cli/version"

Gem::Specification.new do |spec|
  spec.name = "groonga-client-cli"
  spec.version = GroongaClientCLI::VERSION
  spec.homepage = "https://github.com/ranguba/groonga-client-cli"
  spec.authors = ["Kouhei Sutou"]
  spec.email = ["kou@clear-code.com"]

  readme = File.read("README.md")
  readme.force_encoding("UTF-8") if readme.respond_to?(:force_encoding)
  entries = readme.split(/^\#\#\s(.*)$/)
  clean_white_space.call(entries[entries.index("Description") + 1])
  raw_description = normalize.call(entries[entries.index("Description") + 1])
  summary, description, = raw_description.split(/\n\n+/, 3)
  spec.summary = summary.gsub(/\n+/, " ")
  spec.description = description.gsub(/\n+/, " ")
  spec.license = "LGPL-2.1"
  spec.files = ["README.md", "Rakefile", "Gemfile", "#{spec.name}.gemspec"]
  spec.files += [".yardopts"]
  spec.files += Dir.glob("lib/**/*.rb")
  spec.files += Dir.glob("doc/text/*")
  Dir.chdir("bin") do
    spec.executables = Dir.glob("*")
  end

  spec.add_runtime_dependency("groonga-client")
  spec.add_runtime_dependency("groonga-command-parser")

  spec.add_development_dependency("bundler")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("packnga")
  spec.add_development_dependency("redcarpet")
end
