require 'find'
require 'fileutils'

# the path of the file that the dummy preset loads (open it with text editor to find out)
dummy_file_impulse = "/Library/Audio/Impulse Responses/Red Wire Impulses/MesaRectifierV30s/AKG C414B-ULS/MesaRectifierV30s-C414-Cap-0.5in.wav"
# the dummy preset itself
dummy_file = "Dummy Preset.pst"
# your library folder where I will look for IRs
impulse_folder = "/Library/Audio/Impulse Responses/"
# the target folder, where I should output presets
target_folder = './Space Designer/'

Find.find(impulse_folder) do |f|
  if (File.basename(f).include?(".wav") || File.basename(f).include?(".aiff"))
    # load strings
    oldfile = File.basename(dummy_file_impulse).ljust(70, 0.chr)
    oldpath = dummy_file_impulse.ljust(100, 0.chr)
    newfile = File.basename(f).ljust(70, 0.chr)
    newpath = f.ljust(100, 0.chr)
    patchpath = f.gsub(impulse_folder, target_folder).gsub('.wav', '.pst').gsub('.aiff', '.pst')

    # open the dummy preset file and replace strings
    template = open(dummy_file)
    content = template.read().gsub(oldpath, newpath).gsub(oldfile, newfile)
    template.close

    # create a directory for the patch
    FileUtils::mkdir_p(File.dirname(patchpath))

    # write down the patch
    patch = File.new(patchpath, "w")
    patch.write(content)
    patch.close
  end
end
