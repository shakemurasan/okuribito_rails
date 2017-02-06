namespace :okuribito_rails do
  desc "Integrate multiple method_call_situations records"
  task integrate_method_call_situations: :environment do
    puts "Integrate multiple method_call_situations records...."

    OkuribitoRails::MethodCallSituation.group_by_method.each do |situation|
      puts "#{situation.class_name}#{situation.method_symbol}#{situation.method_name}"
      situations = OkuribitoRails::MethodCallSituation.where(class_name: situation.class_name,
                                                             method_symbol: situation.method_symbol,
                                                             method_name: situation.method_name)
      if situations.size > 1
        sum = situations.pluck(:called_num).inject(0) { |a, e| a + e }
        situations[0].update(called_num: sum)
        situations[1..-1].each(&:destroy)
        puts "  integrate #{situations.size} records..."
      else
        puts "  nothing to do..."
      end
    end
  end
end
