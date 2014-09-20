module Ottrick
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Copy locale files to your application"
      def copy_locale
        ['en', 'de'].each do |lang|
          copy_file "../../../config/locales/#{lang}.yml",
                    "config/locales/ottrick.#{lang}.yml"
        end
      end

      desc "create initializer"
      def copy_initializer
        copy_file "initializers/ottrick.rb", "config/initializers/ottrick.rb"
      end
      desc "copy migrations"
      def copy_migrations
        cp_r(Dir['../../../db/migrate/*'],"db/migrate")
	#	copy_file "../../../db/migrate/ruby","db/migrate"
      end
    end
  end
end
