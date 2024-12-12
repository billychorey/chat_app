# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3

pin "react", to: "https://cdn.skypack.dev/react@17/umd/react.production.min.js"
pin "react-dom", to: "https://cdn.skypack.dev/react-dom@17/umd/react-dom.production.min.js"

pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/components", under: "components" # Pin all components