require 'xcodeproj'
require 'plist'

class ClassB

  attr_accessor :project
  attr_accessor :buildNumber
  attr_accessor :version
  attr_accessor :plist

  def initialize
    @project = nil
    @buildNumber = '0.0'
    @version = '0.0.0'
    @plist = Hash.new
  end

  def readProject(dir, name)
    @project = Xcodeproj::Project.open "#{dir}/#{name}/#{name}.xcodeproj"
    @plistPath = "#{dir}/#{name}/#{name}/Info.plist"
    @plist = Plist.parse_xml @plistPath
    @buildNumber = plist["CFBundleVersion"]
    @version = plist["CFBundleShortVersionString"]
    puts "got version number #{@version}"
  end

  def bumpBuildNum
    buildNumComps = @buildNumber.split '.'
    i = buildNumComps.last.to_i
    i += 1
    buildNumComps[buildNumComps.length - 1] = i.to_s
    @buildNumber = buildNumComps.join '.'
    @plist["CFBundleVersion"] = @buildNumber
    File.truncate(@plistPath, 0)
    File.open(@plistPath, 'w') { |f|
      f.write Plist::Emit.dump(@plist)
    }
  end

end
