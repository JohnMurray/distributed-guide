config = {
  html: {
    out_dir: '_site',
    ignore: [
      /^_site/,
      'LICENSE',
      'Rakefile',
      'readme.md',
      /^includes/
    ]
  },
  template_skips: [
    /^fonts\//
  ]
}


desc 'Perform the default task (build:all)'
task :default => 'build:all'

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
      config[:html][:out_dir],
      config[:html][:ignore],
      config[:template_skips]
    )
  end


  def build_html(out_dir, ignores, t_skips)
    Dir.mkdir(out_dir) unless Dir.exist?(out_dir)
    Dir.glob('**/*') do |f|
      # check not in ignores
      next if ignores.map{|i|f.match(i)}.compact.length > 0

      # continue with building
      puts "Templating #{f}..."
      path = File.join(out_dir, f)
      if File.directory?(f)
        Dir.mkdir(path) unless Dir.exist?(path)
      else
        File.open(path, 'w') do |fw|
          if t_skips.map{|t| f.match(t)}.compact.length > 0
            fw.write(File.open(f).read)
          else
            fw.write(template(f))
          end
        end
      end
    end
  end

  def template(file)
    template = File.open(file).read

    # process includes
    template.scan(/(<#!\s*([a-z\.]+)\s*!#>)/).each do |match|
      t_include = File.join('includes', match[1])
      template.sub!(match[0], File.open(t_include).read)
    end

    # process parent templates (reverse include)
    template
  end
 
end


#
# Publish to somewhere and stuff... idk
#
namespace 'publish' do
  #nothing
end
