require 'karmahrm_feed/engine'

module KarmaHrmFeed
  class Engine < ::Rails::Engine
    if defined?(ActsAsPluggable)
      ::ActsAsPluggable::Plugin.register(:karmahrm_feed, :activity, engine: self,
                                                                    description: 'Feed Plugin',
                                                                    website: 'https://github.com/tachyons/karmahrm_discussion',
                                                                    author: 'Aboobacker MK',
                                                                    version: KarmaHrmFeed::VERSION,
                                                                    settings: {
                                                                      display_in_topbar: true
                                                                    },
                                                                    menu: {
                                                                      url: {
                                                                        controller: :feeds,
                                                                        action: :index
                                                                      },
                                                                      class: 'fa fa-feed',
                                                                      text: 'Feeds'
                                                                    }
                                        )
      end
    config.to_prepare do
      # TODO: move these contents instead of polluting here
      require 'public_activity'
      klasses = [::Employee, ::Comment, ::Announcement]
      klasses.append(::Post) if defined?(::Post)
      klasses.each do |klass|
        klass.instance_eval do
          include PublicActivity::Model
          tracked owner: proc { |controller, _model| controller.current_user if controller.present? }
        end
      end
      ApplicationController.instance_eval { include PublicActivity::StoreController }
    end
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
  end
end
