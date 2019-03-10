require "json"

namespace :app do
  desc "Special task institute-miaotu project"
  task :build, [:theme, :inst, :env] do |task, args|
    args.with_defaults(
      :theme => "default",
      :inst => "tss_dailymeeting",
      :env => "production",
    )

    # update wxappid:
    NODE_MODULES = "#{Dir.pwd}/node_modules/.bin/"
    institute_filename = "./src/config/institutes/#{args[:inst]}.json"
    institute_json_object = JSON.parse File.read(institute_filename)

    theme_filename = "./src/config/themes/#{args[:theme]}.json"
    theme_json_object = JSON.parse File.read(theme_filename)
    Rake::Task["weapp:appid_update"].invoke(institute_json_object["weapp"]["app_id"])
    Rake::Task["weapp:app_tabbar_update"].invoke(theme_json_object["tabs"])

    # build target:

    sh "#{NODE_MODULES}cross-env NODE_ENV=#{args[:env]} #{NODE_MODULES}webpack -p --env.institute=#{args[:inst]} --env.theme=#{args[:theme]}"
  end

  desc "Sync iconfonts."
  task :icons, [:url, :filename] do |task, args|
    args.with_defaults(
      :url => "default",
      :filename => "./src/assets/styles/icons-inst.scss",
    )

    Rake::Task["iconfont:sync_css"].invoke(args[:url], args[:filename])
  end

  desc "Reset project."
  task :reset, [:inst] do |task, args|
    args.with_defaults(
      :inst => "tss_dailymeeting",
    )
    institute_filename = "./src/config/institutes/#{args[:inst]}.json"
    institute_json_object = JSON.parse File.read(institute_filename)
    Rake::Task["weapp:appid_update"].invoke(institute_json_object["weapp"]["app_id"])
  end
end
