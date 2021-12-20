Rails.application.routes.draw do
  get 'companies/community'
  root 'categories#home'

  get 'what_we_learnt_from_our_chat_with_gitlab', to: redirect('p/what_we_learnt_from_our_chat_with_gitlab', status:301)
  get 'google-does-a-workspace-refresh-for-remote-work', to: redirect('p/google-does-a-workspace-refresh-for-remote-work', status:301)
  get '10-things-you-should-know-to-run-successful-remote-meetings', to: redirect('p/10-things-you-should-know-to-run-successful-remote-meetings', status:301)
  get 'dropbox_wastes_no_time_prioritizing', to: redirect('p/dropbox_wastes_no_time_prioritizing', status:301)
  get 'virtual-garage', to: redirect('p/virtual-garage', status:301)
  get 'time-tracking-for-productivity', to: redirect('p/time-tracking-for-productivity', status:301)
  get 'state-of-remote-work-2021', to: redirect('p/state-of-remote-work-2021', status:301)
  get 'GitHub-GitLab-Bitbucket', to: redirect('p/GitHub-GitLab-Bitbucket', status:301)
  get 'best-note-taking-apps-used', to: redirect('p/best-note-taking-apps-used', status:301)
  get 'zoom-hybrid-work', to: redirect('p/zoom-hybrid-work', status:301)
  get 'why-should-you-not-use-slack', to: redirect('p/why-should-you-not-use-slack', status:301)
  get 'zillow-remote-pay', to: redirect('p/zillow-remote-pay', status:301)
  get 'find-my-first-paying-customer', to: redirect('p/find-my-first-paying-customer', status:301)
  get 'netflix-swot-analysis', to: redirect('p/netflix-swot-analysis', status:301)
  get 'recreating-chance-meetings', to: redirect('p/recreating-chance-meetings', status:301)
  get 'guide-to-recruiting-efficiently', to: redirect('p/guide-to-recruiting-efficiently', status:301)
  get 'sales-tip-for-start-up-founders', to: redirect('p/sales-tip-for-start-up-founders', status:301)
  get 'ultimate-productivity-trick', to: redirect('p/ultimate-productivity-trick', status:301)
  get 'mcdonalds-mission-statement', to: redirect('p/mcdonalds-mission-statement', status:301)
  get 'zero-code-less-build-time', to: redirect('p/zero-code-less-build-time', status:301)
  get 'i-want-to-find-new-ways-of-marketing-my-startup', to: redirect('p/i-want-to-find-new-ways-of-marketing-my-startup', status:301)
  get 'quidli_reward_employees_with_crypto', to: redirect('p/quidli_reward_employees_with_crypto', status:301)
  get 'bottlenecks-when-recruiting', to: redirect('p/bottlenecks-when-recruiting', status:301)
  get 'enhance-performance-of-cold-mails', to: redirect('p/enhance-performance-of-cold-mails', status:301)
  get 'improve-communication-for-remote-teams', to: redirect('p/improve-communication-for-remote-teams', status:301)
  get 'automate-internal-processes-at-startup', to: redirect('p/automate-internal-processes-at-startup', status:301)
  get 'increase-website-traffic', to: redirect('p/increase-website-traffic', status:301)
  get 'disconnecting-from-work-when-working-remotely', to: redirect('p/disconnecting-from-work-when-working-remotely', status:301)
  get 'balancing-the-best-of-both-the-worlds-fully-remote-vs-hybrid', to: redirect('p/balancing-the-best-of-both-the-worlds-fully-remote-vs-hybrid', status:301)
  get 'explaining-seo-as-a-story', to: redirect('p/explaining-seo-as-a-story', status:301)
  get 'understanding-the-deal-with-google-ads', to: redirect('p/understanding-the-deal-with-google-ads', status:301)
  get 'seven-functions-of-marketing', to: redirect('p/seven-functions-of-marketing', status:301)
  get 'mcdonalds-swot-analysis', to: redirect('p/mcdonalds-swot-analysis', status:301)

  get '/subscribe', to:'categories#subscribe'

  post '/create_newsletter_subscriber' => "categories#create_newsletter_subscriber", :as => "create_newsletter_subscriber"

  get 'all-posts', to:'resources#index'
  get '/all-articles', to: 'categories#core_articles_index'

  get 'startup-stages/:slug', to: 'categories#learning_path'
  get 'startup-functions/:slug', to: 'categories#learning_path'
  get 'startup-topics/:slug', to: 'categories#learning_path'

  get ':company/community', to: 'companies#community'
  get ':category-glossary', to:'categories#glossary'
  get '/:category/:slug', to:'categories#show'
  get ':category', to: 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
