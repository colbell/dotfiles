{:user
 { :plugins [[lein-ancient "0.6.8"]               ; Looks for old libs
             [lein-annotations "0.1.0"]           ; Displays comment annotations
             [lein-marginalia "0.8.0"]            ; Document CLJ
             [lein-bikeshed "0.2.0"]              ; Code smells
             [jonase/eastwood "0.2.3"]            ; CLJ lint tool
             [lein-kibit "0.1.2"]                 ; Static code analyzer
             [refactor-nrepl "1.2.0"]             ; Refactoring tools
             [codox "0.9.1"]                      ; Generate API doc
             [lein-midje "3.2"]                   ; Testing framework
             [lein-pprint "1.1.2"]                ; Pretty pint
             [com.aphyr/prism "0.1.3"]]           ; Autorun tests

  :dependencies [[slamhound "1.5.5"]              ; ns cleanup
                 [com.aphyr/prism "0.1.3"]]       ; Autorun tests

  :aliases {"slamhound" ["run" "-m" "slam.hound"]}}

 :repl {:plugins [[cider/cider-nrepl "0.10.0"]]}

 ;; :repl-options
 ;; { :init
 ;;   (do
 ;;     (require '[clojure.java.javadoc :refer [javadoc]])
 ;;     (clojure.java.javadoc/add-local-javadoc "/usr/share/doc/openjdk-8-doc/api/"))}
 }
