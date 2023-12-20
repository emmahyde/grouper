module Serviceable
  extend ActiveSupport::Concern

  class_methods do
    def call(*args, **kwargs, &block)
      return new(*args, **kwargs).send(:call, &block) if block_given?

      new(*args, **kwargs).send(:call)
    end
  end
end
