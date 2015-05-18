# 
# INCLUDES
#

require 'rdiscount'


#
# GLOBAL CONFIGURATIONS
#
# Some common configurations that are used by the tasks
#
COMMON_IGNORES = [
  'LICENSE',
  'Rakefile',
  'config.ru',
  'readme.md',
  'version',
  /^Gemfile/,
  /^_site/,
  /^includes/,
  /guardfile/i,
  /template.html/,
  /bin/,
]

TEMPLATE_SKIPS = [ /^fonts\//, ]

HTML_CONFIG = {
  out_dir: '_site',
  ignore: [] | COMMON_IGNORES
}





#
# TASKS
#
# The various tasks that can be run. To see a full list, you an run
# the command `rake -T` from the command line.
#

desc 'Perform the default task (build:all)'
task :default => 'build:all'

desc 'Put the whole shebang into development mode'
task :dev => ['dev:setup', 'dev:serve', 'dev:guard']

#
# Build the site/books in various output formats or whateaver
#
namespace 'build' do

  desc 'build all output formats'
  task :all => [:html]

  desc 'build html outpu format'
  task :html do
    puts 'html task'
    build_html(
      HTML_CONFIG[:out_dir],
      HTML_CONFIG[:ignore],
      TEMPLATE_SKIPS
    )
  end
 
end


#
# Simple tasks for developing locally
#
namespace :dev do

  desc 'setup the development environment'
  task :setup do
    puts `bundle`
  end

  desc 'start a development server to view the site'
  task :serve => :setup do
    puts `bundle exec puma -d -p 9292 config.ru`
    puts 'Started site at localhost:9292'
  end

  desc 'Run "guard" to watch for file-system changes'
  task :guard do
    `bundle exec guard`
  end
end


#
# Publish to somewhere and stuff... idk
#
namespace 'publish' do
  #nothing
end




#
# HELPER FUNCTIONS / CLASSES
#
# Just some funcitons that either need to be extracted for re-use or because
# they are just too big for the task / readability.
#

def build_html(out_dir, ignores, t_skips)
  Dir.mkdir(out_dir) unless Dir.exist?(out_dir)
  Dir.glob('**/*') do |f|
    # check not in ignores
    next if ignores.map{|i|f.match(i)}.compact.length > 0

    # continue with building
    puts "Templating #{f}..."
    path = File.join(out_dir, to_html_name(f))
    if File.directory?(f)
      Dir.mkdir(path) unless Dir.exist?(path)
    else
      File.open(path, 'w') do |fw|
        if t_skips.map{|t| f.match(t)}.compact.length > 0
          fw.write(to_html(f, file_format(f)))
        else
          fw.write(template( to_html(f, file_format(f)) ))
        end
      end
    end
  end
end

# Convert the file from some known format to html
def to_html(file, format)
  content = file
  content = File.open(file).read if File.exist?(file)

  case format
  when 'markdown' 
    content = content.split('~~~')
    html = RDiscount.new(content.last).to_html
    content.first + html
  when 'none' 
    content
  end
end

def file_format(file_name)
  if file_name =~ /\.md$/
    'markdown'
  else
    'none'
  end
end

def to_html_name(file_name)
  file_name.gsub(/\.md$/, '.html')
end

def template(file)
  content = file
  content = File.open(file).read if File.exist?(content)

  # process includes
  content.scan(/(<#!\s*([a-z\.]+)\s*!#>)/i).each do |match|
    t_include = File.join('includes', match[1])
    content.sub!(match[0], File.open(t_include).read)
  end

  # process parent templates (reverse include)
  content.scan(/(<#!!\s*([a-z\.]+)\s*!!#>)/i).each do |match|
    parent_fn = match[1]
    parent_f = File.open(parent_fn).read
    parent_f.scan(/(<#!\+\s*include\s*\+!#>)/).each do |p_match|
      content.sub!(match[0], '')
      content = parent_f.gsub(p_match[0], content)
    end
  end

  # process version includes
  content.scan(/(<#!\+\s*version\s*\+!#>)/).each do |match|
    content.sub!(match[0], version())
  end

  has_t_macros(content) ? template(content) : content
end

def version; File.open('version').read; end

def has_t_macros(content)
  content.match(/<#.*?#>/) != nil
end
