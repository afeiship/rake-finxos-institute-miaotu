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
    institute_filename = "./src/config/institutes/#{args[:inst]}.json"
    institute_json_object = JSON.parse File.read(institute_filename)
    Rake::Task["weapp:appid_update"].invoke(institute_json_object["weapp"]["app_id"])

    # build target:
    sh "cross-env NODE_ENV=#{args[:env]} webpack -p --env.institute=#{args[:inst]} --env.theme=#{args[:theme]}"
  end
end
