class SheetsController < ApplicationController
  def index
    # @sheets = Sheet.all
    @sheets_order = Sheet.order(:row, :column).group_by(&:row)
  end
end
