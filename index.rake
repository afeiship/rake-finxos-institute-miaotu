
namespace :app do
  desc "want to say hello"
  task :build, [:theme, :inst] do |task, args|
    args.with_defaults(:theme => "default", :inst => "tss_dailymeeting")
    p args
  end
end
