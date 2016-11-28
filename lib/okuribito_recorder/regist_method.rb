require "yaml"

module OkuribitoRails
  class RegistMethod
    def update_observe_methods(path)
      input = yaml_to_array(path)
      base  = db_to_array
      new_methods = input - base
      new_methods.each do |new_method|
        array = new_method.split(/\s*(#|\.)\s*/)
        MethodCallSituation.create(class_name: array[0],
                                   method_symbol: array[1],
                                   method_name: array[2])
      end
      delete_methods = base - input
      delete_methods.each do |delete_method|
        array = delete_method.split(/\s*(#|\.)\s*/)
        MethodCallSituation.find_by(class_name: array[0],
                                    method_symbol: array[1],
                                    method_name: array[2]).destroy
      end
    end

    def yaml_to_array(path)
      yaml = YAML.load_file(path)
      methods_array = []
      yaml.each do |class_name, observe_methods|
        observe_methods.each do |observe_method|
          methods_array.push(class_name + observe_method)
        end
      end
      methods_array
    end

    def db_to_array
      methods_array = []
      results = MethodCallSituation.all
      results.each do |result|
        methods_array.push(result.class_name + result.method_symbol + result.method_name)
      end
      methods_array
    end
  end
end
