# frozen_string_literal: true

class DownloadsController < ApplicationController
  before_action :authenticate_user!

  def download
    unless download_params[:file]
      download_latest
      return
    end
    file = Rails.root.join('private', download_params[:file])
    if File.exist?(file)
      send_file file, :type=>"application/csv", :x_sendfile=>true
    else
      flash[:notice] = "File does not exist"
      redirect_to root_path
    end
  end

  def download_latest
    file = Dir.glob(Rails.root.join('storage', 'exports', '*')).max_by {|f| File.mtime(f)}
    if File.exist?(file)
      send_file file, :type=>"application/csv", :x_sendfile=>true
    else
      flash[:alert] = "File does not exist"
      redirect_to root_path
    end
  end

  def export_benchmarks
    unless current_user.admin?
      flash[:alert] = "You are not authorized to perform this action"
      return
    end
    file = ExportService.export_benchmarks
    send_file file, :type=>"application/csv", :x_sendfile=>true
    flash[:notice] = "Exported CSV"
  end

  private

  def download_params
    params.permit(:file)
  end
end