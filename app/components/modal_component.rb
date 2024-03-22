# frozen_string_literal: true

class ModalComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def super(title:)
    @title = title
  end
end
