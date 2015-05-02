{:user
 { :plugins [[cider/cider-nrepl "0.9.0-SNAPSHOT"] ; nREPL middleware for cider
             [lein-ancient "0.6.7"]               ; Looks for old libs
             [lein-annotations "0.1.0"]           ; Displays comment annotations
                                                  ; in proj
             [lein-marginalia "0.8.0"]            ; Document CLJ
             [lein-bikeshed "0.2.0"]              ; Code smells
             [jonase/eastwood "0.2.1"]            ; CLJ lint tool
             [lein-kibit "0.1.2"]                 ; Static code analyzer
             [refactor-nrepl "1.0.5"]             ; Refactoring tools
             [codox "0.8.12"]                     ; Generate API doc
             [lein-midje "3.1.3"]                 ; Testing framework
             [lein-pprint "1.1.2"]                ; Pretty pint
             [com.aphyr/prism "0.1.3"]]           ; Autorun tests

  :dependencies [[slamhound "1.5.5"]              ; ns cleanup
                 [com.aphyr/prism "0.1.3"]]       ; Autorun tests

  :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
