module ApplicationHelper
  def page_title
    "#{content_for?(:title) ? content_for(:title) : 'SPT'} | SPT"
  end

  def include_external_scripts
    external_scripts = [
      'https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js',
      'https://cdn.jsdelivr.net/npm/moment@2.27.0',
      'https://cdn.jsdelivr.net/npm/chartjs-adapter-moment@0.1.1'
    ]

    scripts_tags = external_scripts.map { |src| javascript_include_tag(src) }.join.html_safe

    bugsnag_script = <<-JS
      import BugsnagPerformance from '//d2wy8f7a9ursnm.cloudfront.net/v1/bugsnag-performance.min.js';
      BugsnagPerformance.start({ apiKey: '69ecd996995441de0200dd5a4373f79b' });
    JS

    scripts_tags + javascript_tag(bugsnag_script)
  end
end
