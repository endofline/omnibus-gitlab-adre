# ADRE - A De-branding/Re-branding Exercise
# require via gitlab.rb (omnibus-gitlab)

base_folder = File.dirname(__FILE__) + "/adre/"

# backup location
text_time = Time.now.to_i
backup_folder = "#{base_folder}backups/#{text_time}/"

# reusable replace file function with automatic backup
def replace_if_available(source_path, pattern_destination, backup_folder)
  if File.file? (source_path)
    seekfile = Dir.glob(pattern_destination)
    if seekfile.length == 1
      destination_path = seekfile.first()
      basename = File.basename(destination_path)
      unless FileUtils.compare_file(source_path, destination_path)
        # backup
        unless File.directory? (backup_folder)
          FileUtils.mkdir_p(backup_folder)
        end
        FileUtils.cp(destination_path, "#{backup_folder}#{basename}")
        puts "backup: #{basename}"
        # replace
        FileUtils.cp(source_path, destination_path)
        puts("replace: #{basename}")
      else
        puts("identical: #{basename}")
      end
    else
      puts("multiples: #{source_path}")
    end
  else
    puts("not found: #{source_path}")
  end
end

if File.directory? ("#{base_folder}rebrand/")
  puts("***** ADRE: A Debranding/Rebranding Exercise *****")

  # brand_logo.png - the big logo on the login page
  replace_if_available(
    "#{base_folder}rebrand/brand_logo.png", 
    "/opt/gitlab/embedded/service/gitlab-rails/public/assets/brand_logo-*.png",
    backup_folder)

  # logo-black.png - tiny logo in the toolbar for some themes
  replace_if_available(
    "#{base_folder}rebrand/logo-black.png", 
    "/opt/gitlab/embedded/service/gitlab-rails/public/assets/logo-black-*.png",
    backup_folder)

  # logo-white.png - tiny logo in the toolbar for some themes
  replace_if_available(
    "#{base_folder}rebrand/logo-white.png", 
    "/opt/gitlab/embedded/service/gitlab-rails/public/assets/logo-white-*.png",
    backup_folder)

  # devise.html.haml - front page content
  replace_if_available(
    "#{base_folder}rebrand/devise.html.haml",
    "/opt/gitlab/embedded/service/gitlab-rails/app/views/layouts/devise.html.haml",
    backup_folder)

  # _promo.html.haml - links below project/group list
  replace_if_available(
    "#{base_folder}rebrand/_promo.html.haml",
    "/opt/gitlab/embedded/service/gitlab-rails/app/views/shared/_promo.html.haml",
    backup_folder)

  puts("***** ADRE: END *****")
end
