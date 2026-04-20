class SheetsController < ApplicationController
  def index
    @sheets_order = Sheet.order(:row, :column).group_by(&:row)
  end
end
