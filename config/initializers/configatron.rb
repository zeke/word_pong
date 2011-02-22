configatron.configure_from_yaml(Rails.root.join('config', 'config.yml'))
configatron.configure_from_yaml(Rails.root.join('config', 'secrets.yml')) unless Rails.env == 'production'