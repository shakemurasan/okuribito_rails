module OkuribitoRails
  if Rails::VERSION::MAJOR >= 5
    puts Rails::VERSION::MINOR
    class Migration < ActiveRecord::Migration["#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}"];end
  else
    class Migration < ActiveRecord::Migration;end
  end
end
