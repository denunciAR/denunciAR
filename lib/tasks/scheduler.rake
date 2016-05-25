namespace :scheduler do
  desc 'Search recent tweets'
  task twitter_search: :environment do
    TwitterSearch.perform_async
  end
end
