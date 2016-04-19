{:user
 { :plugins [[lein-ancient "0.6.8"]               ; Looks for old libs
             [lein-annotations "0.1.0"]           ; Displays comment annotations
             [lein-marginalia "0.8.0"]            ; Document CLJ
             [lein-bikeshed "0.3.0"]              ; Code smells
             [jonase/eastwood "0.2.3"]            ; CLJ lint tool
             [lein-kibit "0.1.2"]                 ; Static code analyzer
             [refactor-nrepl "2.0.0"]             ; Refactoring tools
             [codox "0.9.4"]                      ; Generate API doc
             [lein-midje "3.2"]                   ; Testing framework
             [lein-pprint "1.1.2"]                ; Pretty pint
             [com.aphyr/prism "0.1.3"]            ; Autorun tests
             [luminus/lein-template "2.9.10.26"]]   ; get rid of after complete book

  :dependencies [[slamhound "1.5.5"]              ; ns cleanup
                 [com.aphyr/prism "0.1.3"]        ; Autorun tests
                 [pjstadig/humane-test-output "0.7.1"]]
  :injections [(require 'pjstadig.humane-test-output)
               (pjstadig.humane-test-output/activate!)]

  :aliases {"slamhound" ["run" "-m" "slam.hound"]}}

 :repl {:plugins [[cider/cider-nrepl "0.11.0"]]}

 ;; :repl-options
 ;; { :init
 ;;   (do
 ;;     (require '[clojure.java.javadoc :refer [javadoc]])
 ;;     (clojure.java.javadoc/add-local-javadoc "/usr/share/doc/openjdk-8-doc/api/"))}
 }
