{:user { :plugins [[cider/cider-nrepl "0.7.0-SNAPSHOT"]
                   [lein-ancient "0.5.5"]
                   [lein-annotations "0.1.0"]
                   [lein-bikeshed "0.1.7"]]
        :dependencies [[pjstadig/humane-test-output "0.6.0"]
                       [slamhound "1.5.5"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
