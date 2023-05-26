class SampleController < ApplicationController
  def get
    render json: { status: "success" }
  end
end
