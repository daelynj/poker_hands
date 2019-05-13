
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "poker_hands/version"

Gem::Specification.new do |spec|
  spec.name          = "poker_hands"
  spec.version       = PokerHands::VERSION
  spec.authors       = ["daelynj"]
  spec.email         = ["daelyndbjones@gmail.com"]

  spec.summary       = %q{This gem simulates a two hand poker game.}
  spec.description   = %q{Given two poker hands, determine which poker hand wins and print it on the screen.}
  spec.homepage      = "https://github.com/daelynj/poker_hands"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
